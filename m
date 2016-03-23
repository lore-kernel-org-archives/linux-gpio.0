From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: [PATCH 02/17] pinctrl: qcom: ipq4019: fix the function enum for gpio mode
Date: Wed, 23 Mar 2016 17:04:57 -0500
Message-ID: <1458770712-10880-3-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com, Matthew McClintock <mmcclint@codeaurora.org>, linus.walleij@linaro.org, bjorn.andersson@linaro.org, Rob Herring <robh@kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Without this, we would fail to set the mode to gpio if trying to
configure for that mode

CC: linus.walleij@linaro.org
CC: bjorn.andersson@linaro.org
Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index cb5f0a8..cb9f16a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -237,7 +237,7 @@ DECLARE_QCA_GPIO_PINS(99);
 		.pins = gpio##id##_pins,		\
 		.npins = (unsigned)ARRAY_SIZE(gpio##id##_pins),	\
 		.funcs = (int[]){			\
-			qca_mux_NA, /* gpio mode */	\
+			qca_mux_gpio, /* gpio mode */	\
 			qca_mux_##f1,			\
 			qca_mux_##f2,			\
 			qca_mux_##f3,			\
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
