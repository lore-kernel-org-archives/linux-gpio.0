From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Add initial pinconf support
Date: Tue, 21 Feb 2017 01:08:50 +1030
Message-ID: <20170220143850.10723-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44010 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753063AbdBTOjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Feb 2017 09:39:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org

Several pinconf parameters have a fairly straight-forward mapping onto
the Aspeed pin controller. These include management of pull-down bias,
drive-strength, and some debounce configuration.

Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
ADC and RMII/RGMII pins. As the bias configuration for each pin in a
bank maps onto a single per-bank bit, configuration tables are
introduced to describe the ranges of pins and the supported pinconf
parameter. The use of tables also helps with the sparse support of
pinconf properties, and the fact that not all GPIO banks support
biasing or drive-strength configuration.

Further, as the pin controller uses a consistent approach for bias and
drive strength configuration at the register level, a second table is
defined for looking up the the bit-state required to enable or query the
provided configuration.

Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
system, and pinctrl-aspeed-g5 on an AST2500EVB. The test method was to
set the appropriate bits via devmem and verify the result through the
controller's pinconf-pins debugfs file. This simultaneously validates
the get() path and half of the set() path. The remainder of the set()
path was validated by configuring a handful of pins via the devicetree
with the supported pinconf properties and verifying the appropriate
registers were touched.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 117 +++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 153 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 207 +++++++++++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  28 ++++
 4 files changed, 503 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 7de596e2b9d4..3e8625110136 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2234,6 +2234,110 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
 	ASPEED_PINCTRL_FUNC(WDTRST2),
 };
 
