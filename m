From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: add USB functions for STn8815
Date: Mon, 12 Feb 2018 22:54:06 +0100
Message-ID: <20180212215406.10987-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:41731 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932109AbeBLV4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Feb 2018 16:56:13 -0500
Received: by mail-lf0-f65.google.com with SMTP id f136so22423219lff.8
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 13:56:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

The MUSB block in the Nomadik has two pin settings: high speed or
full speed. These correspond to two unique pin group settings: all
pins set to function B for high speed and all set to function C
for full speed. Full speed uses more pins than high speed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
index 7e814764da7d..8d944bb3a036 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
@@ -291,7 +291,17 @@ static const unsigned i2cusb_b_1_pins[] = { STN8815_PIN_C21, STN8815_PIN_C20 };
 static const unsigned clcd_16_23_b_1_pins[] = { STN8815_PIN_AB6,
 	STN8815_PIN_AA6, STN8815_PIN_Y6, STN8815_PIN_Y5, STN8815_PIN_AA5,
 	STN8815_PIN_AB5, STN8815_PIN_AB4, STN8815_PIN_Y4 };
-
+/* Full-speed and high-speed USB pins */
+static const unsigned usbfs_b_1_pins[] = { STN8815_PIN_E21, STN8815_PIN_E20,
+					   STN8815_PIN_C22, STN8815_PIN_D21,
+					   STN8815_PIN_D20, STN8815_PIN_C21,
+					   STN8815_PIN_C20 };
+static const unsigned usbhs_c_1_pins[] = { STN8815_PIN_E21, STN8815_PIN_E20,
+					   STN8815_PIN_C20, STN8815_PIN_C19,
+					   STN8815_PIN_C22, STN8815_PIN_D21,
+					   STN8815_PIN_D20, STN8815_PIN_C21,
+					   STN8815_PIN_C16, STN8815_PIN_A15,
+					   STN8815_PIN_D17, STN8815_PIN_C17 };
 
 #define STN8815_PIN_GROUP(a, b) { .name = #a, .pins = a##_pins,		\
 			.npins = ARRAY_SIZE(a##_pins), .altsetting = b }
@@ -308,6 +318,8 @@ static const struct nmk_pingroup nmk_stn8815_groups[] = {
 	STN8815_PIN_GROUP(u1_b_1, NMK_GPIO_ALT_B),
 	STN8815_PIN_GROUP(i2cusb_b_1, NMK_GPIO_ALT_B),
 	STN8815_PIN_GROUP(clcd_16_23_b_1, NMK_GPIO_ALT_B),
+	STN8815_PIN_GROUP(usbfs_b_1, NMK_GPIO_ALT_B),
+	STN8815_PIN_GROUP(usbhs_c_1, NMK_GPIO_ALT_C),
 };
 
 /* We use this macro to define the groups applicable to a function */
@@ -321,6 +333,7 @@ STN8815_FUNC_GROUPS(i2c1, "i2c1_a_1");
 STN8815_FUNC_GROUPS(i2c0, "i2c0_a_1");
 STN8815_FUNC_GROUPS(i2cusb, "i2cusb_b_1");
 STN8815_FUNC_GROUPS(clcd, "clcd_16_23_b_1");
+STN8815_FUNC_GROUPS(usb, "usbfs_b_1", "usbhs_c_1");
 
 #define FUNCTION(fname)					\
 	{						\
@@ -337,6 +350,7 @@ static const struct nmk_function nmk_stn8815_functions[] = {
 	FUNCTION(i2c0),
 	FUNCTION(i2cusb),
 	FUNCTION(clcd),
+	FUNCTION(usb),
 };
 
 static const struct nmk_pinctrl_soc_data nmk_stn8815_soc = {
-- 
2.14.3

