From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH 2/2] pinctrl: rockchip: Add rk3128 pinctrl support
Date: Fri, 21 Jul 2017 14:27:15 +0800
Message-ID: <1500618435-15092-3-git-send-email-david.wu@rock-chips.com>
References: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linus.walleij@linaro.org
Cc: huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

There are 3 IP blocks pin routes need to be switched, that are
emmc-cmd, spi, i2s. And there are some pins need to be recalced,
which are gpio2c4~gpio2c7 and gpio2d0.
 
Signed-off-by: David Wu <david.wu@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.txt          |   1 +
 drivers/pinctrl/pinctrl-rockchip.c                 | 129 +++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index ee01ab5..58b7921 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -24,6 +24,7 @@ Required properties for iomux controller:
 		"rockchip,rk2928-pinctrl":  for Rockchip RK2928
 		"rockchip,rk3066a-pinctrl": for Rockchip RK3066a
 		"rockchip,rk3066b-pinctrl": for Rockchip RK3066b
+		"rockchip,rk3128-pinctrl":  for Rockchip RK3128
 		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
 		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
 		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index fd4e491..7ba0c40 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -62,6 +62,7 @@ enum rockchip_pinctrl_type {
 	RV1108,
 	RK2928,
 	RK3066B,
+	RK3128,
 	RK3188,
 	RK3288,
 	RK3368,
@@ -557,6 +558,40 @@ static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
  * Hardware access
  */
 
+static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
+	{
+		.num = 2,
+		.pin = 20,
+		.reg = 0xe8,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 21,
+		.reg = 0xe8,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 22,
+		.reg = 0xe8,
+		.bit = 8,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 23,
+		.reg = 0xe8,
+		.bit = 12,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 24,
+		.reg = 0xd4,
+		.bit = 12,
+		.mask = 0x7
+	},
+};
+
 static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
 		.num = 2,
@@ -602,6 +637,59 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 	*bit = data->bit;
 }
 
+static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
+	{
+		/* spi-0 */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4),
+	}, {
+		/* spi-1 */
+		.bank_num = 1,
+		.pin = 27,
+		.func = 3,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(3),
+	}, {
+		/* spi-2 */
+		.bank_num = 0,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(4),
+	}, {
+		/* i2s-0 */
+		.bank_num = 1,
+		.pin = 5,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 5),
+	}, {
+		/* i2s-1 */
+		.bank_num = 0,
+		.pin = 14,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 5) | BIT(5),
+	}, {
+		/* emmc-0 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 6),
+	}, {
+		/* emmc-1 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 6) | BIT(6),
+	},
+};
+
 static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
 	{
 		/* pwm0-0 */
@@ -1102,6 +1190,22 @@ static void rk2928_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
 };
 
+#define RK3128_PULL_OFFSET	0x118
+
+static void rk3128_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3128_PULL_OFFSET;
+	*reg += bank->bank_num * RK2928_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK2928_PULL_PINS_PER_REG) * 4);
+
+	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
+}
+
 #define RK3188_PULL_OFFSET		0x164
 #define RK3188_PULL_BITS_PER_PIN	2
 #define RK3188_PULL_PINS_PER_REG	8
@@ -1571,6 +1675,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 
 	switch (ctrl->type) {
 	case RK2928:
+	case RK3128:
 		return !(data & BIT(bit))
 				? PIN_CONFIG_BIAS_PULL_PIN_DEFAULT
 				: PIN_CONFIG_BIAS_DISABLE;
@@ -1611,6 +1716,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 
 	switch (ctrl->type) {
 	case RK2928:
+	case RK3128:
 		data = BIT(bit + 16);
 		if (pull == PIN_CONFIG_BIAS_DISABLE)
 			data |= BIT(bit);
@@ -1865,6 +1971,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 {
 	switch (ctrl->type) {
 	case RK2928:
+	case RK3128:
 		return (pull == PIN_CONFIG_BIAS_PULL_PIN_DEFAULT ||
 					pull == PIN_CONFIG_BIAS_DISABLE);
 	case RK3066B:
@@ -3093,6 +3200,26 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.grf_mux_offset	= 0x60,
 };
 
+static struct rockchip_pin_bank rk3128_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3128_pin_ctrl = {
+		.pin_banks		= rk3128_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3128_pin_banks),
+		.label			= "RK3128-GPIO",
+		.type			= RK3128,
+		.grf_mux_offset		= 0xa8,
+		.iomux_recalced		= rk3128_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3128_mux_recalced_data),
+		.iomux_routes		= rk3128_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3128_mux_route_data),
+		.pull_calc_reg		= rk3128_calc_pull_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3188_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_GPIO_ONLY, 0, 0, 0),
 	PIN_BANK(1, 32, "gpio1"),
@@ -3301,6 +3428,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.data = &rk3066a_pin_ctrl },
 	{ .compatible = "rockchip,rk3066b-pinctrl",
 		.data = &rk3066b_pin_ctrl },
+	{ .compatible = "rockchip,rk3128-pinctrl",
+		.data = (void *)&rk3128_pin_ctrl },
 	{ .compatible = "rockchip,rk3188-pinctrl",
 		.data = &rk3188_pin_ctrl },
 	{ .compatible = "rockchip,rk3228-pinctrl",
-- 
1.9.1
