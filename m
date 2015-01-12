From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/6] gpio: fix memory and reference leaks in gpiochip_add error path
Date: Mon, 12 Jan 2015 17:12:24 +0100
Message-ID: <1421079149-2236-2-git-send-email-johan@kernel.org>
References: <1421079149-2236-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421079149-2236-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Memory allocated and references taken by of_gpiochip_add and
acpi_gpiochip_add were never released on errors in gpiochip_add (e.g.
failure to find free gpio range).

Fixes: 391c970c0dd1 ("of/gpio: add default of_xlate function if device
has a node pointer")
Fixes: 664e3e5ac64c ("gpio / ACPI: register to ACPI events
automatically")
Cc: stable <stable@vger.kernel.org>

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 487afe6f22fc..89c59f5f1924 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -277,6 +277,9 @@ int gpiochip_add(struct gpio_chip *chip)
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	if (status)
+		goto fail;
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
@@ -284,12 +287,12 @@ int gpiochip_add(struct gpio_chip *chip)
 	of_gpiochip_add(chip);
 	acpi_gpiochip_add(chip);
 
-	if (status)
-		goto fail;
-
 	status = gpiochip_export(chip);
-	if (status)
+	if (status) {
+		acpi_gpiochip_remove(chip);
+		of_gpiochip_remove(chip);
 		goto fail;
+	}
 
 	pr_debug("%s: registered GPIOs %d to %d on device: %s\n", __func__,
 		chip->base, chip->base + chip->ngpio - 1,
-- 
2.0.5
