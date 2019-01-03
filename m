From: "Fried, Ramon" <ramon.fried@linux.intel.com>
Subject: RFC: gpio: mmio: add support for 3 direction regs
Date: Thu, 3 Jan 2019 09:36:04 +0200
Message-ID: <32edfd70-95dc-26a1-2ea6-143344cb2384@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vladimir.kondratiev@linux.intel.com
List-Id: linux-gpio@vger.kernel.org

Hi.

I'm working on a driver for STA2X11 GPIO controller who seems to fit best to the generic mmio driver,
the only problem I have is with the dir register case.
The STA2X11 has 3 registers for dir, one for data, one for set and one for clear.
The generic-mmio driver has support for this fashion for the dat & set & clear registers but not for dirout/dirin registers.

I wonder if support for this is generic enough to deserve a patch, if so I'm willing to quickly add this support, if not, adding a flag such as below, will allow partly using the generic mmio driver only for set/get and the direction can be handled outside the driver.

Thanks,
Ramon

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a4d5eb3..4f91526 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -435,6 +435,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER   BIT(3)
 #define BGPIOF_READ_OUTPUT_REG_SET     BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT               BIT(5) /* only input */
+#define BGPIOF_NO_DIRECTION            BIT(6)
 
 #endif

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 935292a..66f6448 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -554,6 +554,8 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
                gc->direction_input = bgpio_dir_in;
                gc->get_direction = bgpio_get_dir;
                gc->bgpio_dir_inverted = true;
+       } else if (flags & BGPIOF_NO_DIRECTION) {
+               return 0;
        } else {
                if (flags & BGPIOF_NO_OUTPUT)
                        gc->direction_output = bgpio_dir_out_err;
@@ -638,7 +640,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
        if (gc->set == bgpio_set_set &&
                        !(flags & BGPIOF_UNREADABLE_REG_SET))
                gc->bgpio_data = gc->read_reg(gc->reg_set);
-       if (gc->reg_dir && !(flags & BGPIOF_UNREADABLE_REG_DIR))
+       if (gc->reg_dir && !(flags & (BGPIOF_UNREADABLE_REG_DIR | BGPIOF_NO_DIRECTION)))
                gc->bgpio_dir = gc->read_reg(gc->reg_dir);
 
        return ret;
