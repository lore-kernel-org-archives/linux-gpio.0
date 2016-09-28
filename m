From: Tan Jui Nee <jui.nee.tan@intel.com>
Subject: [PATCH v7 3/6] x86/intel-ivi: Add Intel In-Vehicle Infotainment (IVI) systems used in cars support
Date: Wed, 28 Sep 2016 17:52:20 +0800
Message-ID: <1475056343-31907-4-git-send-email-jui.nee.tan@intel.com>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:35742 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752783AbcI1Jxm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Sep 2016 05:53:42 -0400
In-Reply-To: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jui.nee.tan@intel.com, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

Add support for non ACPI system, such as system that uses Advanced Boot
Loader (ABL) whereby a platform device has to be created in order to bind
with PINCTRL/GPIO.

At the moment, Intel Apollo Lake SoC requires P2SB driver to hide and
unhide P2SB to lookup P2SB BAR and pass the PCI BAR address to GPIO.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
---
 arch/x86/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index edc0313..ce5a048 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -511,6 +511,14 @@ config X86_INTEL_CE
 	  This option compiles in support for the CE4100 SOC for settop
 	  boxes and media devices.
 
+config X86_INTEL_IVI
+	bool "Intel In-Vehicle Infotainment (IVI) systems used in cars"
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

