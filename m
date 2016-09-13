From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [RESEND PATCH v2 1/4] pinctrl: amlogic: gxbb: add spi nor pins
Date: Tue, 13 Sep 2016 17:12:21 +0200
Message-ID: <1473779542-2635-1-git-send-email-jbrunet@baylibre.com>
References: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36073 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754132AbcIMPNB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 11:13:01 -0400
Received: by mail-wm0-f53.google.com with SMTP id b187so580274wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 08:13:00 -0700 (PDT)
In-Reply-To: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Add EE domains pins for the SPI flash controller

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index f115638e8699..573901887cee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -156,6 +156,11 @@ static const unsigned int emmc_clk_pins[] = { PIN(BOOT_8, EE_OFF) };
 static const unsigned int emmc_cmd_pins[] = { PIN(BOOT_10, EE_OFF) };
 static const unsigned int emmc_ds_pins[] = { PIN(BOOT_15, EE_OFF) };
 
+static const unsigned int nor_d_pins[]		= { PIN(BOOT_11, EE_OFF) };
+static const unsigned int nor_q_pins[]		= { PIN(BOOT_12, EE_OFF) };
+static const unsigned int nor_c_pins[]		= { PIN(BOOT_13, EE_OFF) };
+static const unsigned int nor_cs_pins[]		= { PIN(BOOT_15, EE_OFF) };
+
 static const unsigned int sdcard_d0_pins[] = { PIN(CARD_1, EE_OFF) };
 static const unsigned int sdcard_d1_pins[] = { PIN(CARD_0, EE_OFF) };
 static const unsigned int sdcard_d2_pins[] = { PIN(CARD_5, EE_OFF) };
@@ -430,6 +435,10 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
 	GROUP(emmc_clk,		4,	18),
 	GROUP(emmc_cmd,		4,	19),
 	GROUP(emmc_ds,		4,	31),
+	GROUP(nor_d,		5,	1),
+	GROUP(nor_q,		5,	3),
+	GROUP(nor_c,		5,	2),
+	GROUP(nor_cs,		5,	0),
 
 	/* Bank CARD */
 	GROUP(sdcard_d1,	2,	14),
@@ -517,6 +526,10 @@ static const char * const emmc_groups[] = {
 	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
 };
 
+static const char * const nor_groups[] = {
+	"nor_d", "nor_q", "nor_c", "nor_cs",
+};
+
 static const char * const sdcard_groups[] = {
 	"sdcard_d0", "sdcard_d1", "sdcard_d2", "sdcard_d3",
 	"sdcard_cmd", "sdcard_clk",
@@ -619,6 +632,7 @@ static const char * const pwm_ao_b_groups[] = {
 static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
+	FUNCTION(nor),
 	FUNCTION(sdcard),
 	FUNCTION(sdio),
 	FUNCTION(uart_a),
-- 
2.7.4

