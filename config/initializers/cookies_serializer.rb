# Be sure to restart your server when you modify this file.

# For now user :marshal for compatibility with the main rails app.
# Change to :json or :hybrid once the main rails app is upgraded to rails 4.1
# See https://github.com/wantedly/wantedly/issues/12097
Rails.application.config.action_dispatch.cookies_serializer = :marshal
