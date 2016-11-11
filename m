From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 0/3] pinctrl: sunxi: Support generic pinconf functions
Date: Fri, 11 Nov 2016 10:44:52 +0800
Message-ID: <20161111024455.16883-1-wens@csie.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:35178 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965535AbcKKCo6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Nov 2016 21:44:58 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com

Hi everyone,

This series fixes up generic pinconf support for the sunxi pinctrl driver
library. The driver was doing some bits wrong, like a) storing the pinconf
config value in its struct, and not actually reading the hardware to get
the current config, and b) not using the right arguments for the bias
parameters.

Patch 1 fixes the pin bias parameter arguments.

Patch 2 makes the driver read out pinconf settings from the hardware, and
returns the correct value for unsupported features and disable features.
With this in place it also declares itself as generic pinconf compatible,
which enables us to read the config through the debugfs pinconf interface.

Patch 3 makes the sunxi_pconf_group_set callback use the helper function
introduced in patch 1. 

Changes since v1:

  - Rebased onto the updated sunxi pinctrl driver with support for the
    generic pinconf bindings

  - Use separate value for what is written to the register in the pinconf
    set function, as Maxime requested.

Regards
ChenYu


Chen-Yu Tsai (3):
  pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP} argument
  pinctrl: sunxi: Add support for fetching pinconf settings from
    hardware
  pinctrl: sunxi: Make sunxi_pconf_group_set use sunxi_pconf_reg helper

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 156 +++++++++++++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |   1 -
 2 files changed, 118 insertions(+), 39 deletions(-)

-- 
2.10.2

