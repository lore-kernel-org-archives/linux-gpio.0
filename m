From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 43/50] pinctrl: pistachio: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:08 +0530
Message-ID: <1456319775-3216-44-git-send-email-ldewangan@nvidia.com>
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
 drivers/pinctrl/pinctrl-pistachio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 856f736..adf526d 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1457,8 +1457,8 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pistachio_pinctrl_desc.pins = pctl->pins;
 	pistachio_pinctrl_desc.npins = pctl->npins;
 
-	pctl->pctldev = pinctrl_register(&pistachio_pinctrl_desc, &pdev->dev,
-					 pctl);
+	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
+					      pctl);
 	if (IS_ERR(pctl->pctldev)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
 		return PTR_ERR(pctl->pctldev);
-- 
2.1.4
