From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] pinctrl: sprd: fix build errors and dependencies
Date: Mon, 4 Sep 2017 08:35:28 -0700
Message-ID: <cef46365-5695-ee20-c2cf-12cad823d179@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when CONFIG_OF is not enabled.
Also, the pinctrl-sprd-sc9860 driver uses functions from the pinctrl-sprd
driver, so the former should depend on the latter driver.

../drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
../drivers/pinctrl/sprd/pinctrl-sprd.c:290:2: error: implicit declaration of function 'pinconf_generic_parse_dt_config' [-Werror=implicit-function-declaration]
  ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
  ^
../drivers/pinctrl/sprd/pinctrl-sprd.c: At top level:
../drivers/pinctrl/sprd/pinctrl-sprd.c:844:44: error: array type has incomplete element type
 static const struct pinconf_generic_params sprd_dt_params[] = {
                                            ^
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/sprd/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

Why are these drivers not buildable as loadable modules?
I.e., why bool instead of tristate?

--- linux-next-20170904.orig/drivers/pinctrl/sprd/Kconfig
+++ linux-next-20170904/drivers/pinctrl/sprd/Kconfig
@@ -8,10 +8,12 @@ config PINCTRL_SPRD
 	select PINCONF
 	select GENERIC_PINCONF
 	select GENERIC_PINMUX_FUNCTIONS
+	depends on OF
 	help
 	  Say Y here to enable Spreadtrum pinctrl driver
 
 config PINCTRL_SPRD_SC9860
 	bool "Spreadtrum SC9860 pinctrl driver"
+	depends on PINCTRL_SPRD
 	help
 	  Say Y here to enable Spreadtrum SC9860 pinctrl driver
