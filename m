Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68FCC43460
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 17:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 855956113C
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 17:25:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDHRZk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:25:40 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9909 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232697AbhDHRZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 13:25:34 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 10:25:22 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg03-sd.qualcomm.com with ESMTP; 08 Apr 2021 10:25:09 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 86DD21910; Thu,  8 Apr 2021 10:25:08 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v2 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8008
Date:   Thu,  8 Apr 2021 10:25:07 -0700
Message-Id: <129d241ee510e28536d35dbfeee75474e12d8d22.1617901945.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
References: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
In-Reply-To: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
References: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the two GPIOs present on Qualcomm Technologies, Inc.
PM8008.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
Changes from last patchset:
- Moved "pm8008" up a line to keep things sorted alphabetically

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c2b9f2e..00870da 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1135,6 +1135,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
 	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
 	{ },
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

