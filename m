From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/2] pinctrl: sunxi: Deal with per-bank regulators
Date: Thu,  6 Dec 2018 15:02:03 +0100
Message-ID: <3401ca7517927243f567899819e0d02eee12984f.1544104801.git-series.maxime.ripard@bootlin.com>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Mylene Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

The Allwinner SoCs have on most of their GPIO banks a regulator input.

This issue was mainly ignored so far because either the regulator was a
static regulator that would be providing power anyway, or the bank was used
for a feature unsupported so far (CSI). For the odd cases, enabling it in
the bootloader was the preferred option.

However, now that we are starting to support those features, and that we
can't really rely on the bootloader for this, we need to model those
regulators as such in the DT.

This is slightly more complicated than what it looks like, since some
regulators will be tied to the PMIC, and in order to have access to the
PMIC bus, you need to mux its pins, which will need the pinctrl driver,
that needs the regulator driver to be registered. And this is how you get a
circular dependency.

In practice however, the hardware cannot fall into this case since it would
result in a completely unusable bus. In order to avoid that circular
dependency, we can thus get and enable the regulators at pin_request time.
We'll then need to account for the references of all the pins of a
particular branch to know when to put the reference, but it works pretty
nicely once implemented.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 63 ++++++++++++++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  6 +++-
 2 files changed, 69 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 34e17376ef99..5d9184d18c16 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/regulator/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -693,12 +694,74 @@ sunxi_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned short bank = offset / PINS_PER_BANK;
+	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank];
+	struct regulator *reg;
+	int ret;
+
+	reg = s_reg->regulator;
+	if (!reg) {
+		char supply[16];
+
+		snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
+		reg = regulator_get(pctl->dev, supply);
+		if (IS_ERR(reg)) {
+			dev_err(pctl->dev, "Couldn't get bank P%c regulator\n",
+				'A' + bank);
+			return PTR_ERR(reg);
+		}
+
+		s_reg->regulator = reg;
+		refcount_set(&s_reg->refcount, 1);
+	} else {
+		refcount_inc(&s_reg->refcount);
+	}
+
+	ret = regulator_enable(reg);
+	if (ret) {
+		dev_err(pctl->dev,
+			"Couldn't enable bank P%c regulator\n", 'A' + bank);
+		goto out;
+	}
+
+	return 0;
+
+out:
+	if (refcount_dec_and_test(&s_reg->refcount)) {
+		regulator_put(s_reg->regulator);
+		s_reg->regulator = NULL;
+	}
+
+	return ret;
+}
+
+static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned short bank = offset / PINS_PER_BANK;
+	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank];
+
+	if (!refcount_dec_and_test(&s_reg->refcount))
+		return 0;
+
+	regulator_disable(s_reg->regulator);
+	regulator_put(s_reg->regulator);
+	s_reg->regulator = NULL;
+
+	return 0;
+}
+
 static const struct pinmux_ops sunxi_pmx_ops = {
 	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
 	.get_function_name	= sunxi_pmx_get_func_name,
 	.get_function_groups	= sunxi_pmx_get_func_groups,
 	.set_mux		= sunxi_pmx_set_mux,
 	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
+	.request		= sunxi_pmx_request,
+	.free			= sunxi_pmx_free,
 	.strict			= true,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 4a892e7dde66..e340d2a24b44 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -126,11 +126,17 @@ struct sunxi_pinctrl_group {
 	unsigned	pin;
 };
 
+struct sunxi_pinctrl_regulator {
+	struct regulator	*regulator;
+	refcount_t		refcount;
+};
+
 struct sunxi_pinctrl {
 	void __iomem			*membase;
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
+	struct sunxi_pinctrl_regulator	regulators[12];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
git-series 0.9.1
