From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 6/7] gpio: vf610: Use devres to remove gpiochip
Date: Sun, 10 Mar 2019 23:27:36 -0700
Message-ID: <20190311062737.6652-7-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Now that the driver's custom remove hook contains only a single
action, replace it by converting the code to use
devm_gpiochip_add_data() to simplify things.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-imx@nxp.com
---
 drivers/gpio/gpio-vf610.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index f7445468677d..7db2fa229035 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -297,8 +297,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->clk_gpio);
 	}
 
-	platform_set_drvdata(pdev, port);
-
 	gc = &port->gc;
 	gc->of_node = np;
 	gc->parent = dev;
@@ -321,7 +319,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	ic->irq_set_type = vf610_gpio_irq_set_type;
 	ic->irq_set_wake = vf610_gpio_irq_set_wake;
 
-	ret = gpiochip_add_data(gc, port);
+	ret = devm_gpiochip_add_data(dev, gc, port);
 	if (ret < 0)
 		return ret;
 
@@ -335,7 +333,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	ret = gpiochip_irqchip_add(gc, ic, 0, handle_edge_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(dev, "failed to add irqchip\n");
-		gpiochip_remove(gc);
 		return ret;
 	}
 	gpiochip_set_chained_irqchip(gc, ic, port->irq,
@@ -344,22 +341,12 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int vf610_gpio_remove(struct platform_device *pdev)
-{
-	struct vf610_gpio_port *port = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&port->gc);
-
-	return 0;
-}
-
 static struct platform_driver vf610_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-vf610",
 		.of_match_table = vf610_gpio_dt_ids,
 	},
 	.probe		= vf610_gpio_probe,
-	.remove		= vf610_gpio_remove,
 };
 
 builtin_platform_driver(vf610_gpio_driver);
-- 
2.20.1
