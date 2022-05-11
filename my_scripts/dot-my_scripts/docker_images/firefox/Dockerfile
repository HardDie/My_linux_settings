# docker build -t my/firefox .
FROM my/base

RUN pacman --cachedir /tmp -Sy --noconfirm git make firefox && \
	git clone https://github.com/girst/LegacyFox-mirror-of-git.gir.st /tmp/patch && \
	make -C /tmp/patch install && \
	pacman --cachedir /tmp -Rsn --noconfirm git make && \
	pacman --cachedir /tmp -Scc --noconfirm && \
	rm -rf /tmp/*

# https://habr.com/ru/post/548064/
RUN echo 'pref("toolkit.telemetry.archive.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.rejected", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.server", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.unified", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.unifiedIsOptIn", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.prompted", 2);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("security.ssl.errorReporting.automatic", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.identity.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.bhrPing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.coverage.opt-out", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.firstShutdownPing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.hybridContent.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.infoURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.newProfilePing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.reportingpolicy.firstRun", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.shutdownPingSender.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("toolkit.telemetry.updatePing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.ping-centre.telemetry", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.countryCode", "US");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.geoSpecificDefaults", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.geoSpecificDefaults.url", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.geoip.url", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.hiddenOneOffs", "Bing,Amazon.com,Twitter");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.search.region", "US");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("geo.wifi.uri", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.blockedURIs.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.block_dangerous", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.block_uncommon", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.malware.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.phishing.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.advisoryURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.gethashURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.lists", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.pver", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.reportMalwareMistakeURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.reportPhishMistakeURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.reportURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google.updateURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.advisoryName", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.advisoryURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.dataSharingURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.gethashURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.lastupdatetime", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.lists", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.nextupdatetime", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.pver", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.reportPhishMistakeURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.reportURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.google4.updateURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.mozilla.gethashURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.mozilla.lists", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.mozilla.pver", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.provider.mozilla.updateURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("datareporting.healthreport.service.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.urlbar.clickSelectsAll", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.urlbar.maxRichResults", 15);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.urlbar.trimURLs", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("datareporting.healthreport.uploadEnabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("datareporting.policy.dataSubmissionEnabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("datareporting.policy.firstRunURL", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("device.sensors.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("device.sensors.motion.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("device.sensors.orientation.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("devtools.aboutdebugging.showSystemAddons", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("devtools.onboarding.telemetry.logged", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("devtools.theme", "dark");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("devtools.toolbox.splitconsoleEnabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("general.useragent.override", "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/64.0");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("general.useragent.vendor", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("general.useragent.vendorSub", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("general.warnOnAboutConfig", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.aboutConfig.showWarning", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("media.autoplay.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("privacy.userContext.enabled", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("privacy.userContext.longPressBehavior", 2);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("privacy.userContext.ui.enabled", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("privacy.resistFingerprinting", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("geo.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.library.activity-stream.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.feeds.places", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.feeds.telemetry", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.filterAdult", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.prerender", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.showSponsored", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.telemetry", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.tippyTop.service.endpoint", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.topSitesRows", 3);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.enhanced", true);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("extensions.pocket.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js

# Disable auto requests
RUN echo 'pref("extensions.blocklist.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.safebrowsing.downloads.remote.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("network.prefetch-next", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("network.dns.disablePrefetch", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.feeds.asrouterfeed", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("messaging-system.rsexperimentloader.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("app.normandy.optoutstudies.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("app.normandy.enable", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("extensions.getAddons.cache.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("app.normandy.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("network.captive-portal-service.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("network.connectivity-service.enabled", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.urlbar.suggest.topsites", false);' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js && \
	echo 'pref("browser.newtabpage.activity-stream.default.sites", "");' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js

RUN chown user:users /tmp
WORKDIR /home/user
USER user

ENTRYPOINT [ "firefox" ]
