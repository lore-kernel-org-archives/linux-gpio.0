From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/9] drivers/gpio: make gpio-mc9s08dz60.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:43 -0400
Message-ID: <1459093489-18314-4-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Wu Guoxing <b39297@freescale.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_MC9S08DZ60
drivers/gpio/Kconfig:   bool "MX35 3DS BOARD MC9S08DZ60 GPIO functions"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_i2c_driver() uses the same init level priority as
builtin_i2c_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Wu Guoxing <b39297@freescale.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-mc9s08dz60.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
index 14f252f9eb29..2fcad5b9cca5 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -15,7 +15,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
@@ -111,8 +111,6 @@ static const struct i2c_device_id mc9s08dz60_id[] = {
 	{},
 };
 
-MODULE_DEVICE_TABLE(i2c, mc9s08dz60_id);
-
 static struct i2c_driver mc9s08dz60_i2c_driver = {
 	.driver = {
 		.name = "mc9s08dz60",
@@ -120,10 +118,4 @@ static struct i2c_driver mc9s08dz60_i2c_driver = {
 	.probe = mc9s08dz60_probe,
 	.id_table = mc9s08dz60_id,
 };
-
-module_i2c_driver(mc9s08dz60_i2c_driver);
-
-MODULE_AUTHOR("Freescale Semiconductor, Inc. "
-		"Wu Guoxing <b39297@freescale.com>");
-MODULE_DESCRIPTION("mc9s08dz60 gpio function on mx35 3ds board");
-MODULE_LICENSE("GPL v2");
+builtin_i2c_driver(mc9s08dz60_i2c_driver);
-- 
2.6.1
