From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 7/7] gpio: vf610: Don't use explicit &pdev->dev in vf610_gpio_probe()
Date: Sun, 10 Mar 2019 23:27:37 -0700
Message-ID: <20190311062737.6652-8-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

The code already defines "dev" variable to help with that, so make
sure all of the code uses it.

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
 drivers/gpio/gpio-vf610.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7db2fa229035..6f6558715b88 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -248,7 +248,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	int i;
 	int ret;
 
-	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
@@ -267,7 +267,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
-	port->clk_port = devm_clk_get(&pdev->dev, "port");
+	port->clk_port = devm_clk_get(dev, "port");
 	if (!IS_ERR(port->clk_port)) {
 		ret = clk_prepare_enable(port->clk_port);
 		if (ret)
@@ -284,7 +284,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->clk_port);
 	}
 
-	port->clk_gpio = devm_clk_get(&pdev->dev, "gpio");
+	port->clk_gpio = devm_clk_get(dev, "gpio");
 	if (!IS_ERR(port->clk_gpio)) {
 		ret = clk_prepare_enable(port->clk_gpio);
 		if (ret)
-- 
2.20.1
