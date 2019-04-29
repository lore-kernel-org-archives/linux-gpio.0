From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
Date: Sun, 28 Apr 2019 22:49:48 -0700
Message-ID: <20190429054948.9185-2-andrew.smirnov@gmail.com>
References: <20190429054948.9185-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429054948.9185-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Simplify error checking code by replacing multiple ERR macros with a
call to PTR_ERR_OR_ZERO. No functional change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-vf610.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 30aef41e3b7e..7ba668db171b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -265,7 +265,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	port->clk_port = devm_clk_get(dev, "port");
-	if (!IS_ERR(port->clk_port)) {
+	ret = PTR_ERR_OR_ZERO(port->clk_port);
+	if (!ret) {
 		ret = clk_prepare_enable(port->clk_port);
 		if (ret)
 			return ret;
@@ -273,16 +274,17 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 					       port->clk_port);
 		if (ret)
 			return ret;
-	} else if (port->clk_port == ERR_PTR(-EPROBE_DEFER)) {
+	} else if (ret == -EPROBE_DEFER) {
 		/*
 		 * Percolate deferrals, for anything else,
 		 * just live without the clocking.
 		 */
-		return PTR_ERR(port->clk_port);
+		return ret;
 	}
 
 	port->clk_gpio = devm_clk_get(dev, "gpio");
-	if (!IS_ERR(port->clk_gpio)) {
+	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
+	if (!ret) {
 		ret = clk_prepare_enable(port->clk_gpio);
 		if (ret)
 			return ret;
@@ -290,8 +292,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 					       port->clk_gpio);
 		if (ret)
 			return ret;
-	} else if (port->clk_gpio == ERR_PTR(-EPROBE_DEFER)) {
-		return PTR_ERR(port->clk_gpio);
+	} else if (ret == -EPROBE_DEFER) {
+		return ret;
 	}
 
 	gc = &port->gc;
-- 
2.20.1
