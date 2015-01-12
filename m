From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] gpio: unregister gpiochip device before removing it
Date: Mon, 12 Jan 2015 17:12:29 +0100
Message-ID: <1421079149-2236-7-git-send-email-johan@kernel.org>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Unregister gpiochip device (used to export information through sysfs)
before removing it internally. This way removal will reverse addition.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 37f919dc2cb4..568aa2b6bdb0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -327,6 +327,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	unsigned long	flags;
 	unsigned	id;
 
+	gpiochip_unexport(chip);
+
 	gpiochip_irqchip_remove(chip);
 
 	acpi_gpiochip_remove(chip);
@@ -343,7 +345,6 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
-	gpiochip_unexport(chip);
 
 	kfree(chip->desc);
 	chip->desc = NULL;
-- 
2.0.5
