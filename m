From: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: add Audio out pin-mux settings
Date: Wed,  9 Aug 2017 22:16:14 +0900
Message-ID: <20170809131614.31478-1-suzuki.katsuhiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx.socionext.com ([202.248.49.38]:14190 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752110AbdHINQX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Aug 2017 09:16:23 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

The UniPhier LD11/20 SoC audio core use following 8 pins:
  AO1IEC, AO1ARC, AO1DACCK, AO1BCK, AO1LRCK, AO1D[0-2]

Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 5 +++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
index 745706920642..9c5e359a63de 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
@@ -470,6 +470,8 @@ static const struct pinctrl_pin_desc uniphier_ld11_pins[] = {
 			     166, UNIPHIER_PIN_PULL_DOWN),
 };
 
+static const unsigned aout_pins[] = {135, 136, 137, 138, 139, 140, 141, 142};
+static const int aout_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_pins[] = {18, 19, 20, 21, 22, 23, 24, 25};
 static const int emmc_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_dat8_pins[] = {26, 27, 28, 29};
@@ -545,6 +547,7 @@ static const unsigned int gpio_range5_pins[] = {
 };
 
 static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
+	UNIPHIER_PINCTRL_GROUP(aout),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
 	UNIPHIER_PINCTRL_GROUP(ether_rmii),
@@ -570,6 +573,7 @@ static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range5),
 };
 
+static const char * const aout_groups[] = {"aout"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rmii_groups[] = {"ether_rmii"};
 static const char * const i2c0_groups[] = {"i2c0"};
@@ -588,6 +592,7 @@ static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 
 static const struct uniphier_pinmux_function uniphier_ld11_functions[] = {
+	UNIPHIER_PINMUX_FUNCTION(aout),
 	UNIPHIER_PINMUX_FUNCTION(emmc),
 	UNIPHIER_PINMUX_FUNCTION(ether_rmii),
 	UNIPHIER_PINMUX_FUNCTION(i2c0),
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 82f754cd85d9..83341284dc44 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -551,6 +551,8 @@ static const struct pinctrl_pin_desc uniphier_ld20_pins[] = {
 			     175, UNIPHIER_PIN_PULL_DOWN),
 };
 
+static const unsigned aout_pins[] = {135, 136, 137, 138, 139, 140, 141, 142};
+static const int aout_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_pins[] = {18, 19, 20, 21, 22, 23, 24, 25};
 static const int emmc_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned emmc_dat8_pins[] = {26, 27, 28, 29};
@@ -629,6 +631,7 @@ static const unsigned int gpio_range2_pins[] = {
 };
 
 static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
+	UNIPHIER_PINCTRL_GROUP(aout),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
 	UNIPHIER_PINCTRL_GROUP(ether_rgmii),
@@ -654,6 +657,7 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
+static const char * const aout_groups[] = {"aout"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rgmii_groups[] = {"ether_rgmii"};
 static const char * const ether_rmii_groups[] = {"ether_rmii"};
@@ -675,6 +679,7 @@ static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
 
 static const struct uniphier_pinmux_function uniphier_ld20_functions[] = {
+	UNIPHIER_PINMUX_FUNCTION(aout),
 	UNIPHIER_PINMUX_FUNCTION(emmc),
 	UNIPHIER_PINMUX_FUNCTION(ether_rgmii),
 	UNIPHIER_PINMUX_FUNCTION(ether_rmii),
-- 
2.13.2

