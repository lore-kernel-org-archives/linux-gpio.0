From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/3] pinctrl: sx150x: rename 'reg_advance' to 'reg_advanced'
Date: Fri,  2 Dec 2016 11:51:15 +0100
Message-ID: <1480675876-19540-3-git-send-email-peda@axentia.se>
References: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480675876-19540-1-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This matches the datasheets and is less confusing since the register
has nothing to with advancing anything.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index a121819ffc92..37b8737e61a9 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -60,7 +60,7 @@ struct sx150x_123_pri {
 	u8 reg_pld_table2;
 	u8 reg_pld_table3;
 	u8 reg_pld_table4;
-	u8 reg_advance;
+	u8 reg_advanced;
 };
 
 struct sx150x_456_pri {
@@ -70,7 +70,7 @@ struct sx150x_456_pri {
 	u8 reg_pld_table2;
 	u8 reg_pld_table3;
 	u8 reg_pld_table4;
-	u8 reg_advance;
+	u8 reg_advanced;
 };
 
 struct sx150x_789_pri {
@@ -170,7 +170,7 @@ static const struct sx150x_device_data sx1501q_device_data = {
 		.reg_pld_mode	= 0x10,
 		.reg_pld_table0	= 0x11,
 		.reg_pld_table2	= 0x13,
-		.reg_advance	= 0xad,
+		.reg_advanced	= 0xad,
 	},
 	.ngpios	= 4,
 	.pins = sx150x_4_pins,
@@ -193,7 +193,7 @@ static const struct sx150x_device_data sx1502q_device_data = {
 		.reg_pld_table2	= 0x13,
 		.reg_pld_table3	= 0x14,
 		.reg_pld_table4	= 0x15,
-		.reg_advance	= 0xad,
+		.reg_advanced	= 0xad,
 	},
 	.ngpios	= 8,
 	.pins = sx150x_8_pins,
@@ -216,7 +216,7 @@ static const struct sx150x_device_data sx1503q_device_data = {
 		.reg_pld_table2	= 0x26,
 		.reg_pld_table3	= 0x28,
 		.reg_pld_table4	= 0x2a,
-		.reg_advance	= 0xad,
+		.reg_advanced	= 0xad,
 	},
 	.ngpios	= 16,
 	.pins = sx150x_16_pins,
@@ -280,7 +280,7 @@ static const struct sx150x_device_data sx1506q_device_data = {
 		.reg_pld_table2	= 0x26,
 		.reg_pld_table3	= 0x28,
 		.reg_pld_table4	= 0x2a,
-		.reg_advance	= 0xad,
+		.reg_advanced	= 0xad,
 	},
 	.ngpios	= 16,
 	.pins = sx150x_16_pins,
@@ -900,7 +900,7 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
 		value = SX150X_789_REG_MISC_AUTOCLEAR_OFF;
 		break;
 	case SX150X_456:
-		reg   = pctl->data->pri.x456.reg_advance;
+		reg   = pctl->data->pri.x456.reg_advanced;
 		value = 0x00;
 
 		/*
@@ -911,7 +911,7 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
 			return 0;
 		break;
 	case SX150X_123:
-		reg   = pctl->data->pri.x123.reg_advance;
+		reg   = pctl->data->pri.x123.reg_advanced;
 		value = 0x00;
 		break;
 	default:
@@ -964,10 +964,10 @@ static int sx150x_regmap_reg_width(struct sx150x_pinctrl *pctl,
 		     reg == data->pri.x789.reg_reset))
 		   ||
 		   (data->model == SX150X_123 &&
-		    reg == data->pri.x123.reg_advance)
+		    reg == data->pri.x123.reg_advanced)
 		   ||
 		   (data->model == SX150X_456 &&
-		    reg == data->pri.x456.reg_advance)) {
+		    reg == data->pri.x456.reg_advanced)) {
 		return 8;
 	} else {
 		return data->ngpios;
-- 
2.1.4
