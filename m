From: Andreas Bofjall <andreas@gazonk.org>
Subject: [PATCH RESEND 3/3] gpio: f7188x: add GPIO support for F71869A
Date: Mon,  9 Mar 2015 21:55:14 +0100
Message-ID: <1425934514-1023-4-git-send-email-andreas@gazonk.org>
References: <1425934514-1023-1-git-send-email-andreas@gazonk.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxf4.bahnhof.se ([213.80.101.28]:61608 "EHLO mxf4.bahnhof.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752393AbbCIVb3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 17:31:29 -0400
In-Reply-To: <1425934514-1023-1-git-send-email-andreas@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Les Schaffer <schaffer@optonline.net>, Andreas Bofjall <andreas@gazonk.org>

Add support for the GPIOs found on the Fintek SuperI/O chip F71869A,
such as the one found on the Jetway JNF99-525 motherboard, to the f7188x
gpio driver.

Signed-off-by: Andreas Bofjall <andreas@gazonk.org>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/Kconfig       |  4 ++--
 drivers/gpio/gpio-f7188x.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b64aa78..2c10de2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -198,11 +198,11 @@ config GPIO_MM_LANTIQ
 	  created by attaching a 16bit latch to the bus.
 
 config GPIO_F7188X
-	tristate "F71869, F71882FG and F71889F GPIO support"
+	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
 	depends on X86
 	help
 	  This option enables support for GPIOs found on Fintek Super-I/O
-	  chips F71869, F71882FG and F71889F.
+	  chips F71869, F71869A, F71882FG and F71889F.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index ac677bf..dbda843 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -1,5 +1,5 @@
 /*
- * GPIO driver for Fintek Super-I/O F71869, F71882 and F71889
+ * GPIO driver for Fintek Super-I/O F71869, F71869A, F71882 and F71889
  *
  * Copyright (C) 2010-2013 LaCie
  *
@@ -33,13 +33,15 @@
 
 #define SIO_FINTEK_ID		0x1934	/* Manufacturer ID */
 #define SIO_F71869_ID		0x0814	/* F71869 chipset ID */
+#define SIO_F71869A_ID		0x1007	/* F71869A chipset ID */
 #define SIO_F71882_ID		0x0541	/* F71882 chipset ID */
 #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
 
-enum chips { f71869, f71882fg, f71889f };
+enum chips { f71869, f71869a, f71882fg, f71889f };
 
 static const char * const f7188x_names[] = {
 	"f71869",
+	"f71869a",
 	"f71882fg",
 	"f71889f",
 };
@@ -158,6 +160,17 @@ static struct f7188x_gpio_bank f71869_gpio_bank[] = {
 	F7188X_GPIO_BANK(60, 6, 0x90),
 };
 
+static struct f7188x_gpio_bank f71869a_gpio_bank[] = {
+	F7188X_GPIO_BANK(0, 6, 0xF0),
+	F7188X_GPIO_BANK(10, 8, 0xE0),
+	F7188X_GPIO_BANK(20, 8, 0xD0),
+	F7188X_GPIO_BANK(30, 8, 0xC0),
+	F7188X_GPIO_BANK(40, 8, 0xB0),
+	F7188X_GPIO_BANK(50, 5, 0xA0),
+	F7188X_GPIO_BANK(60, 8, 0x90),
+	F7188X_GPIO_BANK(70, 8, 0x80),
+};
+
 static struct f7188x_gpio_bank f71882_gpio_bank[] = {
 	F7188X_GPIO_BANK(0 , 8, 0xF0),
 	F7188X_GPIO_BANK(10, 8, 0xE0),
@@ -297,6 +310,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(f71869_gpio_bank);
 		data->bank = f71869_gpio_bank;
 		break;
+	case f71869a:
+		data->nr_bank = ARRAY_SIZE(f71869a_gpio_bank);
+		data->bank = f71869a_gpio_bank;
+		break;
 	case f71882fg:
 		data->nr_bank = ARRAY_SIZE(f71882_gpio_bank);
 		data->bank = f71882_gpio_bank;
@@ -373,6 +390,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	case SIO_F71869_ID:
 		sio->type = f71869;
 		break;
+	case SIO_F71869A_ID:
+		sio->type = f71869a;
+		break;
 	case SIO_F71882_ID:
 		sio->type = f71882fg;
 		break;
@@ -469,6 +489,6 @@ static void __exit f7188x_gpio_exit(void)
 }
 module_exit(f7188x_gpio_exit);
 
-MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71882FG and F71889F");
+MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71882FG and F71889F");
 MODULE_AUTHOR("Simon Guinot <simon.guinot@sequanux.org>");
 MODULE_LICENSE("GPL");
-- 
2.1.4

