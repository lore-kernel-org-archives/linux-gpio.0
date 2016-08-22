From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] i2c: pca953x: fix a lockdep warning
Date: Mon, 22 Aug 2016 15:29:32 +0200
Message-ID: <1471872572-25818-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

If an I2C GPIO multiplexer is driven by a GPIO provided by an expander
when there's a second expander using the same device driver on one of
the I2C bus segments, lockdep prints a deadlock warning when trying to
set the direction or the value of the GPIOs provided by the second
expander.

The below diagram presents the setup:

                                               - - - - -
 -------             ---------  Bus segment 1 |         |
|       |           |         |---------------  Devices
|       | SCL/SDA   |         |               |         |
| Linux |-----------| I2C MUX |                - - - - -
|       |    |      |         | Bus segment 2
|       |    |      |         |-------------------
 -------     |       ---------                    |
             |           |                    - - - - -
        ------------     | MUX GPIO          |         |
       |            |    |                     Devices
       |    GPIO    |    |                   |         |
       | Expander 1 |----                     - - - - -
       |            |                             |
        ------------                              | SCL/SDA
                                                  |
                                             ------------
                                            |            |
                                            |    GPIO    |
                                            | Expander 2 |
                                            |            |
                                             ------------

The reason for lockdep warning is that we take the chip->i2c_lock in
pca953x_gpio_set_value() or pca953x_gpio_direction_output() and then
come right back to pca953x_gpio_set_value() when the GPIO mux kicks
in. The locks actually protect different expanders, but lockdep
doesn't see this and says:

  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&chip->i2c_lock);
   lock(&chip->i2c_lock);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

To shut lockdep up, use mutex_lock_nested() and use the GPIO base
number as the subclass argument (it has the same type).

NOTE: this only fixes a specific issue we're experiencing with our
setup. The problem would probably occur as well with other I2C
expanders under similar circumstances. A proper fix would probably be
to implement a GPIO expander framework that would unduplicate common
code for all drivers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 02f2a56..9086079 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -329,7 +329,12 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 	u8 reg_val;
 	int ret, offset = 0;
 
-	mutex_lock(&chip->i2c_lock);
+	/*
+	 * We're using mutex_lock_nested() here to avoid a lockdep warning
+	 * when there are two pca953x expanders, of which one is used to
+	 * control an i2c gpio mux.
+	 */
+	mutex_lock_nested(&chip->i2c_lock, chip->gpio_start);
 	if (val)
 		reg_val = chip->reg_output[off / BANK_SZ]
 			| (1u << (off % BANK_SZ));
-- 
2.7.4
