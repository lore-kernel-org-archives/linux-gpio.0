Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04222C433B4
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 17:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4AD961139
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Apr 2021 17:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhDHRZX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:25:23 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:32842 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232615AbhDHRZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 13:25:22 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 10:25:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 08 Apr 2021 10:25:09 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 7D54E1A71; Thu,  8 Apr 2021 10:25:08 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8008 support
Date:   Thu,  8 Apr 2021 10:25:06 -0700
Message-Id: <2be34cc205ae96d40b04a9efdcf9287d5da9d1c0.1617901945.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the 2 GPIOs present on Qualcomm Technologies, Inc.
PM8008.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
Changes from last patchset:
- Moved "pm8008" up a line to keep things sorted alphabetically

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 70e119b..f6a97605 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -35,6 +35,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmr735b-gpio"
 		    "qcom,pm6150-gpio"
 		    "qcom,pm6150l-gpio"
+		    "qcom,pm8008-gpio"
 		    "qcom,pmx55-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
@@ -123,6 +124,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio4 for pmr735b
 		    gpio1-gpio10 for pm6150
 		    gpio1-gpio12 for pm6150l
+		    gpio1-gpio2 for pm8008
 		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
 					    and gpio11)
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

