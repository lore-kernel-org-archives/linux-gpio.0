From: Michael Brunner <mibru@gmx.de>
Subject: [PATCH] gpio: Fix bit masking in Kontron PLD GPIO driver
Date: Fri, 9 Aug 2013 17:33:26 +0200
Message-ID: <20130809173326.75aed3b6@mail.gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Kevin Strasser <strassek@engr.orst.edu>, Darren Hart <dvhart@linux.intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Chris Healy <chealy@imsco-us.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patch fixes the bit masking within the GPIO driver. The masking is
basically done twice which causes the wrong GPIOs to be addressed.

Signed-off-by: Michael Brunner <michael.brunner@kontron.com>
---
 drivers/gpio/gpio-kempld.c |   24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index d3ed563..6118b66 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -46,9 +46,9 @@ static void kempld_gpio_bitop(struct kempld_device_data *pld,
 
        status = kempld_read8(pld, reg);
        if (val)
-               status |= (1 << bit);
+               status |= KEMPLD_GPIO_MASK(bit);
        else
-               status &= ~(1 << bit);
+               status &= ~KEMPLD_GPIO_MASK(bit);
        kempld_write8(pld, reg, status);
 }
 
@@ -60,7 +60,7 @@ static int kempld_gpio_get_bit(struct kempld_device_data *pld, u8 reg, u8 bit)
        status = kempld_read8(pld, reg);
        kempld_release_mutex(pld);
 
-       return !!(status & (1 << bit));
+       return !!(status & KEMPLD_GPIO_MASK(bit));
 }
 
 static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -69,8 +69,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
                = container_of(chip, struct kempld_gpio_data, chip);
        struct kempld_device_data *pld = gpio->pld;
 
-       return kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset),
-                                  KEMPLD_GPIO_MASK(offset));
+       return kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
 static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
@@ -80,8 +79,7 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
        struct kempld_device_data *pld = gpio->pld;
 
        kempld_get_mutex(pld);
-       kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset),
-                         KEMPLD_GPIO_MASK(offset), value);
+       kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
        kempld_release_mutex(pld);
 }
 
@@ -92,8 +90,7 @@ static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
        struct kempld_device_data *pld = gpio->pld;
 
        kempld_get_mutex(pld);
-       kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset),
-                         KEMPLD_GPIO_MASK(offset), 0);
+       kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset), offset, 0);
        kempld_release_mutex(pld);
 
        return 0;
@@ -107,10 +104,8 @@ static int kempld_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
        struct kempld_device_data *pld = gpio->pld;
 
        kempld_get_mutex(pld);
-       kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset),
-                         KEMPLD_GPIO_MASK(offset), value);
-       kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset),
-                         KEMPLD_GPIO_MASK(offset), 1);
+       kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
+       kempld_gpio_bitop(pld, KEMPLD_GPIO_DIR_NUM(offset), offset, 1);
        kempld_release_mutex(pld);
 
        return 0;
@@ -122,8 +117,7 @@ static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
                = container_of(chip, struct kempld_gpio_data, chip);
        struct kempld_device_data *pld = gpio->pld;
 
-       return kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset),
-                                  KEMPLD_GPIO_MASK(offset));
+       return kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset);
 }
 
 static int kempld_gpio_pincount(struct kempld_device_data *pld)
