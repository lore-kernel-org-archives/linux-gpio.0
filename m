From: Leonid Bloch <lbloch@janustech.com>
Subject: [PATCH] gpio: it87: Add support for IT8613
Date: Thu,  9 Aug 2018 01:26:36 +0300
Message-ID: <20180808222636.6381-1-lbloch@janustech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Leonid Bloch <lbloch@janustech.com>
List-Id: linux-gpio@vger.kernel.org

This was tested on actual hardware and found to work fine, but currently
the official specifications of this chip could not be obtained to
confirm the numbers.

Signed-off-by: Leonid Bloch <lbloch@janustech.com>
---
 drivers/gpio/Kconfig     | 3 ++-
 drivers/gpio/gpio-it87.c | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 71c0ab46f216..f1179599aa7e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -684,7 +684,8 @@ config GPIO_IT87
 	  Say yes here to support GPIO functionality of IT87xx Super I/O chips.
 
 	  This driver is tested with ITE IT8728 and IT8732 Super I/O chips, and
-	  supports the IT8761E, IT8620E and IT8628E Super I/O chip as well.
+	  supports the IT8761E, IT8613, IT8620E, and IT8628E Super I/O chips as
+	  well.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio_it87
diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 7cad14d3f127..b1fe26927e44 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -35,6 +35,7 @@
 
 /* Chip Id numbers */
 #define NO_DEV_ID	0xffff
+#define IT8613_ID	0x8613
 #define IT8620_ID	0x8620
 #define IT8628_ID	0x8628
 #define IT8728_ID	0x8728
@@ -306,6 +307,14 @@ static int __init it87_gpio_init(void)
 	it87_gpio->chip = it87_template_chip;
 
 	switch (chip_type) {
+	case IT8613_ID:
+		gpio_ba_reg = 0x62;
+		it87_gpio->io_size = 8;  /* it8613 only needs 6, use 8 for alignment */
+		it87_gpio->output_base = 0xc8;
+		it87_gpio->simple_base = 0xc0;
+		it87_gpio->simple_size = 6;
+		it87_gpio->chip.ngpio = 64;  /* has 48, use 64 for convenient calc */
+		break;
 	case IT8620_ID:
 	case IT8628_ID:
 		gpio_ba_reg = 0x62;
-- 
2.17.1
