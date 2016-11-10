From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v10 1/6] drivers/platform/x86/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
Date: Thu, 10 Nov 2016 17:00:25 +0800
Message-ID: <1478768430-13422-2-git-send-email-jui.nee.tan@intel.com>
References: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is already one and at least one more user coming which
require an access to Primary to Sideband bridge (P2SB) in order
to get IO or MMIO bar hidden by BIOS.
Create a driver to access P2SB for x86 devices.

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in V10:
	- Since P2SB is platform enablement driver and therefore should go into
	  drivers/platform/x86 (suggested by tglx).

Changes in V9:
	- No change

Changes in V8:
	- No change

Changes in V7:
	- EXPORT_SYMBOL_GPL() and MODULE_LICENSE("GPL v2") are used for new file
	  p2sb.c.

Changes in V6:
	- No change

Changes in V5:
	- No change

Changes in V4:
	- Move Kconfig option CONFIG_X86_INTEL_NON_ACPI from
	  [PATCH 2/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
	  to
	  [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
	  since the config is used in latter patch.

Changes in V3:
	- No change

Changes in V2:
	- Add new config option CONFIG_X86_INTEL_NON_ACPI and "select PINCTRL"
	  to fix kbuildbot error

 arch/x86/include/asm/p2sb.h   | 27 ++++++++++++
 drivers/platform/x86/Kconfig  |  4 ++
 drivers/platform/x86/Makefile |  1 +
 drivers/platform/x86/p2sb.c   | 98 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 arch/x86/include/asm/p2sb.h
 create mode 100644 drivers/platform/x86/p2sb.c

diff --git a/arch/x86/include/asm/p2sb.h b/arch/x86/include/asm/p2sb.h
new file mode 100644
index 0000000..686e07b
--- /dev/null
+++ b/arch/x86/include/asm/p2sb.h
@@ -0,0 +1,27 @@
+/*
+ * Primary to Sideband bridge (P2SB) access support
+ */
+
+#ifndef P2SB_SYMS_H
+#define P2SB_SYMS_H
+
+#include <linux/ioport.h>
+#include <linux/pci.h>
+
+#if IS_ENABLED(CONFIG_P2SB)
+
+int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
+	struct resource *res);
+
+#else /* CONFIG_P2SB is not set */
+
+static inline
+int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
+	struct resource *res)
+{
+	return -ENODEV;
+}
+
+#endif /* CONFIG_P2SB */
+
+#endif /* P2SB_SYMS_H */
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b8a21d7..65ef6a0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1027,4 +1027,8 @@ config INTEL_TELEMETRY
 	  used to get various SoC events and parameters
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
+
+config P2SB
+	tristate
+	depends on PCI
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2efa86d..c39a13d 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,3 +71,4 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
+obj-$(CONFIG_P2SB)			+= p2sb.o
diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
new file mode 100644
index 0000000..b1d784c
--- /dev/null
+++ b/drivers/platform/x86/p2sb.c
@@ -0,0 +1,98 @@
+/*
+ * Primary to Sideband bridge (P2SB) driver
+ *
+ * Copyright (c) 2016, Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *			Jonathan Yong <jonathan.yong@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+
+#include <asm/p2sb.h>
+
+#define SBREG_BAR	0x10
+#define SBREG_HIDE	0xe1
+
+static DEFINE_SPINLOCK(p2sb_spinlock);
+
+/*
+ * p2sb_bar - Get Primary to Sideband bridge (P2SB) BAR
+ * @pdev:	PCI device to get PCI bus to communicate with
+ * @devfn:	PCI device and function to communicate with
+ * @res:	resources to be filled in
+ *
+ * The BIOS prevents the P2SB device from being enumerated by the PCI
+ * subsystem, so we need to unhide and hide it back to lookup the P2SB BAR.
+ *
+ * Locking is handled by spinlock - cannot sleep.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
+	struct resource *res)
+{
+	u32 base_addr;
+	u64 base64_addr;
+	unsigned long flags;
+
+	if (!res)
+		return -EINVAL;
+
+	spin_lock(&p2sb_spinlock);
+
+	/* Unhide the P2SB device */
+	pci_bus_write_config_byte(pdev->bus, devfn, SBREG_HIDE, 0x00);
+
+	/* Check if device present */
+	pci_bus_read_config_dword(pdev->bus, devfn, 0, &base_addr);
+	if (base_addr == 0xffffffff || base_addr == 0x00000000) {
+		spin_unlock(&p2sb_spinlock);
+		dev_warn(&pdev->dev, "P2SB device access disabled by BIOS?\n");
+		return -ENODEV;
+	}
+
+	/* Get IO or MMIO BAR */
+	pci_bus_read_config_dword(pdev->bus, devfn, SBREG_BAR, &base_addr);
+	if ((base_addr & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO) {
+		flags = IORESOURCE_IO;
+		base64_addr = base_addr & PCI_BASE_ADDRESS_IO_MASK;
+	} else {
+		flags = IORESOURCE_MEM;
+		base64_addr = base_addr & PCI_BASE_ADDRESS_MEM_MASK;
+		if (base_addr & PCI_BASE_ADDRESS_MEM_TYPE_64) {
+			flags |= IORESOURCE_MEM_64;
+			pci_bus_read_config_dword(pdev->bus, devfn,
+				SBREG_BAR + 4, &base_addr);
+			base64_addr |= (u64)base_addr << 32;
+		}
+	}
+
+	/* Hide the P2SB device */
+	pci_bus_write_config_byte(pdev->bus, devfn, SBREG_HIDE, 0x01);
+
+	spin_unlock(&p2sb_spinlock);
+
+	/* User provides prefilled resources */
+	res->start = (resource_size_t)base64_addr;
+	res->flags = flags;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(p2sb_bar);
+
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
