From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/3][v3] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 27 Jul 2017 13:19:22 -0500
Message-ID: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57330 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751441AbdG0STa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2017 14:19:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: timur@codeaurora.org

First patch update gpiolib so that it requests the GPIO before trying to
initialize it.

Second patch allows for for pinctrl-msm to understand GPIO groups with
no pins.  Such pins are "hidden" and can't be exported or accessed.

Last patch updates the QDF2xxx driver to take advantage of all that.

v3: Add checks in IRQ mask and unmask functions


Timur Tabi (3):
  gliolib: request the gpio before querying its direction
  [v3] pinctrl: qcom: disable GPIO groups with no pins
  [v2] pinctrl: qcom: qdf2xxx: add support for new ACPI HID QCOM8002

 drivers/gpio/gpiolib.c                 |  11 +++
 drivers/pinctrl/qcom/pinctrl-msm.c     |  30 +++++--
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 139 ++++++++++++++++++++++++---------
 3 files changed, 139 insertions(+), 41 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

