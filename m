From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/1] pinctrl: mcp23s08: fix irq and irqchip setup order
Date: Tue,  2 Oct 2018 10:06:46 +0200
Message-ID: <20181002080646.10822-2-m.felsch@pengutronix.de>
References: <20181002080646.10822-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181002080646.10822-1-m.felsch@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org, Phil Reid <preid@electromag.com.au>, =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

Since 'commit 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")' the
irq request isn't the last devm_* allocation. Without a deeper look at
the irq and testing this isn't a good solution. Since this driver relies
on the devm mechanism, requesting a interrupt should be the last thing
to avoid memory corruptions during unbinding.

'Commit 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")' fixed the
order for the interrupt-controller use case only. The
mcp23s08_irq_setup() must be split into two to fix it for the
interrupt-controller use case and to register the irq at last. So the
irq will be freed first during unbind.

Cc: stable@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>
Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Dmitry Mastykin <mastichi@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Fixes: 82039d244f87 ("pinctrl: mcp23s08: add pinconf support")
Fixes: 02e389e63e35 ("pinctrl: mcp23s08: fix irq setup order")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 4a8a8efadefa..cf73a403d22d 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -636,6 +636,14 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 		return err;
 	}
 
+	return 0;
+}
+
+static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
+{
+	struct gpio_chip *chip = &mcp->chip;
+	int err;
+
 	err =  gpiochip_irqchip_add_nested(chip,
 					   &mcp23s08_irq_chip,
 					   0,
@@ -912,7 +920,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	}
 
 	if (mcp->irq && mcp->irq_controller) {
-		ret = mcp23s08_irq_setup(mcp);
+		ret = mcp23s08_irqchip_setup(mcp);
 		if (ret)
 			goto fail;
 	}
@@ -944,6 +952,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		goto fail;
 	}
 
+	if (mcp->irq)
+		ret = mcp23s08_irq_setup(mcp);
+
 fail:
 	if (ret < 0)
 		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
-- 
2.19.0
