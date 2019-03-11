From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 2/7] gpio: vf610: Simplify vf610_gpio_set()
Date: Sun, 10 Mar 2019 23:27:32 -0700
Message-ID: <20190311062737.6652-3-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

The only difference between two codepaths is register offset
used. Simplify the code a bit by replacing explicit calls with a
single call with a variable offset. No functional change intended.

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
 drivers/gpio/gpio-vf610.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7e9451f47efe..2ea17870e9da 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -102,11 +102,9 @@ static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(gc);
 	unsigned long mask = BIT(gpio);
+	unsigned long offset = val ? GPIO_PSOR : GPIO_PCOR;
 
-	if (val)
-		vf610_gpio_writel(mask, port->gpio_base + GPIO_PSOR);
-	else
-		vf610_gpio_writel(mask, port->gpio_base + GPIO_PCOR);
+	vf610_gpio_writel(mask, port->gpio_base + offset);
 }
 
 static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
-- 
2.20.1
