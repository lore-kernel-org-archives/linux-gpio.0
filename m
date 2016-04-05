From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 02/63] gpio: tegra: Allow compile test
Date: Tue,  5 Apr 2016 19:35:11 +0200
Message-ID: <1459877772-11289-3-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:51956 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751589AbcDERgr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:47 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Allow compile testing this driver by adding a new config option which
is enabled by default and depends on the old symbol or COMPILE_TEST.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig  | 5 +++++
 drivers/gpio/Makefile | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4983816a03db..2569ee8cfffc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -400,6 +400,11 @@ config GPIO_TB10X
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO
 
+config GPIO_TEGRA
+	bool
+	default y
+	depends on ARCH_TEGRA || COMPILE_TEST
+
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1e0b74f3b1ed..06192813b248 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_GPIO_SX150X)	+= gpio-sx150x.o
 obj-$(CONFIG_GPIO_SYSCON)	+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
-obj-$(CONFIG_ARCH_TEGRA)	+= gpio-tegra.o
+obj-$(CONFIG_GPIO_TEGRA)	+= gpio-tegra.o
 obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
 obj-$(CONFIG_GPIO_TPIC2810)	+= gpio-tpic2810.o
-- 
2.8.0

