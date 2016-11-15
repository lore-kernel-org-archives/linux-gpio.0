From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH V3] pinctrl: rockchip: add support for rk1108
Date: Tue, 15 Nov 2016 18:02:43 +0800
Message-ID: <1479204163-3137-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.135]:58236 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941376AbcKOKDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 05:03:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>

This add pinctrl support for Rockchip RK1108 Soc.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Series-changes: 2
- add pull and drive-strength functionality

Series-changes: 3
- two minor CodingStyle fixes adviced by Heiko
---
 drivers/pinctrl/pinctrl-rockchip.c | 86 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 49bf7dc..08765f5 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -59,6 +59,7 @@
 #define GPIO_LS_SYNC		0x60
 
 enum rockchip_pinctrl_type {
+	RK1108,
 	RK2928,
 	RK3066B,
 	RK3188,
@@ -624,6 +625,65 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	return ret;
 }
 
+#define RK1108_PULL_PMU_OFFSET		0x10
+#define RK1108_PULL_OFFSET		0x110
+#define RK1108_PULL_PINS_PER_REG	8
+#define RK1108_PULL_BITS_PER_PIN	2
+#define RK1108_PULL_BANK_STRIDE		16
+
+static void rk1108_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK1108_PULL_PMU_OFFSET;
+	} else {
+		*reg = RK1108_PULL_OFFSET;
+		*regmap = info->regmap_base;
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK1108_PULL_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RK1108_PULL_PINS_PER_REG) * 4);
+	*bit = (pin_num % RK1108_PULL_PINS_PER_REG);
+	*bit *= RK1108_PULL_BITS_PER_PIN;
+}
+
+#define RK1108_DRV_PMU_OFFSET		0x20
+#define RK1108_DRV_GRF_OFFSET		0x210
+#define RK1108_DRV_BITS_PER_PIN		2
+#define RK1108_DRV_PINS_PER_REG		8
+#define RK1108_DRV_BANK_STRIDE		16
+
+static void rk1108_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK1108_DRV_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK1108_DRV_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK1108_DRV_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RK1108_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK1108_DRV_PINS_PER_REG;
+	*bit *= RK1108_DRV_BITS_PER_PIN;
+}
+
 #define RK2928_PULL_OFFSET		0x118
 #define RK2928_PULL_PINS_PER_REG	16
 #define RK2928_PULL_BANK_STRIDE		8
@@ -1123,6 +1183,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 		return !(data & BIT(bit))
 				? PIN_CONFIG_BIAS_PULL_PIN_DEFAULT
 				: PIN_CONFIG_BIAS_DISABLE;
+	case RK1108:
 	case RK3188:
 	case RK3288:
 	case RK3368:
@@ -1169,6 +1230,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 
 		spin_unlock_irqrestore(&bank->slock, flags);
 		break;
+	case RK1108:
 	case RK3188:
 	case RK3288:
 	case RK3368:
@@ -1358,6 +1420,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 					pull == PIN_CONFIG_BIAS_DISABLE);
 	case RK3066B:
 		return pull ? false : true;
+	case RK1108:
 	case RK3188:
 	case RK3288:
 	case RK3368:
@@ -2455,6 +2518,27 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct rockchip_pin_bank rk1108_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, 0),
+};
+
+static struct rockchip_pin_ctrl rk1108_pin_ctrl = {
+	.pin_banks		= rk1108_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk1108_pin_banks),
+	.label			= "RK1108-GPIO",
+	.type			= RK1108,
+	.grf_mux_offset		= 0x10,
+	.pmu_mux_offset		= 0x0,
+	.pull_calc_reg		= rk1108_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk1108_calc_drv_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk2928_pin_banks[] = {
 	PIN_BANK(0, 32, "gpio0"),
 	PIN_BANK(1, 32, "gpio1"),
@@ -2684,6 +2768,8 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 };
 
 static const struct of_device_id rockchip_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk1108-pinctrl",
+		.data = (void *)&rk1108_pin_ctrl },
 	{ .compatible = "rockchip,rk2928-pinctrl",
 		.data = (void *)&rk2928_pin_ctrl },
 	{ .compatible = "rockchip,rk3036-pinctrl",
-- 
2.7.4


