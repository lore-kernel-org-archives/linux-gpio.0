From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] pinctrl: Add support for Intel Cannon Lake PCH
Date: Mon,  5 Jun 2017 15:56:47 +0300
Message-ID: <20170605125650.64188-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hi,

This series adds support for the pinctrl and GPIO hardware found on the
next generation Intel Cannon Lake CPUs. We also update the Intel core
pinctrl driver with a concept of hardware pad groups that are needed by the
new driver and make it possible to specify mode per pin instead of the
whole group.

Mika Westerberg (3):
  pinctrl: intel: Add support for variable size pad groups
  pinctrl: intel: Make it possible to specify mode per pin in a group
  pinctrl: intel: Add Intel Cannon Lake PCH pin controller support

 drivers/pinctrl/intel/Kconfig                |   8 +
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-cannonlake.c   | 442 +++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c        | 195 ++++++++----
 drivers/pinctrl/intel/pinctrl-intel.h        |  64 +++-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   1 +
 6 files changed, 647 insertions(+), 64 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-cannonlake.c

-- 
2.11.0
