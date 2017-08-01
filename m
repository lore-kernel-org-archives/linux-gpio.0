From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] gpio: add gpio_add_lookup_tables() to add several tables
 at once
Date: Tue, 1 Aug 2017 12:24:18 -0700
Message-ID: <20170801192418.GE28401@dtor-ws>
References: <20170725205800.GA25245@dtor-ws>
 <1501064497.29303.251.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37934 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751987AbdHATYW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 15:24:22 -0400
Content-Disposition: inline
In-Reply-To: <1501064497.29303.251.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 26, 2017 at 01:21:37PM +0300, Andy Shevchenko wrote:
> On Tue, 2017-07-25 at 13:58 -0700, Dmitry Torokhov wrote:
> > When converting legacy board to use gpiod API() there migt be several
> > lookup tables in board file, let's provide a way to register them all
> > at
> > once.
> 
> Looking into the code which is using several GPIO look up tables I
> noticed that the pattern often something like
> 
> 
> gpiod_add_lookup_table(x_tbl);
> platform_device_register(x_dev);
> 
> ...
> 
> gpiod_add_lookup_table(y_tbl);
> platform_device_register(y_dev);
> 
> which looks also logical.
> 
> So, I have no strong opinion here, though it would be nice to have an
> example where it makes sense.

Here is an example. It actually does not have multiple GPIO tables, but
it allows to keep the structure of init sequence for the board, which
relies on having series of arrays conditionally populated with devices
and other data that need to be registered.

static int __init tll6527m_init(void)
{
	printk(KERN_INFO "%s(): registering device resources\n", __func__);
	gpiod_add_lookup_tables(tll6527m_gpio_tables,
				AERRAY_SIZE(tll6527m_gpio_tables));
	i2c_register_board_info(0, bfin_i2c_board_info,
				ARRAY_SIZE(bfin_i2c_board_info));
	platform_add_devices(tll6527m_devices, ARRAY_SIZE(tll6527m_devices));
	spi_register_board_info(bfin_spi_board_info,
				ARRAY_SIZE(bfin_spi_board_info));
	return 0;
}

--->8---------------------->8---------------------->8-----------------

blackfin: tll6527m: switch to using generic gpio-backlight driver

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Instead of having lq035q1 control backlight, let's use standard
gpio-backlight driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/blackfin/mach-bf527/boards/tll6527m.c |   44 +++++++++++++++++++++-------
 arch/sh/boards/mach-ecovec24/setup.c       |    2 +
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/arch/blackfin/mach-bf527/boards/tll6527m.c b/arch/blackfin/mach-bf527/boards/tll6527m.c
index c1acce4c2e45..d7fd705a79e4 100644
--- a/arch/blackfin/mach-bf527/boards/tll6527m.c
+++ b/arch/blackfin/mach-bf527/boards/tll6527m.c
@@ -10,11 +10,13 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -28,14 +30,6 @@
 #include <asm/portmux.h>
 #include <asm/dpmc.h>
 
-#if IS_ENABLED(CONFIG_TOUCHSCREEN_AD7879)
-#include <linux/platform_data/ad7879.h>
-#define LCD_BACKLIGHT_GPIO 0x40
-/* TLL6527M uses TLL7UIQ35 / ADI LCD EZ Extender. AD7879 AUX GPIO is used for
- * LCD Backlight Enable
- */
-#endif
-
 /*
  * Name the Board for the /proc/cpuinfo
  */
@@ -109,8 +103,6 @@ static struct platform_device musb_device = {
 static struct bfin_lq035q1fb_disp_info bfin_lq035q1_data = {
 	.mode = LQ035_NORM | LQ035_RGB | LQ035_RL | LQ035_TB,
 	.ppi_mode = USE_RGB565_16_BIT_PPI,
-	.use_bl = 1,
-	.gpio_bl = LCD_BACKLIGHT_GPIO,
 };
 
 static struct resource bfin_lq035q1_resources[] = {
@@ -132,6 +124,23 @@ static struct platform_device bfin_lq035q1_device = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_GPIO)
+/* TLL6527M uses TLL7UIQ35 / ADI LCD EZ Extender. AD7879 AUX GPIO is used for
+ * LCD Backlight Enable
+ */
+static struct gpiod_lookup_table bfin_gpio_backlight_gpios_table = {
+	.dev_id = "gpio-backlight.0",
+	.table = {
+		GPIO_LOOKUP("AD7879-GPIO", 0, NULL, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct platform_device bfin_gpio_backlight_device = {
+	.name		= "gpio-backlight",
+};
+#endif
+
 #if IS_ENABLED(CONFIG_MTD_GPIO_ADDR)
 static struct mtd_partition tll6527m_partitions[] = {
 	{
@@ -323,6 +332,7 @@ static struct bfin5xx_spi_chip  mmc_spi_chip_info = {
 #endif
 
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_AD7879)
+#include <linux/platform_data/ad7879.h>
 static const struct ad7879_platform_data bfin_ad7879_ts_info = {
 	.model			= 7879,	/* Model = AD7879 */
 	.x_plate_ohms		= 620,	/* 620 Ohm from the touch datasheet */
@@ -336,7 +346,7 @@ static const struct ad7879_platform_data bfin_ad7879_ts_info = {
 				/* take the average of 4 middle samples */
 	.pen_down_acc_interval	= 255,	/* 9.4 ms */
 	.gpio_export		= 1,	/* configure AUX as GPIO output*/
-	.gpio_base		= LCD_BACKLIGHT_GPIO,
+	.gpio_base		= -1,
 };
 #endif
 
@@ -836,6 +846,10 @@ static struct platform_device *tll6527m_devices[] __initdata = {
 	&bfin_lq035q1_device,
 #endif
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_GPIO)
+	&bfin_gpio_backlight_device,
+#endif
+
 #if IS_ENABLED(CONFIG_SERIAL_BFIN)
 #ifdef CONFIG_SERIAL_BFIN_UART0
 	&bfin_uart0_device,
@@ -880,9 +894,17 @@ static struct platform_device *tll6527m_devices[] __initdata = {
 #endif
 };
 
+static struct gpiod_lookup_table *tll6527m_gpio_tables[] = {
+#if IS_ENABLED(CONFIG_BACKLIGHT_GPIO)
+	&bfin_gpio_backlight_gpios_table,
+#endif
+};
+
 static int __init tll6527m_init(void)
 {
 	printk(KERN_INFO "%s(): registering device resources\n", __func__);
+	gpiod_add_lookup_tables(tll6527m_gpio_tables,
+				AERRAY_SIZE(tll6527m_gpio_tables));
 	i2c_register_board_info(0, bfin_i2c_board_info,
 				ARRAY_SIZE(bfin_i2c_board_info));
 	platform_add_devices(tll6527m_devices, ARRAY_SIZE(tll6527m_devices));
diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index f59494dbfc0b..4724f8f93fd9 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -372,7 +372,7 @@ static struct platform_device lcdc_device = {
 static struct gpiod_lookup_table gpio_backlight_gpios_table = {
 	.dev_id = "gpio-backlight.0",
 	.table = {
-		GPIO_LOOKUP_IDX("sh7724_pfc", GPIO_PTR1, NULL, 0, GPIO_ACTIVE_HIGH);
+		GPIO_LOOKUP("sh7724_pfc", GPIO_PTR1, NULL, GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };

-- 
Dmitry
