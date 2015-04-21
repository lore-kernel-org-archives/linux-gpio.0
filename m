From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 07/23] gpio: sysfs: rename gpiochip registration functions
Date: Tue, 21 Apr 2015 17:42:15 +0200
Message-ID: <1429630951-27082-8-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Rename the gpio-chip export/unexport functions to the more descriptive
names gpiochip_register and gpiochip_unregister.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 13 +++++++------
 drivers/gpio/gpiolib.c       |  4 ++--
 drivers/gpio/gpiolib.h       |  8 ++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 2f8bdce792f6..31434c5a90ef 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -750,13 +750,14 @@ void gpiod_unexport(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_export(struct gpio_chip *chip)
+int gpiochip_register(struct gpio_chip *chip)
 {
 	struct device	*dev;
 
-	/* Many systems register gpio chips for SOC support very early,
+	/*
+	 * Many systems add gpio chips for SOC support very early,
 	 * before driver model support is available.  In those cases we
-	 * export this later, in gpiolib_sysfs_init() ... here we just
+	 * register later, in gpiolib_sysfs_init() ... here we just
 	 * verify that _some_ field of gpio_class got initialized.
 	 */
 	if (!gpio_class.p)
@@ -776,7 +777,7 @@ int gpiochip_export(struct gpio_chip *chip)
 	return 0;
 }
 
-void gpiochip_unexport(struct gpio_chip *chip)
+void gpiochip_unregister(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc;
 	unsigned int i;
@@ -821,7 +822,7 @@ static int __init gpiolib_sysfs_init(void)
 			continue;
 
 		/*
-		 * TODO we yield gpio_lock here because gpiochip_export()
+		 * TODO we yield gpio_lock here because gpiochip_register()
 		 * acquires a mutex. This is unsafe and needs to be fixed.
 		 *
 		 * Also it would be nice to use gpiochip_find() here so we
@@ -829,7 +830,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpio_lock prevents us from doing this.
 		 */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = gpiochip_export(chip);
+		status = gpiochip_register(chip);
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5a5c208d31c7..fefc36211205 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -285,7 +285,7 @@ int gpiochip_add(struct gpio_chip *chip)
 	of_gpiochip_add(chip);
 	acpi_gpiochip_add(chip);
 
-	status = gpiochip_export(chip);
+	status = gpiochip_register(chip);
 	if (status)
 		goto err_remove_chip;
 
@@ -330,7 +330,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	unsigned	id;
 	bool		requested = false;
 
-	gpiochip_unexport(chip);
+	gpiochip_unregister(chip);
 
 	gpiochip_irqchip_remove(chip);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 54bc5ec91398..69458a022c90 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -149,17 +149,17 @@ static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_export(struct gpio_chip *chip);
-void gpiochip_unexport(struct gpio_chip *chip);
+int gpiochip_register(struct gpio_chip *chip);
+void gpiochip_unregister(struct gpio_chip *chip);
 
 #else
 
-static inline int gpiochip_export(struct gpio_chip *chip)
+static inline int gpiochip_register(struct gpio_chip *chip)
 {
 	return 0;
 }
 
-static inline void gpiochip_unexport(struct gpio_chip *chip)
+static inline void gpiochip_unregister(struct gpio_chip *chip)
 {
 }
 
-- 
2.0.5
