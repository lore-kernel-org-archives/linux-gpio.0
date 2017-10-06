From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] pinctrl: meson-gx: add TEST_N i2s pinmux
Date: Fri,  6 Oct 2017 10:31:42 +0200
Message-ID: <20171006083142.19325-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add TEST_N pinmux for channel 6 and 7 of the i2s output

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Linus,

FYI, This change depends on clean-up series you've just merged.

Cheers,
Jerome

 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 5 +++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 62483b67f114..1881d4a0eca2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -288,6 +288,7 @@ static const unsigned int i2s_out_lr_clk_pins[]	= { GPIOAO_10 };
 static const unsigned int i2s_out_ch01_ao_pins[] = { GPIOAO_11 };
 static const unsigned int i2s_out_ch23_ao_pins[] = { GPIOAO_12 };
 static const unsigned int i2s_out_ch45_ao_pins[] = { GPIOAO_13 };
+static const unsigned int i2s_out_ch67_ao_pins[] = { GPIO_TEST_N };
 
 static const unsigned int spdif_out_ao_6_pins[]	= { GPIOAO_6 };
 static const unsigned int spdif_out_ao_13_pins[] = { GPIOAO_13 };
@@ -562,6 +563,9 @@ static struct meson_pmx_group meson_gxbb_aobus_groups[] = {
 	GROUP(spdif_out_ao_13,	0,	4),
 	GROUP(ao_cec,           0,      15),
 	GROUP(ee_cec,           0,      14),
+
+	/* test n pin */
+	GROUP(i2s_out_ch67_ao,	1,	2),
 };
 
 static const char * const gpio_periphs_groups[] = {
@@ -748,6 +752,7 @@ static const char * const pwm_ao_b_groups[] = {
 static const char * const i2s_out_ao_groups[] = {
 	"i2s_am_clk", "i2s_out_ao_clk", "i2s_out_lr_clk",
 	"i2s_out_ch01_ao", "i2s_out_ch23_ao", "i2s_out_ch45_ao",
+	"i2s_out_ch67_ao",
 };
 
 static const char * const spdif_out_ao_groups[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 04334e807170..3a14ecae9f31 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -291,6 +291,7 @@ static const unsigned int pwm_ao_b_6_pins[]	= { GPIOAO_6 };
 
 static const unsigned int i2s_out_ch23_ao_pins[] = { GPIOAO_8 };
 static const unsigned int i2s_out_ch45_ao_pins[] = { GPIOAO_9 };
+static const unsigned int i2s_out_ch67_ao_pins[] = { GPIO_TEST_N };
 
 static const unsigned int spdif_out_ao_6_pins[] = { GPIOAO_6 };
 static const unsigned int spdif_out_ao_9_pins[] = { GPIOAO_9 };
@@ -557,6 +558,9 @@ static struct meson_pmx_group meson_gxl_aobus_groups[] = {
 	GROUP(spdif_out_ao_9,	0,	4),
 	GROUP(ao_cec,		0,	15),
 	GROUP(ee_cec,		0,	14),
+
+	/* test n pin */
+	GROUP(i2s_out_ch67_ao,	1,	2),
 };
 
 static const char * const gpio_periphs_groups[] = {
@@ -735,7 +739,7 @@ static const char * const pwm_ao_b_groups[] = {
 };
 
 static const char * const i2s_out_ao_groups[] = {
-	"i2s_out_ch23_ao", "i2s_out_ch45_ao",
+	"i2s_out_ch23_ao", "i2s_out_ch45_ao", "i2s_out_ch67_ao",
 };
 
 static const char * const spdif_out_ao_groups[] = {
-- 
2.13.5
