From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 4/6] pinctrl: intel: Add support for hardware debouncer
Date: Tue, 10 Jan 2017 17:31:59 +0300
Message-ID: <20170110143201.53539-5-mika.westerberg@linux.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The next generation Intel GPIO hardware has two additional registers
PADCFG2 and PADCFG3. The latter is marked as reserved but the former
includes configuration for per-pad hardware debouncer.

This patch adds support for that in the Intel pinctrl core driver. Since
these are additional features on top of the current generation hardware,
we use revision number and feature flags to enable this if detected.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 139 +++++++++++++++++++++++++++++++++-
 drivers/pinctrl/intel/pinctrl-intel.h |   5 ++
 2 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 447405809340..2d8722fa701d 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -12,6 +12,7 @@
 
 #include <linux/module.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -23,6 +24,10 @@
 #include "pinctrl-intel.h"
 
 /* Offset from regs */
+#define REVID				0x000
+#define REVID_SHIFT			16
+#define REVID_MASK			GENMASK(31, 16)
+
 #define PADBAR				0x00c
 #define GPI_IS				0x100
 #define GPI_GPE_STS			0x140
@@ -41,6 +46,7 @@
 #define PADCFG0_RXEVCFG_EDGE		1
 #define PADCFG0_RXEVCFG_DISABLED	2
 #define PADCFG0_RXEVCFG_EDGE_BOTH	3
+#define PADCFG0_PREGFRXSEL		BIT(24)
 #define PADCFG0_RXINV			BIT(23)
 #define PADCFG0_GPIROUTIOXAPIC		BIT(20)
 #define PADCFG0_GPIROUTSCI		BIT(19)
@@ -62,9 +68,17 @@
 #define PADCFG1_TERM_5K			2
 #define PADCFG1_TERM_1K			1
 
+#define PADCFG2				0x008
+#define PADCFG2_DEBEN			BIT(0)
+#define PADCFG2_DEBOUNCE_SHIFT		1
+#define PADCFG2_DEBOUNCE_MASK		GENMASK(4, 1)
+
+#define DEBOUNCE_PERIOD			31250 /* ns */
+
 struct intel_pad_context {
 	u32 padcfg0;
 	u32 padcfg1;
+	u32 padcfg2;
 };
 
 struct intel_community_context {
@@ -126,13 +140,19 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl, unsigned pin,
 {
 	const struct intel_community *community;
 	unsigned padno;
+	size_t nregs;
 
 	community = intel_get_community(pctrl, pin);
 	if (!community)
 		return NULL;
 
 	padno = pin_to_padno(community, pin);
-	return community->pad_regs + reg + padno * 8;
+	nregs = (community->features & PINCTRL_FEATURE_DEBOUNCE) ? 4 : 2;
+
+	if (reg == PADCFG2 && !(community->features & PINCTRL_FEATURE_DEBOUNCE))
+		return NULL;
+
+	return community->pad_regs + reg + padno * nregs * 4;
 }
 
 static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned pin)
@@ -244,6 +264,7 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 			       unsigned pin)
 {
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *padcfg;
 	u32 cfg0, cfg1, mode;
 	bool locked, acpi;
 
@@ -263,6 +284,11 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 
 	seq_printf(s, "0x%08x 0x%08x", cfg0, cfg1);
 
+	/* Dump the additional PADCFG registers if available */
+	padcfg = intel_get_padcfg(pctrl, pin, PADCFG2);
+	if (padcfg)
+		seq_printf(s, " 0x%08x", readl(padcfg));
+
 	locked = intel_pad_locked(pctrl, pin);
 	acpi = intel_pad_acpi_mode(pctrl, pin);
 
@@ -475,6 +501,24 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 
 		break;
 
+	case PIN_CONFIG_INPUT_DEBOUNCE: {
+		void __iomem *padcfg2;
+		u32 v;
+
+		padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
+		if (!padcfg2)
+			return -ENOTSUPP;
+
+		v = readl(padcfg2);
+		if (!(v & PADCFG2_DEBEN))
+			return -EINVAL;
+
+		v = (v & PADCFG2_DEBOUNCE_MASK) >> PADCFG2_DEBOUNCE_SHIFT;
+		arg = BIT(v) * DEBOUNCE_PERIOD / 1000;
+
+		break;
+	}
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -552,6 +596,53 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 	return ret;
 }
 
