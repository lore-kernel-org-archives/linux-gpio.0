From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] gpio: of: parse stmmac PHY reset line specific active-low property
Date: Mon, 10 Jun 2019 19:05:23 +0200
Message-ID: <20190610170523.26554-2-martin.blumenstingl@googlemail.com>
References: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
Sender: netdev-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc: andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

The stmmac driver currently ignores the GPIO flags which are passed via
devicetree because it operates with legacy GPIO numbers instead of GPIO
descriptors. stmmac assumes that the GPIO is "active HIGH" by default.
This can be overwritten by setting "snps,reset-active-low" to make the
reset line "active LOW".

Recent Amlogic SoCs (G12A which includes S905X2 and S905D2 as well as
G12B which includes S922X) use GPIOZ_14 or GPIOZ_15 for the PHY reset
line. These GPIOs are special because they are marked as "3.3V input
tolerant open drain" pins which means they can only drive the pin output
LOW (to reset the PHY) or to switch to input mode (to take the PHY out
of reset).
The GPIO subsystem already supports this with the GPIO_OPEN_DRAIN and
GPIO_OPEN_SOURCE flags in the devicetree bindings.

Add the stmmac PHY reset line specific active low parsing to gpiolib-of
so stmmac can be ported to GPIO descriptors while being backwards
compatible with device trees which use the "old" way of specifying the
polarity.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 00deb885409c..a8f02f551d6b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -158,6 +158,12 @@ static void of_gpio_flags_quirks(struct device_node *np,
 			}
 		}
 	}
+
+	/* Legacy handling of stmmac's active-low PHY reset line */
+	if (IS_ENABLED(CONFIG_STMMAC_ETH) &&
+	    !strcmp(propname, "snps,reset-gpio") &&
+	    of_property_read_bool(np, "snps,reset-active-low"))
+		*flags |= OF_GPIO_ACTIVE_LOW;
 }
 
 /**
-- 
2.22.0
