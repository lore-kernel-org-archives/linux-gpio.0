From: Sanjeev Sharma <sanjeev_sharma@mentor.com>
Subject: [PATCH RESEND] pinctrl: freescale: make of_device_id array const
Date: Mon, 2 Mar 2015 12:55:01 +0530
Message-ID: <1425281101-6033-1-git-send-email-sanjeev_sharma@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:57389 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbCBHZJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 02:25:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: stefan@agner.ch, shawn.guo@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sanjeev Sharma <sanjeev_sharma@mentor.com>, Sanjeev Sharma <Sanjeev_Sharma@mentor.com>

Make of_device_id array const.

Signed-off-by: Sanjeev Sharma <Sanjeev_Sharma@mentor.com>
---
 drivers/pinctrl/freescale/pinctrl-vf610.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index fc86276..37a0375 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -302,7 +302,7 @@ static struct imx_pinctrl_soc_info vf610_pinctrl_info = {
 	.flags = SHARE_MUX_CONF_REG,
 };
 
-static struct of_device_id vf610_pinctrl_of_match[] = {
+static const struct of_device_id vf610_pinctrl_of_match[] = {
 	{ .compatible = "fsl,vf610-iomuxc", },
 	{ /* sentinel */ }
 };
-- 
1.7.11.7

