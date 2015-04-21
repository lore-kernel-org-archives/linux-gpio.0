From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 04/23] gpio: sysfs: preparatory clean ups
Date: Tue, 21 Apr 2015 17:42:12 +0200
Message-ID: <1429630951-27082-5-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Put the recently introduced gpio-chip pointer to some more use in
gpiod_export.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index d87f595a02ce..da0300224b4a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -584,7 +584,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto fail_unlock;
 	}
 
-	if (desc->chip->direction_input && desc->chip->direction_output &&
+	if (chip->direction_input && chip->direction_output &&
 			direction_may_change) {
 		set_bit(FLAG_SYSFS_DIR, &desc->flags);
 	}
@@ -592,10 +592,10 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	offset = gpio_chip_hwgpio(desc);
-	if (desc->chip->names && desc->chip->names[offset])
-		ioname = desc->chip->names[offset];
+	if (chip->names && chip->names[offset])
+		ioname = chip->names[offset];
 
-	dev = device_create_with_groups(&gpio_class, desc->chip->dev,
+	dev = device_create_with_groups(&gpio_class, chip->dev,
 					MKDEV(0, 0), desc, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
-- 
2.0.5
