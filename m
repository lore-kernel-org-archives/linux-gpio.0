From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v11 3/6] x86/intel-ivi: Add Intel In-Vehicle Infotainment (IVI) systems used in cars support
Date: Fri, 18 Nov 2016 13:22:27 +0800
Message-ID: <1479446550-28677-4-git-send-email-jui.nee.tan@intel.com>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

Add support for non ACPI system, such as system that uses Advanced Boot
Loader (ABL) whereby a platform device has to be created in order to bind
with PINCTRL/GPIO.

At the moment, Intel Apollo Lake SoC requires P2SB driver to hide and
unhide P2SB to lookup P2SB BAR and pass the PCI BAR address to GPIO.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
Changes in V11:
	- Select CONFIG_P2SB when CONFIG_X86_INTEL_IVI is enabled instead of
	  CONFIG_LPC_ICH is enabled. This is to fix kbuildbot error.

Changes in V10:
	- No change

Changes in V9:
	- No change

Changes in V8:
	- No change

 arch/x86/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bada636..6019755 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -512,6 +512,16 @@ config X86_INTEL_CE
 	  This option compiles in support for the CE4100 SOC for settop
 	  boxes and media devices.
 
+config X86_INTEL_IVI
+	bool "Intel In-Vehicle Infotainment (IVI) systems used in cars"
+	depends on X86 && PCI
+	select P2SB
+	---help---
+	  Select this option to enable MMIO BAR access over the P2SB for
+	  non-ACPI Intel Apollo Lake SoC platforms. This driver uses the P2SB
+	  hide/unhide mechanism cooperatively to pass the PCI BAR address to
+	  the platform driver, currently GPIO.
+
 config X86_INTEL_MID
 	bool "Intel MID platform support"
 	depends on X86_EXTENDED_PLATFORM
-- 
1.9.1
