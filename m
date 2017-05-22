From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] pinctrl: meson-gxl: Add SPI pins for the SPICC controller
Date: Mon, 22 May 2017 14:59:25 +0200
Message-ID: <1495457966-2359-2-git-send-email-narmstrong@baylibre.com>
References: <1495457966-2359-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:34308 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933434AbdEVM7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 08:59:42 -0400
Received: by mail-wr0-f175.google.com with SMTP id l9so38093997wre.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 05:59:42 -0700 (PDT)
In-Reply-To: <1495457966-2359-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

The SPICC controller has dedicated SPI pins, this patchs add the pins
definition in the GXL pinctrl driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 998210e..719ff1b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -141,6 +141,11 @@
 static const unsigned int nor_c_pins[]		= { PIN(BOOT_13, EE_OFF) };
 static const unsigned int nor_cs_pins[]		= { PIN(BOOT_15, EE_OFF) };
 
+static const unsigned int spi_mosi_pins[]	= { PIN(GPIOX_8, EE_OFF) };
+static const unsigned int spi_miso_pins[]	= { PIN(GPIOX_9, EE_OFF) };
+static const unsigned int spi_ss0_pins[]	= { PIN(GPIOX_10, EE_OFF) };
+static const unsigned int spi_sclk_pins[]	= { PIN(GPIOX_11, EE_OFF) };
+
 static const unsigned int sdcard_d0_pins[] = { PIN(CARD_1, EE_OFF) };
 static const unsigned int sdcard_d1_pins[] = { PIN(CARD_0, EE_OFF) };
 static const unsigned int sdcard_d2_pins[] = { PIN(CARD_5, EE_OFF) };
@@ -405,6 +410,10 @@
 	GROUP(pwm_a,		5,	25),
 	GROUP(pwm_e,		5,	15),
 	GROUP(pwm_f_x,		5,	14),
+	GROUP(spi_mosi,		5,	3),
+	GROUP(spi_miso,		5,	2),
+	GROUP(spi_ss0,		5,	1),
+	GROUP(spi_sclk,		5,	0),
 
 	/* Bank Z */
 	GROUP(eth_mdio,		4,	23),
@@ -560,6 +569,10 @@
 	"nor_d", "nor_q", "nor_c", "nor_cs",
 };
 
+static const char * const spi_groups[] = {
+	"spi_mosi", "spi_miso", "spi_ss0", "spi_sclk",
+};
+
 static const char * const sdcard_groups[] = {
 	"sdcard_d0", "sdcard_d1", "sdcard_d2", "sdcard_d3",
 	"sdcard_cmd", "sdcard_clk",
@@ -693,6 +706,7 @@
 	FUNCTION(gpio_periphs),
 	FUNCTION(emmc),
 	FUNCTION(nor),
+	FUNCTION(spi),
 	FUNCTION(sdcard),
 	FUNCTION(sdio),
 	FUNCTION(nand),
-- 
1.9.1

