From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH] pinctrl: armada-37xx: Fix direction_output() callback behavior
Date: Tue, 14 Nov 2017 17:51:50 +0100
Message-ID: <20171114165150.19599-1-gregory.clement@free-electrons.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The direction_output callback of the gpio_chip structure is supposed to
set the output direction but also to set the value of the gpio. For the
armada-37xx driver this callback acted as the gpio_set_direction callback
for the pinctrl.

This patch fixes the behavior of the direction_output callback by also
applying the value received as parameter.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Reported-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 71b944748304..c5fe7d4a9065 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -408,12 +408,21 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_EN;
-	unsigned int mask;
+	unsigned int mask, val, ret;
 
 	armada_37xx_update_reg(&reg, offset);
 	mask = BIT(offset);
 
-	return regmap_update_bits(info->regmap, reg, mask, mask);
+	ret = regmap_update_bits(info->regmap, reg, mask, mask);
+
+	if (ret)
+		return ret;
+
+	reg = OUTPUT_VAL;
+	val = value ? mask : 0;
+	regmap_update_bits(info->regmap, reg, mask, val);
+
+	return 0;
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
-- 
2.14.2
