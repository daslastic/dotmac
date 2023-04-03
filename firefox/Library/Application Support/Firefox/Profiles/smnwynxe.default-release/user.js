/* user.js
 * https://github.com/rafaelmardojai/firefox-gnome-theme/
 */

// Enable customChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Set UI density to normal
user_pref("browser.uidensity", 0);

// Enable SVG context-propertes
user_pref("svg.context-properties.content.enabled", true);

// Disable private window dark theme
user_pref("browser.theme.dark-private-windows", false);

user_pref("gnomeTheme.hideSingleTab", true);
user_pref("gnomeTheme.bookmarksToolbarUnderTabs", true);
user_pref("gnomeTheme.systemIcons", false);

user_pref("browser.tabs.tablint.enabled", false);
user_pref("browser.tabs.tabmanager.enabled", false);
