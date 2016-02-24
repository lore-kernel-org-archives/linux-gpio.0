From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 37/50] pinctrl: at91: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:02 +0530
Message-ID: <1456319775-3216-38-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and remove
the need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/pinctrl-at91.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 523b6b7..f265ebe 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1252,7 +1252,8 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, info);
-	info->pctl = pinctrl_register(&at91_pinctrl_desc, &pdev->dev, info);
+	info->pctl = devm_pinctrl_register(&pdev->dev, &at91_pinctrl_desc,
+					   info);
 
 	if (IS_ERR(info->pctl)) {
 		dev_err(&pdev->dev, "could not register AT91 pinctrl driver\n");
@@ -1269,15 +1270,6 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int at91_pinctrl_remove(struct platform_device *pdev)
-{
-	struct at91_pinctrl *info = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(info->pctl);
-
-	return 0;
-}
-
 static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
@@ -1821,7 +1813,6 @@ static struct platform_driver at91_pinctrl_driver = {
 		.of_match_table = at91_pinctrl_of_match,
 	},
 	.probe = at91_pinctrl_probe,
-	.remove = at91_pinctrl_remove,
 };
 
 static struct platform_driver * const drivers[] = {
-- 
2.1.4
