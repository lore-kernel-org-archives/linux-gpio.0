From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] gpio: of: Remove unneeded dummy function
Date: Wed, 23 Apr 2014 17:28:08 +0200
Message-ID: <1398266889-17489-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

of_find_gpio() is always called under an IS_ENABLED(CONFIG_OF), so the
dummy implementation provided for !OF configurations is not needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ee1819fdcf35..7a0b97076374 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2590,7 +2590,6 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
 	mutex_unlock(&gpio_lookup_lock);
 }
 
-#ifdef CONFIG_OF
 static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 				      unsigned int idx,
 				      enum gpio_lookup_flags *flags)
@@ -2615,14 +2614,6 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 
 	return desc;
 }
-#else
-static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
-				      unsigned int idx,
-				      enum gpio_lookup_flags *flags)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 					unsigned int idx,
-- 
1.9.2
