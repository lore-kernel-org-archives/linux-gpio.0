From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 39/50] pinctrl: lantiq: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:04 +0530
Message-ID: <1456319775-3216-40-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/pinctrl-lantiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c
index fc38a85..a4d6474 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -336,7 +336,7 @@ int ltq_pinctrl_register(struct platform_device *pdev,
 	desc->pmxops = &ltq_pmx_ops;
 	info->dev = &pdev->dev;
 
-	info->pctrl = pinctrl_register(desc, &pdev->dev, info);
+	info->pctrl = devm_pinctrl_register(&pdev->dev, desc, info);
 	if (IS_ERR(info->pctrl)) {
 		dev_err(&pdev->dev, "failed to register LTQ pinmux driver\n");
 		return PTR_ERR(info->pctrl);
-- 
2.1.4
