From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 40/50] pinctrl: lpc18xx: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:05 +0530
Message-ID: <1456319775-3216-41-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Joachim Eastwood <manabian@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index f0bebbe..7227e40 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1225,7 +1225,7 @@ static int lpc18xx_scu_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, scu);
 
-	scu->pctl = pinctrl_register(&lpc18xx_scu_desc, &pdev->dev, scu);
+	scu->pctl = devm_pinctrl_register(&pdev->dev, &lpc18xx_scu_desc, scu);
 	if (IS_ERR(scu->pctl)) {
 		dev_err(&pdev->dev, "Could not register pinctrl driver\n");
 		clk_disable_unprepare(scu->clk);
@@ -1239,7 +1239,6 @@ static int lpc18xx_scu_remove(struct platform_device *pdev)
 {
 	struct lpc18xx_scu_data *scu = platform_get_drvdata(pdev);
 
-	pinctrl_unregister(scu->pctl);
 	clk_disable_unprepare(scu->clk);
 
 	return 0;
-- 
2.1.4
