From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] pinctrl: bcm281xx: Constify struct regmap_config
Date: Mon, 05 Jan 2015 10:03:10 +0100
Message-ID: <1420448590-9503-2-git-send-email-k.kozlowski@samsung.com>
References: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The regmap_config struct may be const because it is not modified by the
driver and regmap_init() accepts pointer to const. Make also
of_device_id array const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/pinctrl/pinctrl-bcm281xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-bcm281xx.c b/drivers/pinctrl/pinctrl-bcm281xx.c
index fa2a00f22ff1..b88cfe5ed55a 100644
--- a/drivers/pinctrl/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/pinctrl-bcm281xx.c
@@ -976,7 +976,7 @@ static inline void bcm281xx_pin_update(u32 *reg_val, u32 *reg_mask,
 	*reg_mask |= param_mask;
 }
 
-static struct regmap_config bcm281xx_pinctrl_regmap_config = {
+static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1435,7 +1435,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id bcm281xx_pinctrl_of_match[] = {
+static const struct of_device_id bcm281xx_pinctrl_of_match[] = {
 	{ .compatible = "brcm,bcm11351-pinctrl", },
 	{ },
 };
-- 
1.9.1
