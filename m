Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8920C19F38
	for <linux-gpio@archiver.kernel.org>; Mon,  2 Aug 2021 13:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB41B6113B
	for <linux-gpio@archiver.kernel.org>; Mon,  2 Aug 2021 13:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbhHBNWR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 2 Aug 2021 09:22:17 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1522 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbhHBNWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:22:16 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 02 Aug 2021 06:22:07 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Aug 2021 06:22:05 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Aug 2021 18:51:23 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 15BF25368; Mon,  2 Aug 2021 18:51:22 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     bhupesh.sharma@linaro.org, Das Srinagesh <gurus@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [RESEND PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML 
Date:   Mon,  2 Aug 2021 18:51:01 +0530
Message-Id: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, 

 I've rebased this series on linux-next. Patch [1/3] of this series is
 already applied but I'm resending it just to avoid Bot errors.

Thanks,
Satya Priya

satya priya (3):
  dt-bindings: mfd: pm8008: Add gpio-ranges and spmi-gpio compatible
  dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings
    to YAML
  dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  13 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 290 ---------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 239 +++++++++++++++++
 3 files changed, 249 insertions(+), 293 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

