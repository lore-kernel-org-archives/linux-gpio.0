From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/3] pinctrl: Add support for Intel Cannon Lake PCH
Date: Tue,  6 Jun 2017 16:18:16 +0300
Message-ID: <20170606131819.39845-1-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:49397 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751426AbdFFNSx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Jun 2017 09:18:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi,

This series adds support for the pinctrl and GPIO hardware found on the
next generation Intel Cannon Lake CPUs. We also update the Intel core
pinctrl driver with a concept of hardware pad groups that are needed by the
new driver and make it possible to specify mode per pin instead of the
whole group.

Changes from v1:

  - Instead of padown_fixed we will have gpp_num_padown_regs that is used
    directly if filled in.
  - Added Reviewed-by from Andy

Mika Westerberg (3):
  pinctrl: intel: Add support for variable size pad groups
  pinctrl: intel: Make it possible to specify mode per pin in a group
  pinctrl: intel: Add Intel Cannon Lake PCH pin controller support

 drivers/pinctrl/intel/Kconfig                |   8 +
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-cannonlake.c   | 442 +++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c        | 200 ++++++++----
 drivers/pinctrl/intel/pinctrl-intel.h        |  65 +++-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   1 +
 6 files changed, 653 insertions(+), 64 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-cannonlake.c

-- 
2.11.0

