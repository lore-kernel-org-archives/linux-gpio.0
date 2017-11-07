From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/4] [v7] pinctrl: qcom: add support for sparse GPIOs
Date: Tue,  7 Nov 2017 17:07:32 -0600
Message-ID: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56916 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752865AbdKGXHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2017 18:07:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: timur@codeaurora.org

A series of patches that add support for GPIO maps that have holes in
them.  That is, even though a client driver has N consecutive GPIOs,
some are just unavailable for whatever reason, and the hardware should
not be accessed for those GPIOs.

Frankly, I like V5 of this patchset better, because it uses an
existing API (gpiochip_add_pin_range) and is less intrusive.

v7: fixed missing signed-off-by in patch #1

Timur Tabi (4):
  [v2] Revert "gpio: set up initial state from .get_direction()"
  gpiolib: add bitmask for valid GPIO lines
  [v6] pinctrl: qcom: disable GPIO groups with no pins
  [v3] pinctrl: qcom: qdf2xxx: add support for new ACPI HID QCOM8002

 drivers/gpio/gpiolib.c                 |  74 +++++++++--------
 drivers/pinctrl/qcom/pinctrl-msm.c     |  48 +++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h     |   2 +
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 145 +++++++++++++++++++++++++--------
 include/linux/gpio/driver.h            |   2 +
 5 files changed, 197 insertions(+), 74 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

