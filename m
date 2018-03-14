From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 24/47] gpio: remove etraxfs driver
Date: Wed, 14 Mar 2018 16:35:37 +0100
Message-ID: <20180314153603.3127932-25-arnd@arndb.de>
References: <20180314153603.3127932-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314153603.3127932-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The cris architecture is getting removed, so we no longer need the
etraxfs driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../devicetree/bindings/gpio/gpio-etraxfs.txt      |  22 -
 drivers/gpio/Kconfig                               |   9 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/gpio-etraxfs.c                        | 475 ---------------------
 4 files changed, 507 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
 delete mode 100644 drivers/gpio/gpio-etraxfs.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
deleted file mode 100644
index 170194af3027..000000000000
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6b1ee11295d5..43c85cbfb878 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -181,15 +181,6 @@ config GPIO_EP93XX
 	depends on ARCH_EP93XX
 	select GPIO_GENERIC
 
-config GPIO_ETRAXFS
-	bool "Axis ETRAX FS General I/O"
-	depends on CRIS || COMPILE_TEST
-	depends on OF_GPIO
-	select GPIO_GENERIC
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support the GPIO controller on Axis ETRAX FS SoCs.
-
 config GPIO_EXAR
 	tristate "Support for GPIO pins on XR17V352/354/358"
 	depends on SERIAL_8250_EXAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 5c1f087c65aa..c92c5d78bb04 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -47,7 +47,6 @@ obj-$(CONFIG_GPIO_DLN2)		+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DWAPB)	+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EM)		+= gpio-em.o
 obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
-obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o
 obj-$(CONFIG_GPIO_EXAR)		+= gpio-exar.o
 obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
 obj-$(CONFIG_GPIO_FTGPIO010)	+= gpio-ftgpio010.o
diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
deleted file mode 100644
index 94db1bf4bfdb..000000000000
-- 
2.9.0
