From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/6] pinctrl: Fixes and updates to Intel drivers
Date: Tue, 10 Jan 2017 17:31:55 +0300
Message-ID: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This series fixes one issue found on Broxton, updates the core driver to
use devm_gpiochip_add_data() and finally add support for the next
generation Intel GPIO hardware available starting from Intel Gemini Lake SoC.

The Gemini Lake SoC brings hardware debouncer per-pad and 1k additional
pull-down. In order to configure the hardware debouncer, this series adds a
new function to pinctrl core; pinctrl_gpio_set_config(). This function can
be used by gpiolib-based GPIO drivers to ask the backing pinctrl driver to
apply certain configuration, like setting debounce time.

Changes from v1:
 * Added Reviewed-by from Andy
 * Use goto exit_unlock in intel_config_set_debounce()
 * Features are now prefixed with PINCTRL_FEATURE_*

Mika Westerberg (6):
  pinctrl: broxton: Use correct PADCFGLOCK offset
  pinctrl: intel: Convert to use devm_gpiochip_add_data()
  pinctrl: Add a possibility to configure pins from a gpiolib based drivers
  pinctrl: intel: Add support for hardware debouncer
  pinctrl: intel: Add support for 1k additional pull-down
  pinctrl: intel: Add Intel Gemini Lake pin controller support

 drivers/pinctrl/core.c                       |  28 ++
 drivers/pinctrl/intel/Kconfig                |   8 +
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-broxton.c      |   3 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 512 +++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-intel.c        | 178 ++++++++--
 drivers/pinctrl/intel/pinctrl-intel.h        |   8 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   1 -
 drivers/pinctrl/pinconf.c                    |  12 +
 drivers/pinctrl/pinconf.h                    |  10 +
 include/linux/pinctrl/consumer.h             |   8 +
 11 files changed, 744 insertions(+), 25 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-geminilake.c

-- 
2.11.0
