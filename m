From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio/pinctrl: ingenic: depend on OF
Date: Mon, 29 May 2017 13:42:11 +0200
Message-ID: <20170529114211.8683-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:33473 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdE2LmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:42:18 -0400
Received: by mail-lf0-f45.google.com with SMTP id m18so33424368lfj.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:42:17 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>

Fix compile errors due to missing OF.

Cc: Paul Cercueil <paul@crapouillou.net>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig    | 1 +
 drivers/pinctrl/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 64bc995df191..395c85df48fd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -244,6 +244,7 @@ config GPIO_ICH
 
 config GPIO_INGENIC
 	tristate "Ingenic JZ47xx SoCs GPIO support"
+	depends on OF
 	depends on MACH_INGENIC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index abc1cef7ad96..7ae04a97e530 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -312,6 +312,7 @@ config PINCTRL_ZYNQ
 config PINCTRL_INGENIC
 	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
 	default y
+	depends on OF
 	depends on MACH_INGENIC || COMPILE_TEST
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
-- 
2.9.4

