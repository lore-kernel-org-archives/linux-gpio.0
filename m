From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] gpio: check first for invalid gpio
Date: Fri,  1 Jan 2016 14:00:53 +0530
Message-ID: <1451637053-17283-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Even if an invalid gpio number is sent to gpio_to_desc() we try to find
it in the list before checking if it is invalid. We can check it first
so that it will save us from traversing the list incase of invalid gpio.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/gpio/gpiolib.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ca66302..17a1cd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -70,6 +70,11 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 	struct gpio_chip *chip;
 	unsigned long flags;
 
+	if (!gpio_is_valid(gpio)) {
+		WARN(1, "invalid GPIO %d\n", gpio);
+		return NULL;
+	}
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	list_for_each_entry(chip, &gpio_chips, list) {
@@ -81,9 +86,6 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	if (!gpio_is_valid(gpio))
-		WARN(1, "invalid GPIO %d\n", gpio);
-
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(gpio_to_desc);
-- 
1.9.1