+static int intel_config_set_debounce(struct intel_pinctrl *pctrl, unsigned pin,
+				     unsigned debounce)
+{
+	void __iomem *padcfg0, *padcfg2;
+	unsigned long flags;
+	u32 value0, value2;
+	int ret = 0;
+
+	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
+	if (!padcfg2)
+		return -ENOTSUPP;
+
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+
+	value0 = readl(padcfg0);
+	value2 = readl(padcfg2);
+
+	/* Disable glitch filter and debouncer */
+	value0 &= ~PADCFG0_PREGFRXSEL;
+	value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
+
+	if (debounce) {
+		unsigned long v;
+
+		v = order_base_2(debounce * 1000 / DEBOUNCE_PERIOD);
+		if (v < 3 || v > 15) {
+			ret = -EINVAL;
+			goto exit_unlock;
+		} else {
+			/* Enable glitch filter and debouncer */
+			value0 |= PADCFG0_PREGFRXSEL;
+			value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
+			value2 |= PADCFG2_DEBEN;
+		}
+	}
+
+	writel(value0, padcfg0);
+	writel(value2, padcfg2);
+
+exit_unlock:
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return ret;
+}
+
 static int intel_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 			  unsigned long *configs, unsigned nconfigs)
 {
@@ -571,6 +662,13 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 				return ret;
 			break;
 
+		case PIN_CONFIG_INPUT_DEBOUNCE:
+			ret = intel_config_set_debounce(pctrl, pin,
+				pinconf_to_config_argument(configs[i]));
+			if (ret)
+				return ret;
+			break;
+
 		default:
 			return -ENOTSUPP;
 		}
@@ -637,6 +735,17 @@ static int intel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
+static int intel_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
+				   unsigned debounce)
+{
+	unsigned long configs[] = {
+		PIN_CONF_PACKED(PIN_CONFIG_INPUT_DEBOUNCE, debounce),
+	};
+
+	return pinctrl_gpio_set_config(chip->base + offset, configs,
+				       ARRAY_SIZE(configs));
+}
+
 static const struct gpio_chip intel_gpio_chip = {
 	.owner = THIS_MODULE,
 	.request = gpiochip_generic_request,
@@ -645,6 +754,7 @@ static const struct gpio_chip intel_gpio_chip = {
 	.direction_output = intel_gpio_direction_output,
 	.get = intel_gpio_get,
 	.set = intel_gpio_set,
+	.set_debounce = intel_gpio_set_debounce,
 };
 
 static void intel_gpio_irq_ack(struct irq_data *d)
@@ -1000,6 +1110,18 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
+		/*
+		 * Determine community features based on the revision if
+		 * not specified already.
+		 */
+		if (!community->features) {
+			u32 rev;
+
+			rev = (readl(regs + REVID) & REVID_MASK) >> REVID_SHIFT;
+			if (rev >= 0x94)
+				community->features |= PINCTRL_FEATURE_DEBOUNCE;
+		}
+
 		/* Read offset of the pad configuration registers */
 		padbar = readl(regs + PADBAR);
 
@@ -1073,6 +1195,7 @@ int intel_pinctrl_suspend(struct device *dev)
 	pads = pctrl->context.pads;
 	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
+		void __iomem *padcfg;
 		u32 val;
 
 		if (!intel_pinctrl_should_save(pctrl, desc->number))
@@ -1082,6 +1205,10 @@ int intel_pinctrl_suspend(struct device *dev)
 		pads[i].padcfg0 = val & ~PADCFG0_GPIORXSTATE;
 		val = readl(intel_get_padcfg(pctrl, desc->number, PADCFG1));
 		pads[i].padcfg1 = val;
+
+		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG2);
+		if (padcfg)
+			pads[i].padcfg2 = readl(padcfg);
 	}
 
 	communities = pctrl->context.communities;
@@ -1154,6 +1281,16 @@ int intel_pinctrl_resume(struct device *dev)
 			dev_dbg(dev, "restored pin %u padcfg1 %#08x\n",
 				desc->number, readl(padcfg));
 		}
+
+		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG2);
+		if (padcfg) {
+			val = readl(padcfg);
+			if (val != pads[i].padcfg2) {
+				writel(pads[i].padcfg2, padcfg);
+				dev_dbg(dev, "restored pin %u padcfg2 %#08x\n",
+					desc->number, readl(padcfg));
+			}
+		}
 	}
 
 	communities = pctrl->context.communities;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index c22c44485c5d..1ff5abf309e3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -58,6 +58,7 @@ struct intel_function {
  * @gpp_size: Maximum number of pads in each group, such as PADCFGLOCK,
  *            HOSTSW_OWN,  GPI_IS, GPI_IE, etc.
  * @npins: Number of pins in this community
+ * @features: Additional features supported by the hardware
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
  * @ngpps: Number of groups (hw groups) in this community (reserved for
@@ -72,11 +73,15 @@ struct intel_community {
 	unsigned pin_base;
 	unsigned gpp_size;
 	size_t npins;
+	unsigned features;
 	void __iomem *regs;
 	void __iomem *pad_regs;
 	size_t ngpps;
 };
 
+/* Additional features supported by the hardware */
+#define PINCTRL_FEATURE_DEBOUNCE	BIT(0)
+
 #define PIN_GROUP(n, p, m)			\
 	{					\
 		.name = (n),			\
-- 
2.11.0
