# Be sure to restart your server when you modify this file.
key_suffix = ENV['RAILS_ENV'] || ''
Rails.application.config.session_store :cookie_store, key: "_huntr_session_" + key_suffix, domain: :all, expires: 1.month.from_now
