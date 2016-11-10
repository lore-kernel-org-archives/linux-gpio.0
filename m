From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v10 0/6] pinctrl/broxton: enable platform device in the absent of ACPI enumeration
Date: Thu, 10 Nov 2016 17:00:24 +0800
Message-ID: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
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

Changes in V10:
	- Since P2SB is platform enablement driver and therefore should go into
	  drivers/platform/x86 (suggested by tglx).

Changes in V9:
	- Remove the filename from the header of lpc_ich_core.c (suggested by Lee).

Changes in V8:
	- Update new file name with lpc_ich_core.c at description of source file.
	- Rename source file lpc_ich-apl.c to lpc_ich_apl.c (suggested by Mika).
	- Rework Makefile with new source file name lpc_ich_apl.c.

Changes in V7:
	- EXPORT_SYMBOL_GPL() and MODULE_LICENSE("GPL v2") are used for new file
	  p2sb.c.
	- Split Kconfig option CONFIG_X86_INTEL_IVI to separate patch (suggested by
	  Lee).
	- Split new platform enabling into a separate patch.
	- Move lpc_chipsets enum's definition into a standalone header file which
	  can be used wherever its definition is needed.
	- Add author information and rewrite description of source file 
	  lpc_ich-apl.c and lpc_ich_apl.h.
	- Sort the header files by alphabetical order in lpc_ich-apl.c.
	- Rename header file lpc_ich-apl.h to lpc_ich_apl.h (suggested by Lee).
	- Remove unneeded pdata_size and platform_data from mfd_cell.
	  Also, remove unneeded apl_pinctrl_pdata.
	- Since variable apl_p2sb is only used once, hence switch it out for the
	  PCI_DEVFN macro (suggested by Lee).
	- Define APL_GPIO_COMMUNITY_MAX as total Apollo Lake GPIO communities
	  supported.
	- Set resources in mfd_cell for each GPIO community.
	- Call p2sb_bar() function once instead of four times inside the for loop.
	  And make p2sb_bar() function just to fill in the base address into a
	  scratch "struct resource" and have the loop do the additions to base/end.
	- Remove entire apl_pinctrl_pdata.name memory allocation since it is no
	  longer needed.
	- Return ret at the end of lpc_ich_add_gpio() function.

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
  drivers/platform/x86/p2sb: New Primary to Sideband bridge support
    driver for Intel SOC's

Tan Jui Nee (5):
  mfd: lpc_ich: Rename lpc-ich driver
  x86/intel-ivi: Add Intel In-Vehicle Infotainment (IVI) systems used in
    cars support
  mfd: move enum lpc_chipsets into lpc_ich.h
  mfd: lpc_ich: Add Device IDs for Intel Apollo Lake PCH
  mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in
    non-ACPI system

 arch/x86/Kconfig                          |   8 ++
 arch/x86/include/asm/p2sb.h               |  27 +++++++
 drivers/mfd/Kconfig                       |   2 +
 drivers/mfd/Makefile                      |   5 ++
 drivers/mfd/lpc_ich_apl.c                 | 120 ++++++++++++++++++++++++++++++
 drivers/mfd/lpc_ich_apl.h                 |  29 ++++++++
 drivers/mfd/{lpc_ich.c => lpc_ich_core.c} |  84 +++------------------
 drivers/platform/x86/Kconfig              |   4 +
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/p2sb.c               |  98 ++++++++++++++++++++++++
 include/linux/mfd/lpc_ich.h               |  72 ++++++++++++++++++
 11 files changed, 377 insertions(+), 73 deletions(-)
 create mode 100644 arch/x86/include/asm/p2sb.h
 create mode 100644 drivers/mfd/lpc_ich_apl.c
 create mode 100644 drivers/mfd/lpc_ich_apl.h
 rename drivers/mfd/{lpc_ich.c => lpc_ich_core.c} (93%)
 create mode 100644 drivers/platform/x86/p2sb.c

-- 
1.9.1
