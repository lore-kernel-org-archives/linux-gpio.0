From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Thu,  8 Dec 2016 18:32:28 +0100
Message-ID: <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:36172 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbcLHRdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2016 12:33:21 -0500
In-Reply-To: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Currently gpio modules are runtime-resumed at probe time. This means the
gpio module will be active all the time (except during system suspend,
if not configured as a wake-up source).

While an R-Car Gen2 gpio module retains pins configured for output at
the requested level while put in standby mode, gpio register cannot be
accessed while suspended.  Unfortunately pm_runtime_get_sync() cannot be
called from all contexts where gpio register access is needed. Hence
move the Runtime PM handling from probe/remove time to gpio request/free
time, which is probably the best we can do.

On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended during
normal use (gpio2 is used for LEDs and regulators, gpio5 for keys, gpio6
for SD-Card CD & WP, gpio7 for keys and regulators).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/gpio/gpio-rcar.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3b77c10..31ad288 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -242,11 +242,24 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 
 static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_request_gpio(chip->base + offset);
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
+	int error;
+
+	error = pm_runtime_get_sync(&p->pdev->dev);
+	if (error < 0)
+		return error;
+
+	error = pinctrl_request_gpio(chip->base + offset);
+	if (error)
+		pm_runtime_put(&p->pdev->dev);
+
+	return error;
 }
 
 static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 {
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
+
 	pinctrl_free_gpio(chip->base + offset);
 
 	/*
@@ -254,6 +267,8 @@ static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 	 * drive the GPIO pin as an output.
 	 */
 	gpio_rcar_config_general_input_output_mode(chip, offset, false);
+
+	pm_runtime_put(&p->pdev->dev);
 }
 
 static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -426,7 +441,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
 
 	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
@@ -495,7 +509,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 err1:
 	gpiochip_remove(gpio_chip);
 err0:
-	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	return ret;
 }
@@ -506,7 +519,6 @@ static int gpio_rcar_remove(struct platform_device *pdev)
 
 	gpiochip_remove(&p->gpio_chip);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
-- 
2.10.2

