From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
Date: Sun, 28 Jan 2018 16:59:48 -0800
Message-ID: <20180129005948.7714-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Timur Tabi <timur@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

The base of the TLMM gpiochip should not be statically defined as 0, fix
this to not artificially restrict the existence of multiple pinctrl-msm
devices.

Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
Reported-by: Timur Tabi <timur@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 495432f3341b..95e5c5ea40af 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -818,7 +818,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		return -EINVAL;
 
 	chip = &pctrl->chip;
-	chip->base = 0;
+	chip->base = -1;
 	chip->ngpio = ngpio;
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
-- 
2.15.0
