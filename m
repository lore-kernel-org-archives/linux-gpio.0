From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 02/14] pinctrl-sx150x: Add SX1503 specific data
Date: Tue,  1 Nov 2016 08:57:36 -0700
Message-ID: <1478015868-10309-3-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 41b9e6a..e0f52e4 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -229,6 +229,29 @@ static const struct sx150x_device_data sx1502q_device_data = {
 	.npins = 8, /* oscio not available */
 };
 
+static const struct sx150x_device_data sx1503q_device_data = {
+	.model = SX150X_123,
+	.reg_pullup	= 0x05,
+	.reg_pulldn	= 0x07,
+	.reg_dir	= 0x03,
+	.reg_data	= 0x01,
+	.reg_irq_mask	= 0x09,
+	.reg_irq_src	= 0x0f,
+	.reg_sense	= 0x07,
+	.pri.x123 = {
+		.reg_pld_mode	= 0x10,
+		.reg_pld_table0	= 0x11,
+		.reg_pld_table1	= 0x12,
+		.reg_pld_table2	= 0x13,
+		.reg_pld_table3	= 0x14,
+		.reg_pld_table4	= 0x15,
+		.reg_advance	= 0xad,
+	},
+	.ngpios	= 16,
+	.pins = sx150x_16_pins,
+	.npins  = 16, /* oscio not available */
+};
+
 static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
 {
 	s32 err = i2c_smbus_write_byte_data(client, reg, val);
@@ -858,6 +881,7 @@ static const struct i2c_device_id sx150x_id[] = {
 	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
 	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
 	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
+	{"sx1503q", (kernel_ulong_t) &sx1503q_device_data },
 	{}
 };
 
-- 
2.5.5
