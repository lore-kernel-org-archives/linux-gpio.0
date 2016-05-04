From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: sh-pfc: Let gpio_chip.to_irq() return zero on error
Date: Wed,  4 May 2016 10:21:53 +0200
Message-ID: <1462350113-20216-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Currrently the gpio_chip.to_irq() callback returns -ENOSYS on error,
which causes bad interactions with the serial_mctrl_gpio helpers.

mctrl_gpio_init() returns -ENOSYS if GPIOLIB is not enabled, which is
intended to be ignored by its callers. However, ignoring -ENOSYS when it
was caused by a gpiod_to_irq() failure will lead to a crash later:

    Unable to handle kernel paging request at virtual address ffffffde
    ...
    PC is at mctrl_gpio_set+0x14/0x78

Fix this by returning zero instead, like gpiochip_to_irq() does.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "gpio: make gpiod_to_irq() return negative for NO_IRQ"
for proper handling by callers of mctrl_gpio_init().
Hence I think it's best to take this through the GPIO tree, after the
above has been applied.

v2:
  - Return zero instead of -ENXIO.
---
 drivers/pinctrl/sh-pfc/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index a6681b8b17c3b30c..97dff6a09ff08115 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -212,7 +212,7 @@ static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
 		}
 	}
 
-	return -ENOSYS;
+	return 0;
 
 found:
 	return pfc->irqs[i];
-- 
1.9.1
