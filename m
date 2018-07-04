From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] pinctrl: meson: add gen_clk pins
Date: Wed,  4 Jul 2018 18:57:24 +0200
Message-ID: <20180704165724.3387-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add the pinctrl configuration for gen_clk on gxbb and axg.
gen_clk allows to output and devide several internal clocks of SoC,
including most of the plls.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg.c  | 9 +++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 46a0918bd284..ad502eda4afa 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -672,6 +672,9 @@ static const unsigned int jtag_ao_tdo_pins[] = {GPIOAO_4};
 static const unsigned int jtag_ao_clk_pins[] = {GPIOAO_5};
 static const unsigned int jtag_ao_tms_pins[] = {GPIOAO_7};
 
+/* gen_clk */
+static const unsigned int gen_clk_ee_pins[] = {GPIOAO_13};
+
 static struct meson_pmx_group meson_axg_aobus_groups[] = {
 	GPIO_GROUP(GPIOAO_0),
 	GPIO_GROUP(GPIOAO_1),
@@ -718,6 +721,7 @@ static struct meson_pmx_group meson_axg_aobus_groups[] = {
 	GROUP(jtag_ao_tdo, 4),
 	GROUP(jtag_ao_clk, 4),
 	GROUP(jtag_ao_tms, 4),
+	GROUP(gen_clk_ee, 4),
 };
 
 static const char * const gpio_periphs_groups[] = {
@@ -947,6 +951,10 @@ static const char * const tdmb_groups[] = {
 	"tdmb_din2", "tdmb_dout2", "tdmb_din3",	"tdmb_dout3",
 };
 
+static const char * const gen_clk_ee_groups[] = {
+	"gen_clk_ee",
+};
+
 static struct meson_pmx_func meson_axg_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
@@ -992,6 +1000,7 @@ static struct meson_pmx_func meson_axg_aobus_functions[] = {
 	FUNCTION(pwm_ao_c),
 	FUNCTION(pwm_ao_d),
 	FUNCTION(jtag_ao),
+	FUNCTION(gen_clk_ee),
 };
 
 static struct meson_bank meson_axg_periphs_banks[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 2c97a2e07a5f..4ceb06f8a33c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -243,6 +243,8 @@ static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
 
 static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
 
+static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
+
 static const struct pinctrl_pin_desc meson_gxbb_aobus_pins[] = {
 	MESON_PIN(GPIOAO_0),
 	MESON_PIN(GPIOAO_1),
@@ -453,6 +455,7 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(i2s_out_ch45_y,	1,	6),
 	GROUP(i2s_out_ch67_y,	1,	7),
 	GROUP(spdif_out_y,	1,	9),
+	GROUP(gen_clk_out,	6,	15),
 
 	/* Bank Z */
 	GROUP(eth_mdio,		6,	1),
@@ -706,6 +709,10 @@ static const char * const spdif_out_groups[] = {
 	"spdif_out_y",
 };
 
+static const char * const gen_clk_out_groups[] = {
+	"gen_clk_out",
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -790,6 +797,7 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(hdmi_i2c),
 	FUNCTION(i2s_out),
 	FUNCTION(spdif_out),
+	FUNCTION(gen_clk_out),
 };
 
 static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
-- 
2.14.4
