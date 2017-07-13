From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/2] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 13 Jul 2017 16:52:41 -0500
Message-ID: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55580 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbdGMVws (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2017 17:52:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: timur@codeaurora.org

First patch allows for for pinctrl-msm to understand GPIO groups with
no pins.  Such pins are "hidden" and can't be exported or accessed.

Second patch update the QDF2xxx driver to take advantage of that.

Timur Tabi (2):
  pinctrl: qcom: disable GPIO groups with no pins
  pinctrl: qcom: qdf2xxx: add support for new ACPI HID QCOM8002

 drivers/pinctrl/qcom/pinctrl-msm.c     |  36 ++++++--
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 157 +++++++++++++++++++++++----------
 2 files changed, 142 insertions(+), 51 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