+static struct aspeed_pin_config aspeed_g4_configs[] = {
+	/* GPIO banks ranges [A, B], [D, J], [M, R] */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D6,  D5  }, SCU8C, BIT(16) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D6,  D5  }, SCU8C, BIT(16) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J21, E18 }, SCU8C, BIT(17) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J21, E18 }, SCU8C, BIT(17) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A18, E15 }, SCU8C, BIT(19) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A18, E15 }, SCU8C, BIT(19) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D15, B14 }, SCU8C, BIT(20) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D15, B14 }, SCU8C, BIT(20) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D18, C17 }, SCU8C, BIT(21) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D18, C17 }, SCU8C, BIT(21) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A14, U18 }, SCU8C, BIT(22) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A14, U18 }, SCU8C, BIT(22) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A8,  E7  }, SCU8C, BIT(23) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A8,  E7  }, SCU8C, BIT(23) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C22, E20 }, SCU8C, BIT(24) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C22, E20 }, SCU8C, BIT(24) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J5,  T1  }, SCU8C, BIT(25) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J5,  T1  }, SCU8C, BIT(25) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { U1,  U5  }, SCU8C, BIT(26) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { U1,  U5  }, SCU8C, BIT(26) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V3,  V5  }, SCU8C, BIT(27) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V3,  V5  }, SCU8C, BIT(27) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { W4,  AB2 }, SCU8C, BIT(28) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { W4,  AB2 }, SCU8C, BIT(28) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V6,  V7  }, SCU8C, BIT(29) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V6,  V7  }, SCU8C, BIT(29) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y6,  AB7 }, SCU8C, BIT(30) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y6,  AB7 }, SCU8C, BIT(30) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V20, A5  }, SCU8C, BIT(31) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V20, A5  }, SCU8C, BIT(31) },
+
+	/* GPIOs T[0-5] (RGMII1 Tx pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A12, A13 }, SCU90, BIT(9)  },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A12, A13 }, SCU90, BIT(12) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A12, A13 }, SCU90, BIT(12) },
+
+	/* GPIOs T[6-7], U[0-3] (RGMII2 TX pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D9,  D10 }, SCU90, BIT(11) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { D9,  D10 }, SCU90, BIT(14) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { D9,  D10 }, SCU90, BIT(14) },
+
+	/* GPIOs U[4-7], V[0-1] (RGMII1 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E11, E10 }, SCU90, BIT(13) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E11, E10 }, SCU90, BIT(13) },
+
+	/* GPIOs V[2-7] (RGMII2 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C9,  C8  }, SCU90, BIT(15) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C9,  C8  }, SCU90, BIT(15) },
+
+	/* ADC pull-downs (SCUA8[19:4]) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L5,  L5  }, SCUA8, BIT(4) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L5,  L5  }, SCUA8, BIT(4) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L4,  L4  }, SCUA8, BIT(5) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L4,  L4  }, SCUA8, BIT(5) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L3,  L3  }, SCUA8, BIT(6) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L3,  L3  }, SCUA8, BIT(6) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L2,  L2  }, SCUA8, BIT(7) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L2,  L2  }, SCUA8, BIT(7) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L1,  L1  }, SCUA8, BIT(8) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L1,  L1  }, SCUA8, BIT(8) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M5,  M5  }, SCUA8, BIT(9) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M5,  M5  }, SCUA8, BIT(9) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M4,  M4  }, SCUA8, BIT(10) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M4,  M4  }, SCUA8, BIT(10) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M3,  M3  }, SCUA8, BIT(11) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M3,  M3  }, SCUA8, BIT(11) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M2,  M2  }, SCUA8, BIT(12) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M2,  M2  }, SCUA8, BIT(12) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { M1,  M1  }, SCUA8, BIT(13) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { M1,  M1  }, SCUA8, BIT(13) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N5,  N5  }, SCUA8, BIT(14) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N5,  N5  }, SCUA8, BIT(14) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N4,  N4  }, SCUA8, BIT(15) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N4,  N4  }, SCUA8, BIT(15) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N3,  N3  }, SCUA8, BIT(16) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N3,  N3  }, SCUA8, BIT(16) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N2,  N2  }, SCUA8, BIT(17) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N2,  N2  }, SCUA8, BIT(17) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N1,  N1  }, SCUA8, BIT(18) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N1,  N1  }, SCUA8, BIT(18) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { P5,  P5  }, SCUA8, BIT(19) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { P5,  P5  }, SCUA8, BIT(19) },
+
+	/*
+	 * Debounce settings for GPIOs D and E passthrough mode are in
+	 * SCUA8[27:20] and so are managed by pinctrl. Normal GPIO debounce for
+	 * banks D and E is handled by the GPIO driver - GPIO passthrough is
+	 * treated like any other non-GPIO mux function. There is a catch
+	 * however, in that the debounce period is configured in the GPIO
+	 * controller. Due to this tangle between GPIO and pinctrl we don't yet
+	 * fully support pass-through debounce.
+	 */
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A18, D16 }, SCUA8, BIT(20) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B17, A17 }, SCUA8, BIT(21) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { C16, B16 }, SCUA8, BIT(22) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A16, E15 }, SCUA8, BIT(23) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { D15, C15 }, SCUA8, BIT(24) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B15, A15 }, SCUA8, BIT(25) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { E14, D14 }, SCUA8, BIT(26) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { C14, B14 }, SCUA8, BIT(27) },
+};
+
 static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
@@ -2241,6 +2345,8 @@ static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	.ngroups = ARRAY_SIZE(aspeed_g4_groups),
 	.functions = aspeed_g4_functions,
 	.nfunctions = ARRAY_SIZE(aspeed_g4_functions),
+	.configs = aspeed_g4_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
 };
 
 static struct pinmux_ops aspeed_g4_pinmux_ops = {
@@ -2257,16 +2363,25 @@ static struct pinctrl_ops aspeed_g4_pinctrl_ops = {
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,
 	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
+static struct pinconf_ops aspeed_g4_conf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
 static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
 	.pctlops = &aspeed_g4_pinctrl_ops,
 	.pmxops = &aspeed_g4_pinmux_ops,
+	.confops = &aspeed_g4_conf_ops,
 };
 
 static int aspeed_g4_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 43221a3c7e23..b22523bdd79b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2285,6 +2285,146 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(WDTRST2),
 };
 
