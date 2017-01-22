From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Sun, 22 Jan 2017 16:38:06 +0800
Message-ID: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:58721 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751203AbdAVIh0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Jan 2017 03:37:26 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "david.wu" <david.wu@rock-chips.com>

From: "david.wu" <david.wu@rock-chips.com>

This patch supports 3bit width iomux type.
Note, the iomux of following pins are special, need to
be handled specially.
 - gpio2_b0 ~ gpio2_b6
 - gpio2_b7
 - gpio2_c7
 - gpio3_b0
 - gpio3_b1 ~ gpio3_b7
And therefore add IOMUX_RECALCED_FLAG to indicate which
iomux source of the bank need to be recalced. If the mux
recalced callback and IOMUX_RECALCED_FLAG were set, recalc
the related pins' iomux.

Signed-off-by: david.wu <david.wu@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.txt          |   4 +-
 drivers/pinctrl/pinctrl-rockchip.c                 | 157 ++++++++++++++++++++-
 2 files changed, 152 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 4722bc6..403b5a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -22,8 +22,8 @@ Required properties for iomux controller:
   - compatible: one of "rockchip,rk1108-pinctrl", "rockchip,rk2928-pinctrl"
 		       "rockchip,rk3066a-pinctrl", "rockchip,rk3066b-pinctrl"
 		       "rockchip,rk3188-pinctrl", "rockchip,rk3228-pinctrl"
-		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
-		       "rockchip,rk3399-pinctrl"
+		       "rockchip,rk3288-pinctrl", "rockchip,rk3328-pinctrl"
+		       "rockchip,rk3368-pinctrl", "rockchip,rk3399-pinctrl"
   - rockchip,grf: phandle referencing a syscon providing the
 	 "general register files"
 
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 08765f5..cc05753 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -75,6 +75,8 @@ enum rockchip_pinctrl_type {
 #define IOMUX_WIDTH_4BIT	BIT(1)
 #define IOMUX_SOURCE_PMU	BIT(2)
 #define IOMUX_UNROUTED		BIT(3)
+#define IOMUX_WIDTH_3BIT	BIT(4)
+#define IOMUX_RECALCED_FLAG	BIT(5)
 
 /**
  * @type: iomux variant using IOMUX_* constants
@@ -304,6 +306,8 @@ struct rockchip_pin_ctrl {
 	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
 				    int *reg, u8 *bit);
+	void	(*iomux_recalc)(u8 bank_num, int pin, int *reg,
+				int *mask, u8 *bit);
 };
 
 struct rockchip_pin_config {
@@ -355,6 +359,24 @@ struct rockchip_pinctrl {
 	unsigned int			nfunctions;
 };
 
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @num: bank num.
+ * @bit: index at register or used to calc index.
+ * @min_pin: the min pin.
+ * @max_pin: the max pin.
+ * @reg: the register offset.
+ * @mask: mask bit
+ */
+struct rockchip_mux_recalced_data {
+	u8 num;
+	u8 bit;
+	int min_pin;
+	int max_pin;
+	int reg;
+	int mask;
+};
+
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -514,13 +536,83 @@ static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
  * Hardware access
  */
 
+static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
+	{
+		.num = 2,
+		.bit = 0x2,
+		.min_pin = 8,
+		.max_pin = 14,
+		.reg = 0x24,
+		.mask = 0x3
+	},
+	{
+		.num = 2,
+		.bit = 0,
+		.min_pin = 15,
+		.max_pin = 15,
+		.reg = 0x28,
+		.mask = 0x7
+	},
+	{
+		.num = 2,
+		.bit = 14,
+		.min_pin = 23,
+		.max_pin = 23,
+		.reg = 0x30,
+		.mask = 0x3
+	},
+	{
+		.num = 3,
+		.bit = 0,
+		.min_pin = 8,
+		.max_pin = 8,
+		.reg = 0x40,
+		.mask = 0x7
+	},
+	{
+		.num = 3,
+		.bit = 0x2,
+		.min_pin = 9,
+		.max_pin = 15,
+		.reg = 0x44,
+		.mask = 0x3
+	},
+};
+
+static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
+			      int *mask, u8 *bit)
+{
+	const struct rockchip_mux_recalced_data *data = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rk3328_mux_recalced_data); i++)
+		if (rk3328_mux_recalced_data[i].num == bank_num &&
+		    rk3328_mux_recalced_data[i].min_pin <= pin &&
+		    rk3328_mux_recalced_data[i].max_pin >= pin) {
+			data = &rk3328_mux_recalced_data[i];
+			break;
+		}
+
+	if (!data)
+		return;
+
+	*reg = data->reg;
+	*mask = data->mask;
+
+	if (data->min_pin == data->max_pin)
+		*bit = data->bit;
+	else
+		*bit = (pin % 8) * data->bit;
+}
+
 static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
 	unsigned int val;
