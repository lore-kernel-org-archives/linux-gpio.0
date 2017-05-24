From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH] gpio: mvebu: Select REGMAP_MMIO now that regmap is used
Date: Wed, 24 May 2017 16:32:06 +0200
Message-ID: <20170524143206.9727-1-gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42384 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752136AbdEXOcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 10:32:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>

Since the commit "gpio: mvebu: switch to regmap for register access" the
driver use the regmap. Explicitly select the REGMAP_MMIO symbol to fix
build error.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 45ed9acfd095..68d9e6bde14d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -339,6 +339,7 @@ config GPIO_MVEBU
 	depends on PLAT_ORION
 	depends on OF_GPIO
 	select GENERIC_IRQ_CHIP
+	select REGMAP_MMIO
 
 config GPIO_MXC
 	def_bool y
-- 
2.11.0