+static struct aspeed_pin_config aspeed_g5_configs[] = {
+	/* GPIOA, GPIOQ */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B14, B13 }, SCU8C, BIT(16) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B14, B13 }, SCU8C, BIT(16) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A11, N20 }, SCU8C, BIT(16) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A11, N20 }, SCU8C, BIT(16) },
+
+	/* GPIOB, GPIOR */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { K19, H20 }, SCU8C, BIT(17) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { K19, H20 }, SCU8C, BIT(17) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { AA19, E10 }, SCU8C, BIT(17) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { AA19, E10 }, SCU8C, BIT(17) },
+
+	/* GPIOC, GPIOS*/
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C12, B11 }, SCU8C, BIT(18) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C12, B11 }, SCU8C, BIT(18) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V20, AA20 }, SCU8C, BIT(18) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V20, AA20 }, SCU8C, BIT(18) },
+
+	/* GPIOD, GPIOY */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F19, C21 }, SCU8C, BIT(19) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F19, C21 }, SCU8C, BIT(19) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { R22, P20 }, SCU8C, BIT(19) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { R22, P20 }, SCU8C, BIT(19) },
+
+	/* GPIOE, GPIOZ */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B20, B19 }, SCU8C, BIT(20) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B20, B19 }, SCU8C, BIT(20) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y20, W21 }, SCU8C, BIT(20) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y20, W21 }, SCU8C, BIT(20) },
+
+	/* GPIOF, GPIOAA */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { J19, H18 }, SCU8C, BIT(21) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { J19, H18 }, SCU8C, BIT(21) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y21, P19 }, SCU8C, BIT(21) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y21, P19 }, SCU8C, BIT(21) },
+
+	/* GPIOG, GPIOAB */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A19, E14 }, SCU8C, BIT(22) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A19, E14 }, SCU8C, BIT(22) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { N19, R20 }, SCU8C, BIT(22) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { N19, R20 }, SCU8C, BIT(22) },
+
+	/* GPIOH, GPIOAC */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { A18,  D18  }, SCU8C, BIT(23) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { A18,  D18  }, SCU8C, BIT(23) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G21,  G22  }, SCU8C, BIT(23) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G21,  G22  }, SCU8C, BIT(23) },
+
+	/* GPIOs [I, P] */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C18, A15 }, SCU8C, BIT(24) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C18, A15 }, SCU8C, BIT(24) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { R2,  T3  }, SCU8C, BIT(25) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { R2,  T3  }, SCU8C, BIT(25) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { L3,  R1  }, SCU8C, BIT(26) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { L3,  R1  }, SCU8C, BIT(26) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { T2,  W1  }, SCU8C, BIT(27) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { T2,  W1  }, SCU8C, BIT(27) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { Y1,  T5  }, SCU8C, BIT(28) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { Y1,  T5  }, SCU8C, BIT(28) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V2,  T4  }, SCU8C, BIT(29) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V2,  T4  }, SCU8C, BIT(29) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { U5,  W4  }, SCU8C, BIT(30) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { U5,  W4  }, SCU8C, BIT(30) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { V4,  V6  }, SCU8C, BIT(31) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { V4,  V6  }, SCU8C, BIT(31) },
+
+	/* GPIOs T[0-5] (RGMII1 Tx pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B5, B5 }, SCU90, BIT(8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E9, A5 }, SCU90, BIT(9) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B5, D7 }, SCU90, BIT(12) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B5, D7 }, SCU90, BIT(12) },
+
+	/* GPIOs T[6-7], U[0-3] (RGMII2 TX pins) */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B2, B2 }, SCU90, BIT(10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B1, B3 }, SCU90, BIT(11) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B2, D4 }, SCU90, BIT(14) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B2, D4 }, SCU90, BIT(14) },
+
+	/* GPIOs U[4-7], V[0-1] (RGMII1 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { B4, C4 }, SCU90, BIT(13) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { B4, C4 }, SCU90, BIT(13) },
+
+	/* GPIOs V[2-7] (RGMII2 Rx pins) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { C2, E6 }, SCU90, BIT(15) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { C2, E6 }, SCU90, BIT(15) },
+
+	/* ADC pull-downs (SCUA8[19:4]) */
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F4, F4 }, SCUA8, BIT(4) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F4, F4 }, SCUA8, BIT(4) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F5, F5 }, SCUA8, BIT(5) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F5, F5 }, SCUA8, BIT(5) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E2, E2 }, SCUA8, BIT(6) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E2, E2 }, SCUA8, BIT(6) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E1, E1 }, SCUA8, BIT(7) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E1, E1 }, SCUA8, BIT(7) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F3, F3 }, SCUA8, BIT(8) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F3, F3 }, SCUA8, BIT(8) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { E3, E3 }, SCUA8, BIT(9) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { E3, E3 }, SCUA8, BIT(9) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G5, G5 }, SCUA8, BIT(10) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G5, G5 }, SCUA8, BIT(10) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G4, G4 }, SCUA8, BIT(11) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G4, G4 }, SCUA8, BIT(11) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F2, F2 }, SCUA8, BIT(12) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F2, F2 }, SCUA8, BIT(12) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G3, G3 }, SCUA8, BIT(13) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G3, G3 }, SCUA8, BIT(13) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G2, G2 }, SCUA8, BIT(14) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G2, G2 }, SCUA8, BIT(14) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { F1, F1 }, SCUA8, BIT(15) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { F1, F1 }, SCUA8, BIT(15) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H5, H5 }, SCUA8, BIT(16) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H5, H5 }, SCUA8, BIT(16) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { G1, G1 }, SCUA8, BIT(17) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { G1, G1 }, SCUA8, BIT(17) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H3, H3 }, SCUA8, BIT(18) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H3, H3 }, SCUA8, BIT(18) },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, { H4, H4 }, SCUA8, BIT(19) },
+	{ PIN_CONFIG_BIAS_DISABLE,   { H4, H4 }, SCUA8, BIT(19) },
+
+	/*
+	 * Debounce settings for GPIOs D and E passthrough mode are in
+	 * SCUA8[27:20] and so are managed by pinctrl. Normal GPIO debounce for
+	 * banks D and E is handled by the GPIO driver - GPIO passthrough is
+	 * treated like any other non-GPIO mux function. There is a catch
+	 * however, in that the debounce period is configured in the GPIO
+	 * controller. Due to this tangle between GPIO and pinctrl we don't yet
+	 * fully support pass-through debounce.
+	 */
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F19, E21 }, SCUA8, BIT(20) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F20, D20 }, SCUA8, BIT(21) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { D21, E20 }, SCUA8, BIT(22) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { G18, C21 }, SCUA8, BIT(23) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { B20, C20 }, SCUA8, BIT(24) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { F18, F17 }, SCUA8, BIT(25) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { E18, D19 }, SCUA8, BIT(26) },
+	{ PIN_CONFIG_INPUT_DEBOUNCE, { A20, B19 }, SCUA8, BIT(27) },
+};
+
 static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
