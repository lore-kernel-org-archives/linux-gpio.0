From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: [PATCH 01/17] pinctrl: qcom: ipq4019: set ngpios to correct value
Date: Wed, 23 Mar 2016 17:04:56 -0500
Message-ID: <1458770712-10880-2-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53128 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbcCWWFg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2016 18:05:36 -0400
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com, Matthew McClintock <mmcclint@codeaurora.org>, linus.walleij@linaro.org, bjorn.andersson@linaro.org, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

This should have been bumped to 100 when the extra pins
were added in the original pinctrl patch

CC: linus.walleij@linaro.org
CC: bjorn.andersson@linaro.org
Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index b5d81ce..cb5f0a8 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -414,7 +414,7 @@ static const struct msm_pinctrl_soc_data ipq4019_pinctrl = {
 	.nfunctions = ARRAY_SIZE(ipq4019_functions),
 	.groups = ipq4019_groups,
 	.ngroups = ARRAY_SIZE(ipq4019_groups),
-	.ngpios = 70,
+	.ngpios = 100,
 };
 
 static int ipq4019_pinctrl_probe(struct platform_device *pdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

