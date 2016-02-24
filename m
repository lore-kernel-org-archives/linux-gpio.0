From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 44/50] pinctrl: rockchip: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:09 +0530
Message-ID: <1456319775-3216-45-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index bf032b9..3427103 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1636,7 +1636,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	info->pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, info);
+	info->pctl_dev = devm_pinctrl_register(&pdev->dev, ctrldesc, info);
 	if (IS_ERR(info->pctl_dev)) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
 		return PTR_ERR(info->pctl_dev);
-- 
2.1.4
