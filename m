From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 02/15] pinctrl-sx150x: Add SX1503 specific data
Date: Mon,  7 Nov 2016 08:53:10 -0800
Message-ID: <1478537603-23653-3-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33528 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753522AbcKGQyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 11:54:03 -0500
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 0523f5a..9466777 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -230,6 +230,29 @@ static const struct sx150x_device_data sx1502q_device_data = {
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
@@ -859,6 +882,7 @@ static const struct i2c_device_id sx150x_id[] = {
 	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
 	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
 	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
+	{"sx1503q", (kernel_ulong_t) &sx1503q_device_data },
 	{}
 };
 
@@ -867,6 +891,7 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
 	{ .compatible = "semtech,sx1506q", .data = &sx1506q_device_data },
 	{ .compatible = "semtech,sx1502q", .data = &sx1502q_device_data },
+	{ .compatible = "semtech,sx1503q", .data = &sx1503q_device_data },
 	{},
 };
 
-- 
2.5.5

