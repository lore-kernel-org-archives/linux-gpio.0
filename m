From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Add LCD pins for the JZ4725B SoC
Date: Thu,  7 Feb 2019 10:55:36 -0300
Message-ID: <20190207135536.6757-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

Add the pins and groups for the "lcd" pin function in the JZ4725B SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index db6b48ea5f47..49532e3ecb1e 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -233,6 +233,19 @@ static int jz4725b_pwm_pwm2_pins[] = { 0x4c, };
 static int jz4725b_pwm_pwm3_pins[] = { 0x4d, };
 static int jz4725b_pwm_pwm4_pins[] = { 0x4e, };
 static int jz4725b_pwm_pwm5_pins[] = { 0x4f, };
+static int jz4725b_lcd_8bit_pins[] = {
+	0x72, 0x73, 0x74,
+	0x60, 0x61, 0x62, 0x63,
+	0x64, 0x65, 0x66, 0x67,
+};
+static int jz4725b_lcd_16bit_pins[] = {
+	0x68, 0x69, 0x6a, 0x6b,
+	0x6c, 0x6d, 0x6e, 0x6f,
+};
+static int jz4725b_lcd_18bit_pins[] = { 0x70, 0x71, };
+static int jz4725b_lcd_24bit_pins[] = { 0x76, 0x77, 0x78, 0x79, };
+static int jz4725b_lcd_special_pins[] = { 0x76, 0x77, 0x78, 0x79, };
+static int jz4725b_lcd_generic_pins[] = { 0x75, };
 
 static int jz4725b_mmc0_1bit_funcs[] = { 1, 1, 1, };
 static int jz4725b_mmc0_4bit_funcs[] = { 1, 0, 1, };
@@ -251,6 +264,12 @@ static int jz4725b_pwm_pwm2_funcs[] = { 0, };
 static int jz4725b_pwm_pwm3_funcs[] = { 0, };
 static int jz4725b_pwm_pwm4_funcs[] = { 0, };
 static int jz4725b_pwm_pwm5_funcs[] = { 0, };
+static int jz4725b_lcd_8bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
+static int jz4725b_lcd_16bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int jz4725b_lcd_18bit_funcs[] = { 0, 0, };
+static int jz4725b_lcd_24bit_funcs[] = { 1, 1, 1, 1, };
+static int jz4725b_lcd_special_funcs[] = { 0, 0, 0, 0, };
+static int jz4725b_lcd_generic_funcs[] = { 0, };
 
 static const struct group_desc jz4725b_groups[] = {
 	INGENIC_PIN_GROUP("mmc0-1bit", jz4725b_mmc0_1bit),
@@ -270,6 +289,12 @@ static const struct group_desc jz4725b_groups[] = {
 	INGENIC_PIN_GROUP("pwm3", jz4725b_pwm_pwm3),
 	INGENIC_PIN_GROUP("pwm4", jz4725b_pwm_pwm4),
 	INGENIC_PIN_GROUP("pwm5", jz4725b_pwm_pwm5),
+	INGENIC_PIN_GROUP("lcd-8bit", jz4725b_lcd_8bit),
+	INGENIC_PIN_GROUP("lcd-16bit", jz4725b_lcd_16bit),
+	INGENIC_PIN_GROUP("lcd-18bit", jz4725b_lcd_18bit),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4725b_lcd_24bit),
+	INGENIC_PIN_GROUP("lcd-special", jz4725b_lcd_special),
+	INGENIC_PIN_GROUP("lcd-generic", jz4725b_lcd_generic),
 };
 
 static const char *jz4725b_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
@@ -285,6 +310,10 @@ static const char *jz4725b_pwm2_groups[] = { "pwm2", };
 static const char *jz4725b_pwm3_groups[] = { "pwm3", };
 static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
+static const char *jz4725b_lcd_groups[] = {
+	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
+	"lcd-special", "lcd-generic",
+};
 
 static const struct function_desc jz4725b_functions[] = {
 	{ "mmc0", jz4725b_mmc0_groups, ARRAY_SIZE(jz4725b_mmc0_groups), },
@@ -297,6 +326,7 @@ static const struct function_desc jz4725b_functions[] = {
 	{ "pwm3", jz4725b_pwm3_groups, ARRAY_SIZE(jz4725b_pwm3_groups), },
 	{ "pwm4", jz4725b_pwm4_groups, ARRAY_SIZE(jz4725b_pwm4_groups), },
 	{ "pwm5", jz4725b_pwm5_groups, ARRAY_SIZE(jz4725b_pwm5_groups), },
+	{ "lcd", jz4725b_lcd_groups, ARRAY_SIZE(jz4725b_lcd_groups), },
 };
 
 static const struct ingenic_chip_info jz4725b_chip_info = {
-- 
2.11.0
