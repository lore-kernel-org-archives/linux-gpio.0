From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 3/5] gpio: make gpiochip_get_desc() gpiolib-private
Date: Tue, 22 Jul 2014 16:17:41 +0900
Message-ID: <1406013463-19218-4-git-send-email-acourbot@nvidia.com>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

As GPIO descriptors are not going to remain unique anymore, having this
function public is not safe. Restrain its use to gpiolib since we have
no user outside of it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-of.c   | 2 +-
 drivers/gpio/gpiolib.c      | 1 -
 drivers/gpio/gpiolib.h      | 2 ++
 include/linux/gpio/driver.h | 3 ---
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 3e2fae205bee..7cfdc2278905 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -23,7 +23,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/slab.h>
 
-struct gpio_desc;
+#include "gpiolib.h"
 
 /* Private data structure for of_gpiochip_find_and_xlate */
 struct gg_data {
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c5509359ba88..38d176e31379 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -82,7 +82,6 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
 
 	return &chip->desc[hwnum];
 }
-EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
 /**
  * Convert a GPIO descriptor to the integer namespace.
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 98020c393eb3..acbb9335f08c 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -51,6 +51,8 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		   const char *list_name, int index, enum of_gpio_flags *flags);
 
+struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
+
 extern struct spinlock gpio_lock;
 extern struct list_head gpio_chips;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 573e4f3243d0..4dc79714c136 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -151,9 +151,6 @@ void gpiod_unlock_as_irq(struct gpio_desc *desc);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
-				    u16 hwnum);
-
 enum gpio_lookup_flags {
 	GPIO_ACTIVE_HIGH = (0 << 0),
 	GPIO_ACTIVE_LOW = (1 << 0),
-- 
2.0.1
