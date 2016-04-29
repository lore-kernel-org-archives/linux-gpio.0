From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
Date: Fri, 29 Apr 2016 09:24:37 +0200
Message-ID: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Currrently the gpio_chip.to_irq() callback returns -ENOSYS on error,
which causes bad interactions with the serial_mctrl_gpio helpers.

mctrl_gpio_init() returns -ENOSYS if GPIOLIB is not enabled, which is
intended to be ignored by its callers. However, ignoring -ENOSYS when it
was caused by a gpiod_to_irq() failure will lead to a crash later:

    Unable to handle kernel paging request at virtual address ffffffde
    ...
    PC is at mctrl_gpio_set+0x14/0x78

Fix this by returning -ENXIO instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is -ENXIO the right error code?

  - Most drivers seem to return -ENXIO on failure, just like
    gpiod_to_irq() does when no .to_irq() callback is provided by the
    driver,
  - Some drivers use -EINVAL,
  - Drivers that call irq_find_mapping(), irq_create_mapping(), or
    irq_create_fwspec_mapping() return zero!  This also applies to the
    core helper gpiochip_to_irq().
---
 drivers/pinctrl/sh-pfc/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index a6681b8b17c3b30c..2fffb9c32231adb3 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -212,7 +212,7 @@ static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
 		}
 	}
 
-	return -ENOSYS;
+	return -ENXIO;
 
 found:
 	return pfc->irqs[i];
-- 
1.9.1
