Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D86C433E9
	for <linux-gpio@archiver.kernel.org>; Fri,  5 Mar 2021 06:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E26E65016
	for <linux-gpio@archiver.kernel.org>; Fri,  5 Mar 2021 06:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCEGan (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 5 Mar 2021 01:30:43 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14893 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCEGan (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 01:30:43 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 22:30:43 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 22:30:40 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 12:00:16 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 898CE3C33; Fri,  5 Mar 2021 12:00:14 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/3] Add GPIO support for the PM7325, PM8350c, PMK8350 and PMR735A
Date:   Fri,  5 Mar 2021 11:59:56 +0530
Message-Id: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

satya priya (3):
  pinctrl: qcom: spmi-gpio: Add support for four variants
  dt-bindings: pinctrl: qcom-pmic-gpio: Convert pmic gpio bindings to
    YAML
  dt-bindings: pinctrl: qcom-pmic-gpio: Add pmic gpio support

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 272 --------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 281 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   4 +
 3 files changed, 285 insertions(+), 272 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

