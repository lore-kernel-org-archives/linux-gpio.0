From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH 0/3] pinctrl/broxton: enable platform device in the absent of ACPI enumeration
Date: Mon, 11 Apr 2016 10:50:41 +0800
Message-ID: <1460343044-1474-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:53952 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750937AbcDKCvU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 10 Apr 2016 22:51:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

Hi,
The patches are to cater the need for non-ACPI system whereby
a platform device has to be created in order to bind with
Apollo Lake Pinctrl GPIO platform driver.

The MMIO BAR is accessed over the Primary to Sideband bridge
(P2SB). Since the BIOS prevents the P2SB device from being
enumerated by the PCI subsystem, so we need to hide/unhide P2SB
to lookup the P2SB BAR and pass the PCI BAR address to the gpio
platform driver.

All these three patches have dependencies on each other.

Andy Shevchenko (1):
  x86/platform/p2sb: New Primary to Sideband bridge support driver for
    Intel SOC's

Tan Jui Nee (2):
  pinctrl/broxton: enable platform device in the absent of ACPI
    enumeration
  mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in
    non-ACPI system

 arch/x86/Kconfig                        |   4 ++
 arch/x86/include/asm/p2sb.h             |  27 ++++++++
 arch/x86/platform/intel/Makefile        |   1 +
 arch/x86/platform/intel/p2sb.c          |  99 ++++++++++++++++++++++++++
 drivers/mfd/Kconfig                     |   3 +-
 drivers/mfd/lpc_ich.c                   | 119 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-broxton.c |  43 ++++++++----
 7 files changed, 283 insertions(+), 13 deletions(-)
 create mode 100644 arch/x86/include/asm/p2sb.h
 create mode 100644 arch/x86/platform/intel/p2sb.c

-- 
1.9.1

