From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v6 0/3] pinctrl/broxton: enable platform device in the absent of ACPI enumeration
Date: Thu, 14 Jul 2016 16:11:56 +0800
Message-ID: <1468483919-31258-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

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

Changes in V6:
	- Rename CONFIG_X86_INTEL_APL to CONFIG_X86_INTEL_IVI so that it
	  relates to the actual product, as suggested by Mika.
	- Rework Makefile according Andy's comments.
	- Rename lpc_ich_misc() to lpc_ich_add_gpio() so that the name should not
	  be so generic, as suggested by Andy.
	- Call lpc_ich_add_gpio() via priv->chipset.
	- lpc_ich_add_gpio() function will be moved from 
	  .../include/linux/mfd/lpc_ich.h to
	  .../drivers/mfd/lpc_ich-apl.h
	  as this is a part of internal driver interface as suggested by Andy.
	- Move enum lpc_chipsets from 
	  .../drivers/mfd/lpc_ich-core.c to
	  .../include/linux/mfd/lpc_ich.h
	  as lpc_chipsets is also accessed by lpc_ich_add_gpio().
	- Check if kasprintf return value for all 4 gpio controllers before
	  proceed to add platform device by using mfd_add_devices().

Changes in V5:
	- Split lpc-ich driver into two parts (lpc_ich-core and lpc_ich-apl).
	  The file lpc_ich-apl.c introduces gpio platform driver in MFD.
	- Rename Kconfig option CONFIG_X86_INTEL_NON_ACPI to CONFIG_X86_INTEL_APL
	  so that it reflects actual product as suggested by Mika.
	- The patch: 
	  [PATCH] pinctrl/broxton: enable platform device in the absent of ACPI enumeration
	  is removed in V5 patch-set as the patch is already applied in Linus' pinctrl tree.

Changes in V4:
	- Move Kconfig option CONFIG_X86_INTEL_NON_ACPI from
	  [PATCH 2/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
	  to
	  [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
	  since the config is used in latter patch.
	- Select CONFIG_P2SB when CONFIG_LPC_ICH is enabled.
	- Remove #ifdef CONFIG_X86_INTEL_NON_ACPI and use
	  #if defined(CONFIG_X86_INTEL_NON_ACPI) when lpc_ich_misc is called
	  as suggested by Lee Jones.
	- Use single dimensional array instead of 2D array for apl_gpio_io_res
	  structure and use DEFINE_RES_IRQ for its IRQ resource.

Changes in V3:
	- Simplify register addresses calculation and use DEFINE_RES_MEM_NAMED
	  defines for apl_gpio_io_res structure
	- Define magic number for P2SB PCI ID
	- Replace switch-case with if-else since currently we have only one
	  use case
	- Only call mfd_add_devices() once for all gpio communities

Changes in V2:
	- Add new config option CONFIG_X86_INTEL_NON_ACPI and "select PINCTRL"
	  to fix kbuildbot error

Andy Shevchenko (1):
  x86/platform/p2sb: New Primary to Sideband bridge support driver for
    Intel SOC's

Tan Jui Nee (2):
  mfd: lpc_ich: Rename lpc-ich driver
  mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in
    non-ACPI system

 arch/x86/Kconfig                          |  13 +++
 arch/x86/include/asm/p2sb.h               |  27 +++++++
 arch/x86/platform/intel/Makefile          |   1 +
 arch/x86/platform/intel/p2sb.c            |  99 +++++++++++++++++++++++
 drivers/mfd/Kconfig                       |   3 +-
 drivers/mfd/Makefile                      |   4 +
 drivers/mfd/lpc_ich-apl.c                 | 130 ++++++++++++++++++++++++++++++
 drivers/mfd/lpc_ich-apl.h                 |  28 +++++++
 drivers/mfd/{lpc_ich.c => lpc_ich-core.c} |  81 +++----------------
 include/linux/mfd/lpc_ich.h               |  73 +++++++++++++++++
 10 files changed, 387 insertions(+), 72 deletions(-)
 create mode 100644 arch/x86/include/asm/p2sb.h
 create mode 100644 arch/x86/platform/intel/p2sb.c
 create mode 100644 drivers/mfd/lpc_ich-apl.c
 create mode 100644 drivers/mfd/lpc_ich-apl.h
 rename drivers/mfd/{lpc_ich.c => lpc_ich-core.c} (94%)

-- 
1.9.1
