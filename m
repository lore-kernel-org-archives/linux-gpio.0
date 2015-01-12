From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/6] gpio: fix memory leak and sleep-while-atomic
Date: Mon, 12 Jan 2015 17:12:27 +0100
Message-ID: <1421079149-2236-5-git-send-email-johan@kernel.org>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Fix memory leak and sleep-while-atomic in gpiochip_remove.

The memory leak was introduced by afa82fab5e13 ("gpio / ACPI: Move event
handling registration to gpiolib irqchip helpers") that moved the
release of acpi interrupt resources to gpiochip_irqchip_remove, but by
then the resources are no longer accessible as the acpi_gpio_chip has
already been freed by acpi_gpiochip_remove.

Note that this also fixes a few potential sleep-while-atomics, which has
been around since 1425052097b5 ("gpio: add IRQ chip helpers in gpiolib")
when the call to gpiochip_irqchip_remove while holding a spinlock was
added (a couple of irq-domain paths can end up grabbing mutexes).

Fixes: afa82fab5e13 ("gpio / ACPI: Move event handling registration to
gpiolib irqchip helpers")
Fixes: 1425052097b5 ("gpio: add IRQ chip helpers in gpiolib")
Cc: stable <stable@vger.kernel.org>

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4efb92ca3463..0f8173051edc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -327,11 +327,12 @@ void gpiochip_remove(struct gpio_chip *chip)
 	unsigned long	flags;
 	unsigned	id;
 
+	gpiochip_irqchip_remove(chip);
+
 	acpi_gpiochip_remove(chip);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	gpiochip_irqchip_remove(chip);
 	gpiochip_remove_pin_ranges(chip);
 	of_gpiochip_remove(chip);
 
-- 
2.0.5
