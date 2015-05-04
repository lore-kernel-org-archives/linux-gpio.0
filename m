From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 07/23] gpio: sysfs: rename gpiochip registration functions
Date: Mon,  4 May 2015 17:10:32 +0200
Message-ID: <1430752248-15401-8-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36723 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292AbbEDPNm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:42 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Rename the gpio-chip export/unexport functions to the more descriptive
names gpiochip_sysfs_register and gpiochip_sysfs_unregister.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 16 +++++++++-------
 drivers/gpio/gpiolib.c       |  4 ++--
 drivers/gpio/gpiolib.h       |  8 ++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 767b79adb9a4..aeb73ef2955e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -765,13 +765,14 @@ void gpiod_unexport(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
 
-int gpiochip_export(struct gpio_chip *chip)
+int gpiochip_sysfs_register(struct gpio_chip *chip)
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
@@ -791,7 +792,7 @@ int gpiochip_export(struct gpio_chip *chip)
 	return 0;
 }
 
-void gpiochip_unexport(struct gpio_chip *chip)
+void gpiochip_sysfs_unregister(struct gpio_chip *chip)
 {
 	struct gpio_desc *desc;
 	unsigned int i;
@@ -836,15 +837,16 @@ static int __init gpiolib_sysfs_init(void)
 			continue;
 
 		/*
-		 * TODO we yield gpio_lock here because gpiochip_export()
-		 * acquires a mutex. This is unsafe and needs to be fixed.
+		 * TODO we yield gpio_lock here because
+		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
+		 * and needs to be fixed.
 		 *
 		 * Also it would be nice to use gpiochip_find() here so we
 		 * can keep gpio_chips local to gpiolib.c, but the yield of
 		 * gpio_lock prevents us from doing this.
 		 */
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		status = gpiochip_export(chip);
+		status = gpiochip_sysfs_register(chip);
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5a5c208d31c7..2ce3df3504e6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -285,7 +285,7 @@ int gpiochip_add(struct gpio_chip *chip)
 	of_gpiochip_add(chip);
 	acpi_gpiochip_add(chip);
 
-	status = gpiochip_export(chip);
+	status = gpiochip_sysfs_register(chip);
 	if (status)
 		goto err_remove_chip;
 
@@ -330,7 +330,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	unsigned	id;
 	bool		requested = false;
 
-	gpiochip_unexport(chip);
+	gpiochip_sysfs_unregister(chip);
 
 	gpiochip_irqchip_remove(chip);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 54bc5ec91398..efdd5ded4965 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -149,17 +149,17 @@ static int __maybe_unused gpio_chip_hwgpio(const struct gpio_desc *desc)
 
 #ifdef CONFIG_GPIO_SYSFS
 
-int gpiochip_export(struct gpio_chip *chip);
-void gpiochip_unexport(struct gpio_chip *chip);
+int gpiochip_sysfs_register(struct gpio_chip *chip);
+void gpiochip_sysfs_unregister(struct gpio_chip *chip);
 
 #else
 
-static inline int gpiochip_export(struct gpio_chip *chip)
+static inline int gpiochip_sysfs_register(struct gpio_chip *chip)
 {
 	return 0;
 }
 
-static inline void gpiochip_unexport(struct gpio_chip *chip)
+static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)
 {
 }
 
-- 
2.0.5

