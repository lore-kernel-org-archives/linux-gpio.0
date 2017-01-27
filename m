From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] pinctrl: Add support for Intel Gemini Lake
Date: Fri, 27 Jan 2017 13:07:13 +0300
Message-ID: <20170127100716.194910-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

These patches were originally introduced as part of patch series available
here:

  https://lkml.org/lkml/2017/1/10/497

But I split out the generic pinconfig patches into another series which is
now merged in linux-pinctrl.git/devel.

This series applies on top of that.

Intel Gemini Lake is the next generation CPU which includes newer GPIO IP
hardware. This hardware has per-pin debouncer and can configure 1k
pull-down in addition to the existing features. This series adds support
for it.

Since the patch series only relates to Intel Gemini Lake, I renamed the
subject line and restarted revision numbering.

Mika Westerberg (3):
  pinctrl: intel: Add support for hardware debouncer
  pinctrl: intel: Add support for 1k additional pull-down
  pinctrl: intel: Add Intel Gemini Lake pin controller support

 drivers/pinctrl/intel/Kconfig              |   8 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-geminilake.c | 512 +++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c      | 146 +++++++-
 drivers/pinctrl/intel/pinctrl-intel.h      |   6 +
 5 files changed, 671 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-geminilake.c

-- 
2.11.0
