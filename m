Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A67C4338F
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Jul 2021 08:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B20C960E77
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Jul 2021 08:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhGWHvj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 23 Jul 2021 03:51:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24585 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbhGWHvj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 03:51:39 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2021 01:32:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2021 01:32:08 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 23 Jul 2021 14:01:33 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3872C52A3; Fri, 23 Jul 2021 14:01:32 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Das Srinagesh <gurus@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML
Date:   Fri, 23 Jul 2021 14:01:11 +0530
Message-Id: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

satya priya (3):
  dt-bindings: mfd: pm8008: Add gpio-ranges and spmi-gpio compatible
  dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings
    to YAML
  dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  13 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 ---------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 239 +++++++++++++++++
 3 files changed, 249 insertions(+), 291 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

