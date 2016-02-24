From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 48/50] pinctrl: tz1090 Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:13 +0530
Message-ID: <1456319775-3216-49-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and
remove the need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/pinctrl-tz1090.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinctrl-tz1090.c
index 5425299..04cbe53 100644
--- a/drivers/pinctrl/pinctrl-tz1090.c
+++ b/drivers/pinctrl/pinctrl-tz1090.c
@@ -1962,7 +1962,8 @@ static int tz1090_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pmx->regs))
 		return PTR_ERR(pmx->regs);
 
-	pmx->pctl = pinctrl_register(&tz1090_pinctrl_desc, &pdev->dev, pmx);
+	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tz1090_pinctrl_desc,
+					  pmx);
 	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		return PTR_ERR(pmx->pctl);
@@ -1975,15 +1976,6 @@ static int tz1090_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tz1090_pinctrl_remove(struct platform_device *pdev)
-{
-	struct tz1090_pmx *pmx = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(pmx->pctl);
-
-	return 0;
-}
-
 static const struct of_device_id tz1090_pinctrl_of_match[] = {
 	{ .compatible = "img,tz1090-pinctrl", },
 	{ },
@@ -1995,7 +1987,6 @@ static struct platform_driver tz1090_pinctrl_driver = {
 		.of_match_table	= tz1090_pinctrl_of_match,
 	},
 	.probe	= tz1090_pinctrl_probe,
-	.remove	= tz1090_pinctrl_remove,
 };
 
 static int __init tz1090_pinctrl_init(void)
-- 
2.1.4
