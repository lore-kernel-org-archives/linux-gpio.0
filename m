From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 1/2] gpio: vf610: Use devm_platform_ioremap_resource()
Date: Sun, 28 Apr 2019 22:49:47 -0700
Message-ID: <20190429054948.9185-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Replace calls to platform_get_resource() and devm_ioremap_resource()
with newly added devm_platform_ioremap_resource() for brevity. No
functional change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-vf610.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 6f6558715b88..30aef41e3b7e 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -242,7 +242,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct vf610_gpio_port *port;
-	struct resource *iores;
 	struct gpio_chip *gc;
 	struct irq_chip *ic;
 	int i;
@@ -253,13 +252,11 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = of_device_get_match_data(dev);
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	port->base = devm_ioremap_resource(dev, iores);
+	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	port->gpio_base = devm_ioremap_resource(dev, iores);
+	port->gpio_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(port->gpio_base))
 		return PTR_ERR(port->gpio_base);
 
-- 
2.20.1
