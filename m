From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 5/7] gpio: vf610: Use devres to disable clk_gpio
Date: Sun, 10 Mar 2019 23:27:35 -0700
Message-ID: <20190311062737.6652-6-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Clk_gpio should be disabled in all error paths in the code that
follws, including the case when either gpiochip_add_data() or
gpiochip_irqchip_add() fail. To simplify things fix this by using
devm_add_action() to disable corresponding clock in case of any erros
as well as driver/device removal.

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
 drivers/gpio/gpio-vf610.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 78c1f8ebbe8f..f7445468677d 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -289,6 +289,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		ret = clk_prepare_enable(port->clk_gpio);
 		if (ret)
 			return ret;
+		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
+					       port->clk_gpio);
+		if (ret)
+			return ret;
 	} else if (port->clk_gpio == ERR_PTR(-EPROBE_DEFER)) {
 		return PTR_ERR(port->clk_gpio);
 	}
@@ -345,8 +349,6 @@ static int vf610_gpio_remove(struct platform_device *pdev)
 	struct vf610_gpio_port *port = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&port->gc);
-	if (!IS_ERR(port->clk_gpio))
-		clk_disable_unprepare(port->clk_gpio);
 
 	return 0;
 }
-- 
2.20.1
