class Wantedly
  # blue -> green -> yellow -> orange -> red -> brown -> black
  WANTEDLY_MAIN_COLORS = ["#003c69", "#14a1bf", "#41b9a3", "#a2c95b", "#fed100", "#fe8900", "#ff4000", "#883317", "#24282a", "#6a6e71"].freeze
  WANTEDLY_SUB_COLORS = ["#406d8f", "#4fb9cf", "#71cbba", "#b9d784", "#fedd40", "#fea740", "#ff7040", "#a66651", "#5b5e5f", "8f9295"].freeze
  WANTEDLY_INTERCHANGED_COLORS = [WANTEDLY_MAIN_COLORS, WANTEDLY_SUB_COLORS].transpose.flatten.freeze

  APP_SOURCES = [
    :pc_web,
    :mobile_web,
    :iphone_app,
    :android_app,
    :iphone_contacts,
    :iphone_admin,
    :iphone_share,
    :iphone_siori,
    :iphone_address_exchange,
    :iphone_student,
    :android_student,
    :iphone_sync,
    :android_sync,
    :mac_sync,
    :win_sync,
    :web_sync,
    :open_api,
  ].freeze
  APP_SOURCES_HASH = Hash[APP_SOURCES.map.with_index.to_a].freeze
  # NOTE: App groups are defined in AppInstallation (like sync, visit).
end
