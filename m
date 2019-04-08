From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH v2] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Mon,  8 Apr 2019 17:51:27 +0800
Message-ID: <20190408095127.6197-1-chiu@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com
Cc: drake@endlessm.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

The touchpad of the ASUS laptops E403NA, X540NA, X541NA are not
responsive after suspend/resume. The following error message
shows after resume.
 i2c_hid i2c-ELAN1200:00: failed to reset device.

On these laptops, the touchpad interrupt is connected via a GPIO
pin which is controlled by Intel pinctrl. After system resumes,
the GPIO is in ACPI mode and no longer works as an IRQ.

This commit saves the HOSTSW_OWN value during suspend, make sure
the HOSTSW_OWN mode remains the same after resume.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---

Note:
  v2: update hostown and show pr_info only when the host mode
      change on requsted GPIO is not expected.

 drivers/pinctrl/intel/pinctrl-intel.c | 54 ++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8cda7b535b02..f8256f030bbb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -81,6 +81,7 @@ struct intel_pad_context {
 
 struct intel_community_context {
 	u32 *intmask;
+	u32 *hostown;
 };
 
 struct intel_pinctrl_context {
@@ -1284,7 +1285,7 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
-		u32 *intmask;
+		u32 *intmask, *hostown;
 
 		intmask = devm_kcalloc(pctrl->dev, community->ngpps,
 				       sizeof(*intmask), GFP_KERNEL);
@@ -1292,6 +1293,13 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 			return -ENOMEM;
 
 		communities[i].intmask = intmask;
+
+		hostown = devm_kcalloc(pctrl->dev, community->ngpps,
+				       sizeof(*hostown), GFP_KERNEL);
+		if (!hostown)
+			return -ENOMEM;
+
+		communities[i].hostown = hostown;
 	}
 
 	pctrl->context.pads = pads;
@@ -1503,6 +1511,10 @@ int intel_pinctrl_suspend(struct device *dev)
 		base = community->regs + community->ie_offset;
 		for (gpp = 0; gpp < community->ngpps; gpp++)
 			communities[i].intmask[gpp] = readl(base + gpp * 4);
+
+		base = community->regs + community->hostown_offset;
+		for (gpp = 0; gpp < community->ngpps; gpp++)
+			communities[i].hostown[gpp] = readl(base + gpp * 4);
 	}
 
 	return 0;
@@ -1529,6 +1541,32 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 	}
 }
 
+static u32
+intel_gpio_is_requested(struct gpio_chip *chip, int base, unsigned int size)
+{
+	u32 requested = 0;
+	unsigned int i;
+
+	for (i = 0; i < size; i++)
+		if (gpiochip_is_requested(chip, base + i))
+			requested |= BIT(i);
+
+	return requested;
+}
+
+static void
+intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
+{
+	u32 curr = readl(hostown);
+	u32 updated = (curr & ~mask) | (value & mask);
+
+	if (curr ^ updated) {
+		pr_info("pinctrl-intel: restore HOSTSW_OWN %#08x->%#08x\n",
+			curr, value);
+		return writel(updated, hostown);
+	}
+}
+
 int intel_pinctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1588,6 +1626,20 @@ int intel_pinctrl_resume(struct device *dev)
 			dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
 				readl(base + gpp * 4));
 		}
+
+		base = community->regs + community->hostown_offset;
+		for (gpp = 0; gpp < community->ngpps; gpp++) {
+			const struct intel_padgroup *padgrp = &community->gpps[gpp];
+			u32 requested = 0;
+
+			if (padgrp->gpio_base < 0)
+				continue;
+
+			requested = intel_gpio_is_requested(&pctrl->chip,
+					padgrp->gpio_base, padgrp->size);
+			intel_gpio_update_pad_mode(base + gpp * 4, requested,
+					communities[i].hostown[gpp]);
+		}
 	}
 
 	return 0;
-- 
2.21.0
