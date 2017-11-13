From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: Add some depends on HAS_IOMEM
Date: Mon, 13 Nov 2017 11:07:39 +0100
Message-ID: <20171113100739.4354-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:57106 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbdKMKJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 05:09:44 -0500
Received: by mail-lf0-f66.google.com with SMTP id g35so3354662lfi.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2017 02:09:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Some compilation fallout from UM Linux (which does not have
IOMEM) makes it necessary to depend on HAS_IOMEM for drivers
that doesn't have other factors restricting their selection.

Cc: Phil Reid <preid@electromag.com.au>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Reported-by: R. Daneel Olivaw <kbuild-all@01.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 92bf1a06162c..f5ca67caac41 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -98,6 +98,7 @@ config PINCTRL_AT91PIO4
 
 config PINCTRL_AMD
 	tristate "AMD GPIO pin control"
+	depends on HAS_IOMEM
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINCONF
@@ -201,6 +202,7 @@ config PINCTRL_RZA1
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
 	depends on OF
+	depends on HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.13.6

