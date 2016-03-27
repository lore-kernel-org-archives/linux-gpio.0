From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] [RFC] gpio: gpio-it87: Add support for IT8620 and IT8628
Date: Sun, 27 Mar 2016 17:43:02 +0200
Message-ID: <1459093382-23119-2-git-send-email-martin.blumenstingl@googlemail.com>
References: <1459076863-26014-1-git-send-email-martin.blumenstingl@googlemail.com>
 <1459093382-23119-1-git-send-email-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33308 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338AbcC0Pn2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 11:43:28 -0400
Received: by mail-wm0-f66.google.com with SMTP id 77so4175545wmi.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2016 08:43:27 -0700 (PDT)
In-Reply-To: <1459093382-23119-1-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: jdelvare@suse.com, linus.walleij@linaro.org, gnurou@gmail.com, denis@compulab.co.il, flameeyes@flameeyes.eu, cvubrugier@fastmail.fm, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

These chips seem to have a 9th GPIO block (thus supporting 72 GPIOs)
which is configured through SuperIO register 0xd2 (output enable) and
0xd3 (simple I/O). This is also the reason why io_size is larger than
on IT8728 / IT8732. Unfortunately I don't have hardware to test this 9th
GPIO block.
I am also not sure about not configuring the Simple I/O registers as the
hardware I have only uses GPIO block 8. Reading back the values of
0xc0-0xc7 (as configured by the BIOS/EFI on my board) shows that all
have 0xff set.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/Kconfig     |  2 +-
 drivers/gpio/gpio-it87.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5f3429f..729e650 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -557,7 +557,7 @@ config GPIO_IT87
 	  Say yes here to support GPIO functionality of IT87xx Super I/O chips.
 
 	  This driver is tested with ITE IT8728 and IT8732 Super I/O chips, and
-	  supports the IT8761E Super I/O chip as well.
+	  supports the IT8761E, IT8620E and IT8628E Super I/O chip as well.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio_it87
diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index b219c82..63a962d 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -34,6 +34,8 @@
 
 /* Chip Id numbers */
 #define NO_DEV_ID	0xffff
+#define IT8620_ID	0x8620
+#define IT8628_ID	0x8628
 #define IT8728_ID	0x8728
 #define IT8732_ID	0x8732
 #define IT8761_ID	0x8761
@@ -302,6 +304,14 @@ static int __init it87_gpio_init(void)
 	it87_gpio->chip = it87_template_chip;
 
 	switch (chip_type) {
+	case IT8620_ID:
+	case IT8628_ID:
+		gpio_ba_reg = 0x62;
+		it87_gpio->io_size = 11;
+		it87_gpio->output_base = 0xc8;
+		it87_gpio->simple_size = 0;
+		it87_gpio->chip.ngpio = 64;
+		break;
 	case IT8728_ID:
 	case IT8732_ID:
 		gpio_ba_reg = 0x62;
-- 
2.7.4

