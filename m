From: WangBo <wdjjwb@163.com>
Subject: [PATCH] pinctrl: nomadik: fix possible object reference leak
Date: Fri, 15 Feb 2019 16:01:36 +0800
Message-ID: <1550217696-3006-1-git-send-email-wdjjwb@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wang.bo116@zte.com.cn
List-Id: linux-gpio@vger.kernel.org

The of_find_device_by_node takes a reference to the struct device
when find the match device ,we should release it when fail.

Signed-off-by: WangBo <wang.bo116@zte.com.cn>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 4cc2c47f8778..ec02739bd21b 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1056,17 +1056,22 @@ static struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
 	}
 	if (of_property_read_u32(np, "gpio-bank", &id)) {
 		dev_err(&pdev->dev, "populate: gpio-bank property not found\n");
+		platform_device_put(gpio_pdev);
 		return ERR_PTR(-EINVAL);
 	}
 
 	/* Already populated? */
 	nmk_chip = nmk_gpio_chips[id];
-	if (nmk_chip)
+	if (nmk_chip) {
+		platform_device_put(gpio_pdev);
 		return nmk_chip;
+	}
 
 	nmk_chip = devm_kzalloc(&pdev->dev, sizeof(*nmk_chip), GFP_KERNEL);
-	if (!nmk_chip)
+	if (!nmk_chip) {
+		platform_device_put(gpio_pdev);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	nmk_chip->bank = id;
 	chip = &nmk_chip->chip;
@@ -1077,13 +1082,17 @@ static struct nmk_gpio_chip *nmk_gpio_populate_chip(struct device_node *np,
 
 	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
+	if (IS_ERR(base)) {
+		platform_device_put(gpio_pdev);
 		return ERR_CAST(base);
+	}
 	nmk_chip->addr = base;
 
 	clk = clk_get(&gpio_pdev->dev, NULL);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		platform_device_put(gpio_pdev);
 		return (void *) clk;
+	}
 	clk_prepare(clk);
 	nmk_chip->clk = clk;
 
-- 
2.15.2