-	int reg, ret, mask;
+	int reg, ret, mask, mux_type;
 	u8 bit;
 
 	if (iomux_num > 3)
@@ -538,16 +630,26 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
+	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
-	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+	if (mux_type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
+		mask = 0xf;
+	} else if (mux_type & IOMUX_WIDTH_3BIT) {
+		if ((pin % 8) >= 5)
+			reg += 0x4;
+		bit = (pin % 5) * 3;
+		mask = 0x7;
 	} else {
 		bit = (pin % 8) * 2;
+		mask = 0x3;
 	}
 
+	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED_FLAG))
+		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &mask, &bit);
+
 	ret = regmap_read(regmap, reg, &val);
 	if (ret)
 		return ret;
@@ -571,9 +673,10 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
-	int reg, ret, mask;
+	int reg, ret, mask, mux_type;
 	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
@@ -603,16 +706,26 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 				? info->regmap_pmu : info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
+	mux_type = bank->iomux[iomux_num].type;
 	reg = bank->iomux[iomux_num].offset;
-	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+	if (mux_type & IOMUX_WIDTH_4BIT) {
 		if ((pin % 8) >= 4)
 			reg += 0x4;
 		bit = (pin % 4) * 4;
+		mask = 0xf;
+	} else if (mux_type & IOMUX_WIDTH_3BIT) {
+		if ((pin % 8) >= 5)
+			reg += 0x4;
+		bit = (pin % 5) * 3;
+		mask = 0x7;
 	} else {
 		bit = (pin % 8) * 2;
+		mask = 0x3;
 	}
 
+	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED_FLAG))
+		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &mask, &bit);
+
 	spin_lock_irqsave(&bank->slock, flags);
 
 	data = (mask << (bit + 16));
@@ -2359,7 +2472,8 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			 * Increase offset according to iomux width.
 			 * 4bit iomux'es are spread over two registers.
 			 */
-			inc = (iom->type & IOMUX_WIDTH_4BIT) ? 8 : 4;
+			inc = (iom->type & (IOMUX_WIDTH_4BIT |
+					    IOMUX_WIDTH_3BIT)) ? 8 : 4;
 			if (iom->type & IOMUX_SOURCE_PMU)
 				pmu_offs += inc;
 			else
@@ -2679,6 +2793,33 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.drv_calc_reg		= rk3288_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3328_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED_FLAG,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED_FLAG,
+			     0
+			     ),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_3BIT,
+			     IOMUX_WIDTH_3BIT | IOMUX_RECALCED_FLAG,
+			     0,
+			     0
+			     ),
+};
+
+static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
+		.pin_banks		= rk3328_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
+		.label			= "RK3328-GPIO",
+		.type			= RK3288,
+		.grf_mux_offset		= 0x0,
+		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
+		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
+		.iomux_recalc		= rk3328_recalc_mux,
+};
+
 static struct rockchip_pin_bank rk3368_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -2784,6 +2925,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.data = (void *)&rk3228_pin_ctrl },
 	{ .compatible = "rockchip,rk3288-pinctrl",
 		.data = (void *)&rk3288_pin_ctrl },
+	{ .compatible = "rockchip,rk3328-pinctrl",
+		.data = (void *)&rk3328_pin_ctrl },
 	{ .compatible = "rockchip,rk3368-pinctrl",
 		.data = (void *)&rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
-- 
1.9.1


