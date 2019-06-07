From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] gpio: rcar: Use proper irq_chip name
Date: Fri,  7 Jun 2019 11:58:58 +0200
Message-ID: <20190607095858.10028-5-geert+renesas@glider.be>
References: <20190607095858.10028-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

The irq_chip .name field should contain the device's class name, not the
instance's name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 70e95fc4779fe262..3ae58f182a08718a 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -483,7 +483,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->ngpio = npins;
 
 	irq_chip = &p->irq_chip;
-	irq_chip->name = name;
+	irq_chip->name = "gpio-rcar";
 	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = gpio_rcar_irq_disable;
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
-- 
2.17.1
