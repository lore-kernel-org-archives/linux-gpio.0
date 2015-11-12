From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: at91-pio4: use %pr format string for resource
Date: Thu, 12 Nov 2015 15:15:38 +0100
Message-ID: <3726450.XyTgssZ1KT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

resource_size_t may be defined as 32 or 64 bit depending on configuration,
so it cannot be printed using the normal format strings, as gcc correctly
warns:

pinctrl-at91-pio4.c: In function 'atmel_pinctrl_probe':
pinctrl-at91-pio4.c:1003:41: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'resource_size_t {aka long long unsigned int}' [-Wformat=]
   dev_dbg(dev, "bank %i: hwirq=%u\n", i, res->start);

This changes the format string to use the special "%pr" format
string that prints a resource, and changes the arguments so we
the resource structure directly. I'm also swapping out the arguments
to match the text in the format string.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 33edd07d9149..23217e990eaf 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1000,7 +1000,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		atmel_pioctrl->irqs[i] = res->start;
 		irq_set_chained_handler(res->start, atmel_gpio_irq_handler);
 		irq_set_handler_data(res->start, atmel_pioctrl);
-		dev_dbg(dev, "bank %i: hwirq=%u\n", i, res->start);
+		dev_dbg(dev, "bank %pr: hwirq=%u\n", res, i);
 	}
 
 	atmel_pioctrl->irq_domain = irq_domain_add_linear(dev->of_node,
