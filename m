From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 3/7] gpio: vf610: Simplify vf610_gpio_get()
Date: Sun, 10 Mar 2019 23:27:33 -0700
Message-ID: <20190311062737.6652-4-andrew.smirnov@gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Both branches of the if statement do exactly the same thing, just at
different offsets. Simplify the code a bit by moving shared action
code outside of the if statement. No functional change intended.

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
 drivers/gpio/gpio-vf610.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 2ea17870e9da..bb35cedd05e3 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -85,17 +85,15 @@ static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(gc);
 	unsigned long mask = BIT(gpio);
-	void __iomem *addr;
+	unsigned long offset = GPIO_PDIR;
 
 	if (port->sdata && port->sdata->have_paddr) {
 		mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		addr = mask ? port->gpio_base + GPIO_PDOR :
-			      port->gpio_base + GPIO_PDIR;
-		return !!(vf610_gpio_readl(addr) & BIT(gpio));
-	} else {
-		return !!(vf610_gpio_readl(port->gpio_base + GPIO_PDIR)
-					   & BIT(gpio));
+		if (mask)
+			offset = GPIO_PDOR;
 	}
+
+	return !!(vf610_gpio_readl(port->gpio_base + offset) & BIT(gpio));
 }
 
 static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-- 
2.20.1
