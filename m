From: Andreas Bofjall <andreas@gazonk.org>
Subject: [PATCH] gpio: f7188x: add GPIO support for F71869
Date: Thu, 25 Dec 2014 01:27:35 +0100
Message-ID: <1419467255-9658-1-git-send-email-andreas@gazonk.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxf5.bahnhof.se ([213.80.101.29]:50732 "EHLO mxf5.bahnhof.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751590AbaLYA7J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Dec 2014 19:59:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andreas Bofjall <andreas@gazonk.org>

Add support for the GPIOs found on the Fintek SuperI/O chip F71869, such
as the one found on the Jetway JNF99-525 motherboard, to the f7188x gpio
driver.

Signed-off-by: Andreas Bofjall <andreas@gazonk.org>
---
 drivers/gpio/Kconfig       |  4 ++--
 drivers/gpio/gpio-f7188x.c | 25 ++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 633ec21..0291c41 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -188,11 +188,11 @@ config GPIO_MM_LANTIQ
 	  created by attaching a 16bit latch to the bus.
 
 config GPIO_F7188X
-	tristate "F71882FG and F71889F GPIO support"
+	tristate "F71869, F71882FG and F71889F GPIO support"
 	depends on X86
 	help
 	  This option enables support for GPIOs found on Fintek Super-I/O
-	  chips F71882FG and F71889F.
+	  chips F71869, F71882FG and F71889F.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 1be291a..f7a42c3 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -1,5 +1,5 @@
 /*
- * GPIO driver for Fintek Super-I/O F71882 and F71889
+ * GPIO driver for Fintek Super-I/O F71869, F71882 and F71889
  *
  * Copyright (C) 2010-2013 LaCie
  *
@@ -32,12 +32,14 @@
 #define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
 
 #define SIO_FINTEK_ID		0x1934	/* Manufacturer ID */
+#define SIO_F71869_ID		0x1007	/* F71869 chipset ID */
 #define SIO_F71882_ID		0x0541	/* F71882 chipset ID */
 #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
 
-enum chips { f71882fg, f71889f };
+enum chips { f71869, f71882fg, f71889f };
 
 static const char * const f7188x_names[] = {
+	"f71869",
 	"f71882fg",
 	"f71889f",
 };
@@ -146,6 +148,16 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 /* Output mode register (0:open drain 1:push-pull). */
 #define gpio_out_mode(base) (base + 3)
 
+static struct f7188x_gpio_bank f71869_gpio_bank[] = {
+	F7188X_GPIO_BANK(0, 6, 0xF0),
+	F7188X_GPIO_BANK(10, 8, 0xE0),
+	F7188X_GPIO_BANK(20, 8, 0xD0),
+	F7188X_GPIO_BANK(30, 8, 0xC0),
+	F7188X_GPIO_BANK(40, 8, 0xB0),
+	F7188X_GPIO_BANK(50, 5, 0xA0),
+	F7188X_GPIO_BANK(60, 6, 0x90),
+};
+
 static struct f7188x_gpio_bank f71882_gpio_bank[] = {
 	F7188X_GPIO_BANK(0 , 8, 0xF0),
 	F7188X_GPIO_BANK(10, 8, 0xE0),
@@ -281,6 +293,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (sio->type) {
+	case f71869:
+		data->nr_bank = ARRAY_SIZE(f71869_gpio_bank);
+		data->bank = f71869_gpio_bank;
+		break;
 	case f71882fg:
 		data->nr_bank = ARRAY_SIZE(f71882_gpio_bank);
 		data->bank = f71882_gpio_bank;
@@ -354,6 +370,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 
 	devid = superio_inw(addr, SIO_DEVID);
 	switch (devid) {
+	case SIO_F71869_ID:
+		sio->type = f71869;
+		break;
 	case SIO_F71882_ID:
 		sio->type = f71882fg;
 		break;
@@ -450,6 +469,6 @@ static void __exit f7188x_gpio_exit(void)
 }
 module_exit(f7188x_gpio_exit);
 
-MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71882FG and F71889F");
+MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71882FG and F71889F");
 MODULE_AUTHOR("Simon Guinot <simon.guinot@sequanux.org>");
 MODULE_LICENSE("GPL");
-- 
2.1.4

