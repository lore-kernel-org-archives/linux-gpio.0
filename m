From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v4 0/6] Add pinctrl support for Baytrail
Date: Fri,  1 Apr 2016 14:00:01 +0300
Message-ID: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:12256 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759093AbcDAK4v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 1 Apr 2016 06:56:51 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>

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

--
1.9.1

