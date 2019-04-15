From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Mon, 15 Apr 2019 13:53:58 +0800
Message-ID: <20190415055358.9269-1-chiu@endlessm.com>
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
v3: change return type of intel_gpio_update_pad_mode() from
    void to u32 and use dev_warn instead of pr_info.

 drivers/pinctrl/intel/pinctrl-intel.c | 56 ++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8cda7b535b02..5337289c550b 100644
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
@@ -1529,6 +1541,29 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
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
+static u32
+intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
+{
+	u32 curr = readl(hostown);
+	u32 updated = (curr & ~mask) | (value & mask);
+
+	writel(updated, hostown);
+	return curr;
+}
+
 int intel_pinctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1588,6 +1623,25 @@ int intel_pinctrl_resume(struct device *dev)
 			dev_dbg(dev, "restored mask %d/%u %#08x\n", i, gpp,
 				readl(base + gpp * 4));
 		}
+
+		base = community->regs + community->hostown_offset;
+		for (gpp = 0; gpp < community->ngpps; gpp++) {
+			const struct intel_padgroup *padgrp = &community->gpps[gpp];
+			u32 requested = 0, value = 0;
+			u32 saved = communities[i].hostown[gpp];
+
+			if (padgrp->gpio_base < 0)
+				continue;
+
+			requested = intel_gpio_is_requested(&pctrl->chip,
+					padgrp->gpio_base, padgrp->size);
+			value = intel_gpio_update_pad_mode(base + gpp * 4,
+					requested, saved);
+			if ((value ^ saved) & requested) {
+				dev_warn(dev, "restore hostown %d/%u %#8x->%#8x\n",
+					i, gpp, value, saved);
+			}
+		}
 	}
 
 	return 0;
-- 
2.21.0
