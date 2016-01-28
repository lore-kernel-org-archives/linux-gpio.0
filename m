From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 2/5] gpio: ath79: Allow building in compile tests
Date: Thu, 28 Jan 2016 20:44:30 +0100
Message-ID: <1454010273-21513-2-git-send-email-albeu@free.fr>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:61481 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965584AbcA1Toz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 14:44:55 -0500
In-Reply-To: <1454010273-21513-1-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>

To allow building the driver in compile tests we must drop the
dependency on asm/mach-ath79/ar71xx_regs.h. For this we replace the
include with local definition of the registers needed for this driver.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-ath79.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ee9909c..04118f3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -129,7 +129,7 @@ config GPIO_AMDPT
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
-	depends on ATH79
+	depends on ATH79 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Select this option to enable GPIO driver for
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 13d9648..afb535e 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -16,7 +16,10 @@
 #include <linux/platform_data/gpio-ath79.h>
 #include <linux/of_device.h>
 
-#include <asm/mach-ath79/ar71xx_regs.h>
+#define AR71XX_GPIO_REG_OE		0x00
+#define AR71XX_GPIO_REG_IN		0x04
+#define AR71XX_GPIO_REG_SET		0x0c
+#define AR71XX_GPIO_REG_CLEAR		0x10
 
 struct ath79_gpio_ctrl {
 	struct gpio_chip gc;
-- 
2.0.0

