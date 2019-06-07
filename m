From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] gpio: em: Use proper irq_chip name
Date: Fri,  7 Jun 2019 11:58:57 +0200
Message-ID: <20190607095858.10028-4-geert+renesas@glider.be>
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
Untested due to lack of hardware.
.parent_device not filled in as this driver doesn't use Runtime PM.
---
 drivers/gpio/gpio-em.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index b6af705a4e5f4810..6aa08d37932adf2c 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -318,7 +318,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->ngpio = ngpios;
 
 	irq_chip = &p->irq_chip;
-	irq_chip->name = name;
+	irq_chip->name = "gpio-em";
 	irq_chip->irq_mask = em_gio_irq_disable;
 	irq_chip->irq_unmask = em_gio_irq_enable;
 	irq_chip->irq_set_type = em_gio_irq_set_type;
-- 
2.17.1
