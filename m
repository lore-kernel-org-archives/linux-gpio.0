From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH RESEND 4/4] Pinctrl: Ingenic: Fix const declaration.
Date: Fri, 25 Jan 2019 17:59:53 +0800
Message-ID: <1548410393-6981-5-git-send-email-zhouyanjie@zoho.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, paul.burton@mips.com, paul@crapouillou.net, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

Warning is reported when checkpatch indicates that
"static const char * array" should be changed to
"static const char * const".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 136 +++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 60 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2b3f7e4..e982896 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -172,23 +172,25 @@ static const struct group_desc jz4740_groups[] = {
 	INGENIC_PIN_GROUP("pwm7", jz4740_pwm_pwm7),
 };
 
-static const char *jz4740_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
-static const char *jz4740_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
-static const char *jz4740_uart1_groups[] = { "uart1-data", };
-static const char *jz4740_lcd_groups[] = {
+static const char * const jz4740_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
+static const char * const jz4740_uart0_groups[] = {
+	"uart0-data", "uart0-hwflow",
+};
+static const char * const jz4740_uart1_groups[] = { "uart1-data", };
+static const char * const jz4740_lcd_groups[] = {
 	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-18bit-tft", "lcd-no-pins",
 };
-static const char *jz4740_nand_groups[] = {
+static const char * const jz4740_nand_groups[] = {
 	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4",
 };
-static const char *jz4740_pwm0_groups[] = { "pwm0", };
-static const char *jz4740_pwm1_groups[] = { "pwm1", };
-static const char *jz4740_pwm2_groups[] = { "pwm2", };
-static const char *jz4740_pwm3_groups[] = { "pwm3", };
-static const char *jz4740_pwm4_groups[] = { "pwm4", };
-static const char *jz4740_pwm5_groups[] = { "pwm5", };
-static const char *jz4740_pwm6_groups[] = { "pwm6", };
-static const char *jz4740_pwm7_groups[] = { "pwm7", };
+static const char * const jz4740_pwm0_groups[] = { "pwm0", };
+static const char * const jz4740_pwm1_groups[] = { "pwm1", };
+static const char * const jz4740_pwm2_groups[] = { "pwm2", };
+static const char * const jz4740_pwm3_groups[] = { "pwm3", };
+static const char * const jz4740_pwm4_groups[] = { "pwm4", };
+static const char * const jz4740_pwm5_groups[] = { "pwm5", };
+static const char * const jz4740_pwm6_groups[] = { "pwm6", };
+static const char * const jz4740_pwm7_groups[] = { "pwm7", };
 
 static const struct function_desc jz4740_functions[] = {
 	{ "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
@@ -272,19 +274,19 @@ static const struct group_desc jz4725b_groups[] = {
 	INGENIC_PIN_GROUP("pwm5", jz4725b_pwm_pwm5),
 };
 
-static const char *jz4725b_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
-static const char *jz4725b_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
-static const char *jz4725b_uart_groups[] = { "uart-data", };
-static const char *jz4725b_nand_groups[] = {
+static const char * const jz4725b_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char * const jz4725b_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
+static const char * const jz4725b_uart_groups[] = { "uart-data", };
+static const char * const jz4725b_nand_groups[] = {
 	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4",
 	"nand-cle-ale", "nand-fre-fwe",
 };
-static const char *jz4725b_pwm0_groups[] = { "pwm0", };
-static const char *jz4725b_pwm1_groups[] = { "pwm1", };
-static const char *jz4725b_pwm2_groups[] = { "pwm2", };
-static const char *jz4725b_pwm3_groups[] = { "pwm3", };
-static const char *jz4725b_pwm4_groups[] = { "pwm4", };
-static const char *jz4725b_pwm5_groups[] = { "pwm5", };
+static const char * const jz4725b_pwm0_groups[] = { "pwm0", };
+static const char * const jz4725b_pwm1_groups[] = { "pwm1", };
+static const char * const jz4725b_pwm2_groups[] = { "pwm2", };
+static const char * const jz4725b_pwm3_groups[] = { "pwm3", };
+static const char * const jz4725b_pwm4_groups[] = { "pwm4", };
+static const char * const jz4725b_pwm5_groups[] = { "pwm5", };
 
 static const struct function_desc jz4725b_functions[] = {
 	{ "mmc0", jz4725b_mmc0_groups, ARRAY_SIZE(jz4725b_mmc0_groups), },
@@ -500,46 +502,56 @@ static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii),
 };
 
-static const char *jz4770_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
-static const char *jz4770_uart1_groups[] = { "uart1-data", "uart1-hwflow", };
-static const char *jz4770_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
-static const char *jz4770_uart3_groups[] = { "uart3-data", "uart3-hwflow", };
-static const char *jz4770_mmc0_groups[] = {
+static const char * const jz4770_uart0_groups[] = {
+	"uart0-data", "uart0-hwflow",
+};
+static const char * const jz4770_uart1_groups[] = {
+	"uart1-data", "uart1-hwflow",
+};
+static const char * const jz4770_uart2_groups[] = {
+	"uart2-data", "uart2-hwflow",
+};
+static const char * const jz4770_uart3_groups[] = {
+	"uart3-data", "uart3-hwflow",
+};
+static const char * const jz4770_mmc0_groups[] = {
 	"mmc0-1bit-a", "mmc0-4bit-a",
 	"mmc0-1bit-e", "mmc0-4bit-e", "mmc0-8bit-e",
 };
-static const char *jz4770_mmc1_groups[] = {
+static const char * const jz4770_mmc1_groups[] = {
 	"mmc1-1bit-d", "mmc1-4bit-d",
 	"mmc1-1bit-e", "mmc1-4bit-e", "mmc1-8bit-e",
 };
-static const char *jz4770_mmc2_groups[] = {
+static const char * const jz4770_mmc2_groups[] = {
 	"mmc2-1bit-b", "mmc2-4bit-b",
 	"mmc2-1bit-e", "mmc2-4bit-e", "mmc2-8bit-e",
 };
-static const char *jz4770_nemc_groups[] = {
+static const char * const jz4770_nemc_groups[] = {
 	"nemc-8bit-data", "nemc-16bit-data", "nemc-cle-ale",
 	"nemc-addr", "nemc-rd-we", "nemc-frd-fwe", "nemc-wait",
 };
-static const char *jz4770_cs1_groups[] = { "nemc-cs1", };
-static const char *jz4770_cs2_groups[] = { "nemc-cs2", };
-static const char *jz4770_cs3_groups[] = { "nemc-cs3", };
-static const char *jz4770_cs4_groups[] = { "nemc-cs4", };
-static const char *jz4770_cs5_groups[] = { "nemc-cs5", };
-static const char *jz4770_cs6_groups[] = { "nemc-cs6", };
-static const char *jz4770_i2c0_groups[] = { "i2c0-data", };
-static const char *jz4770_i2c1_groups[] = { "i2c1-data", };
-static const char *jz4770_i2c2_groups[] = { "i2c2-data", };
-static const char *jz4770_cim_groups[] = { "cim-data-8bit", "cim-data-12bit", };
-static const char *jz4770_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
-static const char *jz4770_pwm0_groups[] = { "pwm0", };
-static const char *jz4770_pwm1_groups[] = { "pwm1", };
-static const char *jz4770_pwm2_groups[] = { "pwm2", };
-static const char *jz4770_pwm3_groups[] = { "pwm3", };
-static const char *jz4770_pwm4_groups[] = { "pwm4", };
-static const char *jz4770_pwm5_groups[] = { "pwm5", };
-static const char *jz4770_pwm6_groups[] = { "pwm6", };
-static const char *jz4770_pwm7_groups[] = { "pwm7", };
-static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
+static const char * const jz4770_cs1_groups[] = { "nemc-cs1", };
+static const char * const jz4770_cs2_groups[] = { "nemc-cs2", };
+static const char * const jz4770_cs3_groups[] = { "nemc-cs3", };
+static const char * const jz4770_cs4_groups[] = { "nemc-cs4", };
+static const char * const jz4770_cs5_groups[] = { "nemc-cs5", };
+static const char * const jz4770_cs6_groups[] = { "nemc-cs6", };
+static const char * const jz4770_i2c0_groups[] = { "i2c0-data", };
+static const char * const jz4770_i2c1_groups[] = { "i2c1-data", };
+static const char * const jz4770_i2c2_groups[] = { "i2c2-data", };
+static const char * const jz4770_cim_groups[] = {
+	"cim-data-8bit", "cim-data-12bit",
+};
+static const char * const jz4770_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
+static const char * const jz4770_pwm0_groups[] = { "pwm0", };
+static const char * const jz4770_pwm1_groups[] = { "pwm1", };
+static const char * const jz4770_pwm2_groups[] = { "pwm2", };
+static const char * const jz4770_pwm3_groups[] = { "pwm3", };
+static const char * const jz4770_pwm4_groups[] = { "pwm4", };
+static const char * const jz4770_pwm5_groups[] = { "pwm5", };
+static const char * const jz4770_pwm6_groups[] = { "pwm6", };
+static const char * const jz4770_pwm7_groups[] = { "pwm7", };
+static const char * const jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
 static const struct function_desc jz4770_functions[] = {
 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
@@ -652,25 +664,29 @@ static const struct group_desc jz4780_groups[] = {
 	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7),
 };
 
-static const char *jz4780_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
-static const char *jz4780_uart4_groups[] = { "uart4-data", };
-static const char *jz4780_mmc0_groups[] = {
+static const char * const jz4780_uart2_groups[] = {
+	"uart2-data", "uart2-hwflow",
+};
+static const char * const jz4780_uart4_groups[] = { "uart4-data", };
+static const char * const jz4780_mmc0_groups[] = {
 	"mmc0-1bit-a", "mmc0-4bit-a", "mmc0-8bit-a",
 	"mmc0-1bit-e", "mmc0-4bit-e",
 };
-static const char *jz4780_mmc1_groups[] = {
+static const char * const jz4780_mmc1_groups[] = {
 	"mmc1-1bit-d", "mmc1-4bit-d", "mmc1-1bit-e", "mmc1-4bit-e",
 };
-static const char *jz4780_mmc2_groups[] = {
+static const char * const jz4780_mmc2_groups[] = {
 	"mmc2-1bit-b", "mmc2-4bit-b", "mmc2-1bit-e", "mmc2-4bit-e",
 };
-static const char *jz4780_nemc_groups[] = {
+static const char * const jz4780_nemc_groups[] = {
 	"nemc-data", "nemc-cle-ale", "nemc-addr",
 	"nemc-rd-we", "nemc-frd-fwe", "nemc-wait",
 };
-static const char *jz4780_i2c3_groups[] = { "i2c3-data", };
-static const char *jz4780_i2c4_groups[] = { "i2c4-data-e", "i2c4-data-f", };
-static const char *jz4780_cim_groups[] = { "cim-data", };
+static const char * const jz4780_i2c3_groups[] = { "i2c3-data", };
+static const char * const jz4780_i2c4_groups[] = {
+	"i2c4-data-e", "i2c4-data-f",
+};
+static const char * const jz4780_cim_groups[] = { "cim-data", };
 
 static const struct function_desc jz4780_functions[] = {
 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
-- 
2.7.4
