From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v4 0/6] Add pinctrl support for Baytrail
Date: Fri,  1 Apr 2016 13:56:11 +0300
Message-ID: <1459508183-21843-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>
List-Id: linux-gpio@vger.kernel.org

Add support for pin control (pin muxing and pin configuration) for Baytrail
platform.

It follows the design in pinctrl-intel.c, but could not use the
implementation in pinctrl-intel since there were significant differences:
	- gpio pin pads are not ordered
	- per group functions: for setting a certain mode, there are groups
	that need setting pins with different values; for instance, for
	setting USB ULPI pins to GPIO function, pin 2 (GPIO_SUS1) needs
	to be set to function 1, wihle all other from the group need to be
	set to 0
	- communities only need pin base and count as specific data
	- irq set type only clears all flags, while the actual type setting
	is made in the byt_irq_unmask function, which does not comply with
	the intel pinctrl implementation

Changes from v3:
	- fix GPIO_* pin names to match naming conventions used in other
	Intel pinctrl drivers

Changes from v2:
	- remove comment for each enumerated pin
	- apply pin naming conventions used in other Intel drivers

Changes from v1:
	- fix reg, reg_val and byt_soc_data not used variables warnings

Cristina Ciocan (6):
  pinctrl: baytrail: Add pin control data structures
  pinctrl: baytrail: Add pin control operations
  pinctrl: baytrail: Update gpio chip operations
  pinctrl: baytrail: Update irq chip operations
  pinctrl: baytrail: Register pin control handling
  pinctrl: baytrail: Add debounce configuration

 drivers/pinctrl/intel/Kconfig            |    3 +
 drivers/pinctrl/intel/pinctrl-baytrail.c | 1690 +++++++++++++++++++++++++-----
 2 files changed, 1444 insertions(+), 249 deletions(-)
