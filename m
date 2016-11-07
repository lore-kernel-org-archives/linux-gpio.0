From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 13/15] pinctrl-sx150x: Use handle_bad_irq instead of handle_edge_irq
Date: Mon,  7 Nov 2016 08:53:21 -0800
Message-ID: <1478537603-23653-14-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Althought the function passed as a "handler" during GPIO chip
instantiation is not going to ever be called, specifying handle_edge_irq
there makes for a rather confusing read, both because no "ack" callback
in specified for irqchip and because there's no acking action is
necessary.

Specify handle_bad_irq instead a make a note of the situation. This
commit should be a no-op behaviour wise.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 78e15c9..798a8bb 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1077,9 +1077,20 @@ static int sx150x_probe(struct i2c_client *client,
 		pctl->irq.masked = ~0;
 		pctl->irq.sense = 0;
 
+		/*
+		 * Because sx150x_irq_threaded_fn invokes all of the
+		 * nested interrrupt handlers via handle_nested_irq,
+		 * any "handler" passed to gpiochip_irqchip_add()
+		 * below is going to be ignored, so the choice of the
+		 * function does not matter that much.
+		 *
+		 * We set it to handle_bad_irq to avoid confusion,
+		 * plus it will be instantly noticeable if it is ever
+		 * called (should not happen)
+		 */
 		ret = gpiochip_irqchip_add(&pctl->gpio,
 					   &pctl->irq_chip, 0,
-					   handle_edge_irq, IRQ_TYPE_NONE);
+					   handle_bad_irq, IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(dev, "could not connect irqchip to gpiochip\n");
 			return ret;
-- 
2.5.5
