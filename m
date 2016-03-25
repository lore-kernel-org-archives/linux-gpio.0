From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH 0/6] Add pinctrl support for Baytrail
Date: Fri, 25 Mar 2016 16:51:30 +0200
Message-ID: <1458917496-22794-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:26743 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751989AbcCYOsh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 25 Mar 2016 10:48:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org
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

