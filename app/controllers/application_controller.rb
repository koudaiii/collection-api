class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", status: :not_found, layout: nil }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  # uri/commpn.rb has bug related to RESERVED (RFC 2732) so need to remove '[' and ']' from safe characters.
  UNSAFE_URL = /[^\-_.!~*'()a-zA-Z\d;\/?:@&=+$,]/  # URL::UNSAFE - '\[\]'
  REFERER_NOT_GIVEN = "(not given)"
  REFERER_INVALID = "(invalid url)"
  def referer_host
    begin
      result = request.referer ? URI.parse(URI.escape(request.referer, UNSAFE_URL)).host : REFERER_NOT_GIVEN
    rescue URI::InvalidURIError
      result = REFERER_INVALID
    end
    result
  end
  helper_method :referer_host

  protected
  def current_country
    :japan  # TODO(awakia): Fix when collection start considering other country
  end

  def is_mobile?
    (request.mobile? || request.smart_phone?) && !request.mobile.tablet?
  end

  def request_app_name
    (env['HTTP_X_WANTEDLY_APP_NAME'] || params[:app_name]).try(:to_sym)
  end

  def request_source
    if request_app_name
      request_app_name
    else
      is_mobile? ? :mobile_web : :pc_web
    end
  end

  def request_source_cd
    ::Wantedly::APP_SOURCES_HASH[request_source]
  end

  def background_fetch?
    request.headers['HTTP_X_BACKGROUND_FETCH'].to_b
  end
end
