Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE9AC433F5
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Sep 2021 12:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F00D61157
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Sep 2021 12:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhINM4y (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:56:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54337 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhINM4v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 08:56:51 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2021 05:55:34 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2021 05:55:32 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Sep 2021 18:25:11 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 5A9A954C1; Tue, 14 Sep 2021 18:25:10 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, David Collins <collinsd@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Satya Priya <skakit@codeaurora.org>
Subject: [PATCH V4 0/2] Add Vol+ support for sc7280-idp
Date:   Tue, 14 Sep 2021 18:25:06 +0530
Message-Id: <1631624108-15491-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

David Collins (1):
  pinctrl: qcom: spmi-gpio: correct parent irqspec translation

satya priya (1):
  arm64: dts: sc7280: Add volume up support for sc7280-idp

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 ++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

