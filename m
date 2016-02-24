From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 42/50] pinctrl: pic32: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:46:07 +0530
Message-ID: <1456319775-3216-43-git-send-email-ldewangan@nvidia.com>
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
 drivers/pinctrl/pinctrl-pic32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 0b07d4b..2a3fcd6 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2194,7 +2194,8 @@ static int pic32_pinctrl_probe(struct platform_device *pdev)
 	pic32_pinctrl_desc.custom_params = pic32_mpp_bindings;
 	pic32_pinctrl_desc.num_custom_params = ARRAY_SIZE(pic32_mpp_bindings);
 
-	pctl->pctldev = pinctrl_register(&pic32_pinctrl_desc, &pdev->dev, pctl);
+	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pic32_pinctrl_desc,
+					      pctl);
 	if (IS_ERR(pctl->pctldev)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
 		return PTR_ERR(pctl->pctldev);
-- 
2.1.4
