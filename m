From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/2][v4] pinctrl: qcom: add support for sparse GPIOs
Date: Wed, 23 Aug 2017 18:47:09 -0500
Message-ID: <1503532031-6428-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36536 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751003AbdHWXrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 19:47:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, andy.gross@linaro.org, david.brown@linaro.org, anjiandi@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: timur@codeaurora.org

First patch allows for for pinctrl-msm to understand GPIO groups with
no pins.  Such pins are "hidden" and can't be exported or accessed.

Second patch updates the QDF2xxx driver to take advantage of all that.

v4:
  Introduce 'sparse' variable
  Update irq_valid_mask instead of conditionals in every IRQ function

Timur Tabi (2):
  [v4] pinctrl: qcom: disable GPIO groups with no pins
  [v3] pinctrl: qcom: qdf2xxx: add support for new ACPI HID QCOM8002

 drivers/pinctrl/qcom/pinctrl-msm.c     |  36 ++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h     |   2 +
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 145 +++++++++++++++++++++++++--------
 3 files changed, 142 insertions(+), 41 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

