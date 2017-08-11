From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 2/2] pinctrl: qcom: General Purpose clocks for apq8064
Date: Fri, 11 Aug 2017 12:25:16 +0530
Message-ID: <1502434516-9056-2-git-send-email-simhavcs@gmail.com>
References: <1502434516-9056-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502434516-9056-1-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm@vger.kernel.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Add support for general purpose (GP) clocks
for apq8064

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>

---
v1:
* only gp_clk_1b tested in nexus7 anx7808 slimport.
---
 drivers/pinctrl/qcom/pinctrl-apq8064.c | 37 ++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index cd96699..e59ee61 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -295,6 +295,12 @@ enum apq8064_functions {
 	APQ_MUX_cam_mclk,
 	APQ_MUX_codec_mic_i2s,
 	APQ_MUX_codec_spkr_i2s,
+	APQ_MUX_gp_clk_0a,
+	APQ_MUX_gp_clk_0b,
+	APQ_MUX_gp_clk_1a,
+	APQ_MUX_gp_clk_1b,
+	APQ_MUX_gp_clk_2a,
+	APQ_MUX_gp_clk_2b,
 	APQ_MUX_gpio,
 	APQ_MUX_gsbi1,
 	APQ_MUX_gsbi2,
@@ -354,6 +360,24 @@ static const char * const gpio_groups[] = {
 	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
 	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89"
 };
+static const char * const gp_clk_0a_groups[] = {
+	"gpio3"
+};
+static const char * const gp_clk_0b_groups[] = {
+	"gpio34"
+};
+static const char * const gp_clk_1a_groups[] = {
+	"gpio4"
+};
+static const char * const gp_clk_1b_groups[] = {
+	"gpio50"
+};
+static const char * const gp_clk_2a_groups[] = {
+	"gpio32"
+};
+static const char * const gp_clk_2b_groups[] = {
+	"gpio25"
+};
 static const char * const ps_hold_groups[] = {
 	"gpio78"
 };
@@ -453,6 +477,7 @@ static const struct msm_function apq8064_functions[] = {
 	FUNCTION(codec_mic_i2s),
 	FUNCTION(codec_spkr_i2s),
 	FUNCTION(gpio),
+	FUNCTION(gp_clk_1b),
 	FUNCTION(gsbi1),
 	FUNCTION(gsbi2),
 	FUNCTION(gsbi3),
@@ -490,8 +515,8 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(0, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(4, NA, NA, cam_mclk, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(3, NA, gp_clk_0a, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(4, NA, NA, cam_mclk, gp_clk_1a, NA, NA, NA, NA, NA, NA),
 	PINGROUP(5, NA, cam_mclk, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(7, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
@@ -512,16 +537,16 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(22, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(23, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(24, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(25, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(25, gsbi2, gp_clk_2b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(26, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(27, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(28, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(29, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(30, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(31, mi2s, NA, gsbi5_spi_cs2, gsbi6_spi_cs2, gsbi7_spi_cs2, NA, NA, NA, NA, NA),
-	PINGROUP(32, mi2s, NA, NA, NA, NA, gsbi5_spi_cs3, gsbi6_spi_cs3, gsbi7_spi_cs3, NA, NA),
+	PINGROUP(32, mi2s, gp_clk_2a, NA, NA, NA, gsbi5_spi_cs3, gsbi6_spi_cs3, gsbi7_spi_cs3, NA, NA),
 	PINGROUP(33, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(34, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(34, codec_mic_i2s, gp_clk_0b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(35, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(36, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(37, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
@@ -537,7 +562,7 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(47, spkr_i2s, gsbi5_spi_cs1, gsbi6_spi_cs1, gsbi7_spi_cs1, NA, NA, NA, NA, NA, NA),
 	PINGROUP(48, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(49, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(50, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(50, spkr_i2s, gp_clk_1b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(51, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(52, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(53, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
-- 
2.7.4
