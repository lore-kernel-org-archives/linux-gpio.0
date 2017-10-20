From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio: Fix loose spelling
Date: Fri, 20 Oct 2017 13:27:58 +1030
Message-ID: <20171020025758.18474-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, robh+dt@kernel.org, frowand.list@gmail.com, ldewangan@nvidia.com, ckeepax@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, Russell Currey <ruscur@russell.cc>
List-Id: linux-gpio@vger.kernel.org

Literally.

I expect "lose" was meant here, rather than "loose", though you could feasibly
use a somewhat uncommon definition of "loose" to mean what would be meant by
"lose": "Loose the hounds" for instance, as in "Release the hounds".
Substituting in "value" for "hounds" gives "release the value", and makes some
sense, but futher substituting back to loose gives "loose the value" which
overall just seems a bit anachronistic.

Instead, use modern, pragmatic English and save a character.

Cc: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpiolib-of.c       | 4 ++--
 drivers/gpio/gpiolib.c          | 6 +++---
 drivers/gpio/gpiolib.h          | 2 +-
 include/dt-bindings/gpio/gpio.h | 2 +-
 include/linux/gpio/machine.h    | 2 +-
 include/linux/of_gpio.h         | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bfcd20699ec8..e0d59e61b52f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -153,8 +153,8 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			*flags |= GPIO_OPEN_SOURCE;
 	}
 
-	if (of_flags & OF_GPIO_SLEEP_MAY_LOOSE_VALUE)
-		*flags |= GPIO_SLEEP_MAY_LOOSE_VALUE;
+	if (of_flags & OF_GPIO_SLEEP_MAY_LOSE_VALUE)
+		*flags |= GPIO_SLEEP_MAY_LOSE_VALUE;
 
 	return desc;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac4e26a..a56b29fd8bb1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2890,7 +2890,7 @@ bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= chip->ngpio)
 		return false;
 
-	return !test_bit(FLAG_SLEEP_MAY_LOOSE_VALUE,
+	return !test_bit(FLAG_SLEEP_MAY_LOSE_VALUE,
 			 &chip->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
@@ -3268,8 +3268,8 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 	if (lflags & GPIO_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-	if (lflags & GPIO_SLEEP_MAY_LOOSE_VALUE)
-		set_bit(FLAG_SLEEP_MAY_LOOSE_VALUE, &desc->flags);
+	if (lflags & GPIO_SLEEP_MAY_LOSE_VALUE)
+		set_bit(FLAG_SLEEP_MAY_LOSE_VALUE, &desc->flags);
 
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d003ccb12781..799208fc189a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -201,7 +201,7 @@ struct gpio_desc {
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
-#define FLAG_SLEEP_MAY_LOOSE_VALUE 12	/* GPIO may loose value in sleep */
+#define FLAG_SLEEP_MAY_LOSE_VALUE 12	/* GPIO may lose value in sleep */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index c5074584561d..70de5b7a6c9b 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -30,6 +30,6 @@
 
 /* Bit 3 express GPIO suspend/resume persistence */
 #define GPIO_SLEEP_MAINTAIN_VALUE 0
-#define GPIO_SLEEP_MAY_LOOSE_VALUE 8
+#define GPIO_SLEEP_MAY_LOSE_VALUE 8
 
 #endif
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index ba4ccfd900f9..5e9f294c29eb 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -10,7 +10,7 @@ enum gpio_lookup_flags {
 	GPIO_OPEN_DRAIN = (1 << 1),
 	GPIO_OPEN_SOURCE = (1 << 2),
 	GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
-	GPIO_SLEEP_MAY_LOOSE_VALUE = (1 << 3),
+	GPIO_SLEEP_MAY_LOSE_VALUE = (1 << 3),
 };
 
 /**
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index ca10f43564de..1fe205582111 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -31,7 +31,7 @@ enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
-	OF_GPIO_SLEEP_MAY_LOOSE_VALUE = 0x8,
+	OF_GPIO_SLEEP_MAY_LOSE_VALUE = 0x8,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.11.0
