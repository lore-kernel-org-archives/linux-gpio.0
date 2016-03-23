From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: [PATCH 03/17] pinctrl: qcom: ipq4019: fix register offsets
Date: Wed, 23 Mar 2016 17:04:58 -0500
Message-ID: <1458770712-10880-4-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com, Matthew McClintock <mmcclint@codeaurora.org>, linus.walleij@linaro.org, bjorn.andersson@linaro.org, Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh@kernel.org>, Mathieu Olivari <mathieu@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

For this SoC the register offsets changed from previous versions to be
separated by a larger amount.

CC: linus.walleij@linaro.org
CC: bjorn.andersson@linaro.org
Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index cb9f16a..b68ae42 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -254,11 +254,11 @@ DECLARE_QCA_GPIO_PINS(99);
 			qca_mux_##f14			\
 		},				        \
 		.nfuncs = 15,				\
-		.ctl_reg = 0x1000 + 0x10 * id,		\
-		.io_reg = 0x1004 + 0x10 * id,		\
-		.intr_cfg_reg = 0x1008 + 0x10 * id,	\
-		.intr_status_reg = 0x100c + 0x10 * id,	\
-		.intr_target_reg = 0x400 + 0x4 * id,	\
+		.ctl_reg = 0x0 + 0x1000 * id,		\
+		.io_reg = 0x4 + 0x1000 * id,		\
+		.intr_cfg_reg = 0x8 + 0x1000 * id,	\
+		.intr_status_reg = 0xc + 0x1000 * id,	\
+		.intr_target_reg = 0x8 + 0x1000 * id,	\
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