@@ -2292,6 +2432,8 @@ static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	.ngroups = ARRAY_SIZE(aspeed_g5_groups),
 	.functions = aspeed_g5_functions,
 	.nfunctions = ARRAY_SIZE(aspeed_g5_functions),
+	.configs = aspeed_g5_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
 };
 
 static struct pinmux_ops aspeed_g5_pinmux_ops = {
@@ -2308,16 +2450,25 @@ static struct pinctrl_ops aspeed_g5_pinctrl_ops = {
 	.get_group_name = aspeed_pinctrl_get_group_name,
 	.get_group_pins = aspeed_pinctrl_get_group_pins,
 	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
+static struct pinconf_ops aspeed_g5_conf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
 static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
 	.pctlops = &aspeed_g5_pinctrl_ops,
 	.pmxops = &aspeed_g5_pinmux_ops,
+	.confops = &aspeed_g5_conf_ops,
 };
 
 static int aspeed_g5_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 76f62bd45f02..b403059c249b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -537,3 +537,210 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+static inline bool pin_in_config_range(unsigned int offset,
+		const struct aspeed_pin_config *config)
+{
+	return offset >= config->pins[0] && offset <= config->pins[1];
+}
+
+static inline const struct aspeed_pin_config *find_pinconf_config(
+		const struct aspeed_pinctrl_data *pdata,
+		unsigned int offset,
+		enum pin_config_param param)
+{
+	unsigned int i;
+
+	for (i = 0; i < pdata->nconfigs; i++) {
+		if (param == pdata->configs[i].param &&
+				pin_in_config_range(offset, &pdata->configs[i]))
+			return &pdata->configs[i];
+	}
+
+	return NULL;
+}
+
+/**
+ * @param: pinconf configuration parameter
+ * @arg: The supported argument for @param, or -1 if any value is supported
+ * @value: The register value to write to configure @arg for @param
+ *
+ * The map is to be used in conjunction with the configuration array supplied
+ * by the driver implementation.
+ */
+struct aspeed_pin_config_map {
+	enum pin_config_param param;
+	s32 arg;
+	u32 val;
+};
+
+enum aspeed_pin_config_map_type { MAP_TYPE_ARG, MAP_TYPE_VAL };
+
+/* Aspeed consistently both:
+ *
+ * 1. Defines "disable bits" for internal pull-downs
+ * 2. Uses 8mA or 16mA drive strengths
+ */
+static const struct aspeed_pin_config_map pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0 },
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1 },
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0 },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1 },
+};
+
+static const struct aspeed_pin_config_map *find_pinconf_map(
+		enum pin_config_param param,
+		enum aspeed_pin_config_map_type type,
+		s64 value)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pin_config_map); i++) {
+		const struct aspeed_pin_config_map *elem;
+		bool match;
+
+		elem = &pin_config_map[i];
+
+		switch (type) {
+		case MAP_TYPE_ARG:
+			match = (elem->arg == -1 || elem->arg == value);
+			break;
+		case MAP_TYPE_VAL:
+			match = (elem->val == value);
+			break;
+		}
+
+		if (param == elem->param && match)
+			return elem;
+	}
+
+	return NULL;
+}
+
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config)
+{
+	const enum pin_config_param param = pinconf_to_config_param(*config);
+	const struct aspeed_pin_config_map *pmap;
+	const struct aspeed_pinctrl_data *pdata;
+	const struct aspeed_pin_config *pconf;
+	unsigned int val;
+	int rc = 0;
+	int shift;
+	u32 arg;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+	pconf = find_pinconf_config(pdata, offset, param);
+	if (!pconf)
+		return -ENOTSUPP;
+
+	shift = __ffs(pconf->mask);
+
+	rc = regmap_read(pdata->maps[ASPEED_IP_SCU], pconf->reg, &val);
+	if (rc < 0)
+		return rc;
+
+	pmap = find_pinconf_map(param, MAP_TYPE_VAL,
+			(val & pconf->mask) >> shift);
+
+	if (!pmap)
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		arg = (u32) pmap->arg;
+	else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
+		arg = !!pmap->arg;
+	else
+		arg = 1;
+
+	if (!arg)
+		return -EINVAL;
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs)
+{
+	const struct aspeed_pinctrl_data *pdata;
+	unsigned int i;
+	int rc = 0;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	for (i = 0; i < num_configs; i++) {
+		const struct aspeed_pin_config_map *pmap;
+		const struct aspeed_pin_config *pconf;
+		enum pin_config_param param;
+		unsigned int val;
+		u32 arg;
+
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		pconf = find_pinconf_config(pdata, offset, param);
+		if (!pconf)
+			return -ENOTSUPP;
+
+		pmap = find_pinconf_map(param, MAP_TYPE_ARG, arg);
+
+		if (unlikely(WARN_ON(!pmap)))
+			return -EINVAL;
+
+		val = pmap->val << __ffs(pconf->mask);
+
+		rc = regmap_update_bits(pdata->maps[ASPEED_IP_SCU], pconf->reg,
+				pconf->mask, val);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	if (!npins)
+		return -ENODEV;
+
+	rc = aspeed_pin_config_get(pctldev, pins[0], config);
+
+	return rc;
+}
+
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+	int i;
+
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < npins; i++) {
+		rc = aspeed_pin_config_set(pctldev, pins[i], configs,
+				num_configs);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 08a10d4db229..6ba2724e4470 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -514,6 +514,20 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
 	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
 
+/**
+ * @param The pinconf parameter type
+ * @pins The pin range this config struct covers, [low, high]
+ * @reg The register housing the configuration bits
+ * @mask The mask to select the bits of interest in @reg
+ */
+struct aspeed_pin_config {
+	enum pin_config_param param;
+	unsigned int pins[2];
+	unsigned int reg;
+	u32 mask;
+	u32 value;
+};
+
 struct aspeed_pinctrl_data {
 	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
 
@@ -525,6 +539,9 @@ struct aspeed_pinctrl_data {
 
 	const struct aspeed_pin_function *functions;
 	const unsigned int nfunctions;
+
+	const struct aspeed_pin_config *configs;
+	const unsigned int nconfigs;
 };
 
 #define ASPEED_PINCTRL_PIN(name_) \
@@ -580,5 +597,16 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config);
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs);
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config);
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs);
 
 #endif /* PINCTRL_ASPEED */
-- 
2.9.3

