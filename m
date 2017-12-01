From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH 0/4] [v8] pinctrl: qcom: add support for sparse GPIOs
Date: Fri,  1 Dec 2017 17:28:20 -0600
Message-ID: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41606 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751308AbdLAX23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Dec 2017 18:28:29 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
Cc: timur@codeaurora.org

A series of patches that add support for GPIO maps that have holes in
them.  That is, even though a client driver has N consecutive GPIOs,
some are just unavailable for whatever reason, and the hardware should
not be accessed for those GPIOs.

Note that this version does not address the failure of gpiod_get()
when GPIO 0 is not available.  I don't know how to fix that because I 
don't understand what gpiod_get() is trying to do.

Also note that I would prefer to have the call to gpiochip_available()
be inside gpiod_request(), but I don't know how to get the GPIO index
inside that function (without adding a function a parameter).

In other words, there will be a v9, but I need help.


v8:
  rebased onto 4.15-rc1
  fix issues raised during review of v7

Timur Tabi (4):
  [v2] Revert "gpio: set up initial state from .get_direction()"
  [v2] gpiolib: add bitmask for valid GPIO lines
  [v7] pinctrl: qcom: disable GPIO groups with no pins
  [v4] pinctrl: qcom: qdf2xxx: add support for new ACPI HID QCOM8002

 drivers/gpio/gpiolib.c                 |  80 ++++++++++++------
 drivers/pinctrl/qcom/pinctrl-msm.c     |  44 ++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h     |   2 +
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 145 +++++++++++++++++++++++++--------
 include/linux/gpio/driver.h            |   3 +
 5 files changed, 207 insertions(+), 67 deletions(-)

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

