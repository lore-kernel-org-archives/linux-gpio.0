From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: intel: Only restore pins that are used by the driver
Date: Mon, 10 Oct 2016 16:39:31 +0300
Message-ID: <20161010133931.88055-1-mika.westerberg@linux.intel.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:15074 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752063AbcJJNjg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Oct 2016 09:39:36 -0400
In-Reply-To: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, AceLan Kao <acelan.kao@canonical.com>, Calvin Johnson <linux.cj@gmail.com>, Mario.Limonciello@dell.com, Jared.Dominguez@dell.com, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

Dell XPS 13 (and maybe some others) uses a GPIO (CPU_GP_1) during suspend
to explicitly disable USB touchscreen interrupt. This is done to prevent
situation where the lid is closed the touchscreen is left functional.

The pinctrl driver (wrongly) assumes it owns all pins which are owned by
host and not locked down. It is perfectly fine for BIOS to use those pins
as it is also considered as host in this context.

What happens is that when the lid of Dell XPS 13 is closed, the BIOS
configures CPU_GP_1 low disabling the touchscreen interrupt. During resume
we restore all host owned pins to the known state which includes CPU_GP_1
and this overwrites what the BIOS has programmed there causing the
touchscreen to fail as no interrupts are reaching the CPU anymore.

Fix this by restoring only those pins we know are explicitly requested by
the kernel one way or other.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=176361
Reported-by: AceLan Kao <acelan.kao@canonical.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
AceLan,

Can you try this one as well? It should do prevent the driver from messing
the pins used by the BIOS.

 drivers/pinctrl/intel/pinctrl-intel.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 257cab129692..2b5b20bf7d99 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -19,6 +19,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
+#include "../core.h"
 #include "pinctrl-intel.h"
 
 /* Offset from regs */
@@ -1079,6 +1080,26 @@ int intel_pinctrl_remove(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(intel_pinctrl_remove);
 
 #ifdef CONFIG_PM_SLEEP
+static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned pin)
+{
+	const struct pin_desc *pd = pin_desc_get(pctrl->pctldev, pin);
+
+	if (!pd || !intel_pad_usable(pctrl, pin))
+		return false;
+
+	/*
+	 * Only restore the pin if it is actually in use by the kernel (or
+	 * by userspace). It is possible that some pins are used by the
+	 * BIOS during resume and those are not always locked down so leave
+	 * them alone.
+	 */
+	if (pd->mux_owner || pd->gpio_owner ||
+	    gpiochip_line_is_irq(&pctrl->chip, pin))
+		return true;
+
+	return false;
+}
+
 int intel_pinctrl_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1092,7 +1113,7 @@ int intel_pinctrl_suspend(struct device *dev)
 		const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
 		u32 val;
 
-		if (!intel_pad_usable(pctrl, desc->number))
+		if (!intel_pinctrl_should_save(pctrl, desc->number))
 			continue;
 
 		val = readl(intel_get_padcfg(pctrl, desc->number, PADCFG0));
@@ -1153,7 +1174,7 @@ int intel_pinctrl_resume(struct device *dev)
 		void __iomem *padcfg;
 		u32 val;
 
-		if (!intel_pad_usable(pctrl, desc->number))
+		if (!intel_pinctrl_should_save(pctrl, desc->number))
 			continue;
 
 		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG0);
-- 
2.9.3

