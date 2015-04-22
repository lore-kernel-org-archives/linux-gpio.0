From: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Subject: [PATCH] pinctrl: zynq: configure SPI SSx pins separately
Date: Wed, 22 Apr 2015 11:14:57 +0200
Message-ID: <1429694097-3087-1-git-send-email-helmut.buchsbaum@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33052 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965712AbbDVJPP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 05:15:15 -0400
Received: by wiax7 with SMTP id x7so125388767wia.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2015 02:15:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-gpio@vger.kernel.org, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

Since SCLK, MISO and MOSI are the only mandatory signals at Zynq's SPI
interfaces, SS0, SS1 and SS2 have to be configured separately as they may
be used as simple GPIO lines.

This, of course, has to be considered in the devicetree, so pin controller
configuration for e.g. an SPI0 using SS0 and SS1 only might look like the
following snippet (derived from the example of chapter "17.5.3
MIO/EMIO" Routing of Zynq-7000 TRM UG585). So MIO20 can now be used
as GPIO instead of being occupied by SPI0 SS2 function:

pinctrl_spi0_default: spi0-default {
	mux {
		function = "spi0";
		groups = "spi0_0_grp", "spi0_0_ss0_grp", "spi0_0_ss1_grp";
	};

	conf-output {
		pins = "MIO16", "MIO21";
		slew-rate = <0>;
		bias-disable;
		low-power-disable;
		io-standard = <1>;
	};

	conf-input {
		pins = "MIO17";
		slew-rate = <0>;
		bias-high-impedance;
		low-power-disable;
		io-standard = <1>;
	};

	conf-select {
		pins = "MIO18", "MIO19";
		slew-rate = <0>;
		bias-pull-up;
		low-power-disable;
		io-standard = <1>;
	};
};

pinctrl_gpio0_default {
	mux {
		function = "gpio0";
		groups = "gpio0_20_grp"
	};

	conf {
		pins = "MIO20";
		slew-rate = <0>;
		bias-pull-up;
		low-power-disable;
		io-standard = <1>;
	};
};

Signed-off-by: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
---
 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt         |    5 +-
 drivers/pinctrl/pinctrl-zynq.c                     |   75 +++++++++++++++++---
 2 files changed, 67 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
index b7b55a9..2219784 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
@@ -45,8 +45,9 @@ to specify in a pinconf subnode:
 
  Valid values for groups are:
    ethernet0_0_grp, ethernet1_0_grp, mdio0_0_grp, mdio1_0_grp,
-   qspi0_0_grp, qspi1_0_grp, qspi_fbclk, qspi_cs1_grp, spi0_0_grp,
-   spi0_1_grp - spi0_2_grp, spi1_0_grp - spi1_3_grp, sdio0_0_grp - sdio0_2_grp,
+   qspi0_0_grp, qspi1_0_grp, qspi_fbclk, qspi_cs1_grp, spi0_0_grp - spi0_2_grp,
+   spi0_X_ssY (X=0..2, Y=0..2), spi1_0_grp - spi1_3_grp,
+   spi1_X_ssY (X=0..3, Y=0..2), sdio0_0_grp - sdio0_2_grp,
    sdio1_0_grp - sdio1_3_grp, sdio0_emio_wp, sdio0_emio_cd, sdio1_emio_wp,
    sdio1_emio_cd, smc0_nor, smc0_nor_cs1_grp, smc0_nor_addr25_grp, smc0_nand,
    can0_0_grp - can0_10_grp, can1_0_grp - can1_11_grp, uart0_0_grp - uart0_10_grp,
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 22280bd..bdf9e71 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -196,13 +196,35 @@ static const unsigned int qspi0_0_pins[] = {1, 2, 3, 4, 5, 6};
 static const unsigned int qspi1_0_pins[] = {9, 10, 11, 12, 13};
 static const unsigned int qspi_cs1_pins[] = {0};
 static const unsigned int qspi_fbclk_pins[] = {8};
-static const unsigned int spi0_0_pins[] = {16, 17, 18, 19, 20, 21};
-static const unsigned int spi0_1_pins[] = {28, 29, 30, 31, 32, 33};
-static const unsigned int spi0_2_pins[] = {40, 41, 42, 43, 44, 45};
-static const unsigned int spi1_0_pins[] = {10, 11, 12, 13, 14, 15};
-static const unsigned int spi1_1_pins[] = {22, 23, 24, 25, 26, 27};
-static const unsigned int spi1_2_pins[] = {34, 35, 36, 37, 38, 39};
-static const unsigned int spi1_3_pins[] = {46, 47, 48, 49, 40, 51};
+static const unsigned int spi0_0_pins[] = {16, 17, 21};
+static const unsigned int spi0_0_ss0_pins[] = {18};
+static const unsigned int spi0_0_ss1_pins[] = {19};
+static const unsigned int spi0_0_ss2_pins[] = {20,};
+static const unsigned int spi0_1_pins[] = {28, 29, 33};
+static const unsigned int spi0_1_ss0_pins[] = {30};
+static const unsigned int spi0_1_ss1_pins[] = {31};
+static const unsigned int spi0_1_ss2_pins[] = {32};
+static const unsigned int spi0_2_pins[] = {40, 41, 45};
+static const unsigned int spi0_2_ss0_pins[] = {42};
+static const unsigned int spi0_2_ss1_pins[] = {43};
+static const unsigned int spi0_2_ss2_pins[] = {44};
+static const unsigned int spi1_0_pins[] = {10, 11, 12};
+static const unsigned int spi1_0_ss0_pins[] = {13};
+static const unsigned int spi1_0_ss1_pins[] = {14};
+static const unsigned int spi1_0_ss2_pins[] = {15};
+static const unsigned int spi1_1_pins[] = {22, 23, 24};
+static const unsigned int spi1_1_ss0_pins[] = {25};
+static const unsigned int spi1_1_ss1_pins[] = {26};
+static const unsigned int spi1_1_ss2_pins[] = {27};
+static const unsigned int spi1_2_pins[] = {34, 35, 36};
+static const unsigned int spi1_2_ss0_pins[] = {37};
+static const unsigned int spi1_2_ss1_pins[] = {38};
+static const unsigned int spi1_2_ss2_pins[] = {39};
+static const unsigned int spi1_3_pins[] = {46, 47, 48, 49};
+static const unsigned int spi1_3_ss0_pins[] = {49};
+static const unsigned int spi1_3_ss1_pins[] = {50};
+static const unsigned int spi1_3_ss2_pins[] = {51};
+
 static const unsigned int sdio0_0_pins[] = {16, 17, 18, 19, 20, 21};
 static const unsigned int sdio0_1_pins[] = {28, 29, 30, 31, 32, 33};
 static const unsigned int sdio0_2_pins[] = {40, 41, 42, 43, 44, 45};
@@ -379,12 +401,33 @@ struct zynq_pctrl_group zynq_pctrl_groups[] = {
 	DEFINE_ZYNQ_PINCTRL_GRP(qspi_fbclk),
 	DEFINE_ZYNQ_PINCTRL_GRP(qspi_cs1),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi0_0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_0_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_0_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_0_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi0_1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_1_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_1_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_1_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi0_2),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_2_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_2_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi0_2_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi1_0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_0_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_0_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_0_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi1_1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_1_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_1_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_1_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi1_2),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_2_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_2_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_2_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(spi1_3),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_3_ss0),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_3_ss1),
+	DEFINE_ZYNQ_PINCTRL_GRP(spi1_3_ss2),
 	DEFINE_ZYNQ_PINCTRL_GRP(sdio0_0),
 	DEFINE_ZYNQ_PINCTRL_GRP(sdio0_1),
 	DEFINE_ZYNQ_PINCTRL_GRP(sdio0_2),
@@ -548,10 +591,20 @@ static const char * const qspi0_groups[] = {"qspi0_0_grp"};
 static const char * const qspi1_groups[] = {"qspi0_1_grp"};
 static const char * const qspi_fbclk_groups[] = {"qspi_fbclk_grp"};
 static const char * const qspi_cs1_groups[] = {"qspi_cs1_grp"};
-static const char * const spi0_groups[] = {"spi0_0_grp", "spi0_1_grp",
-					   "spi0_2_grp"};
-static const char * const spi1_groups[] = {"spi1_0_grp", "spi1_1_grp",
-					   "spi1_2_grp", "spi1_3_grp"};
+static const char * const spi0_groups[] = {"spi0_0_grp", "spi0_0_ss0_grp",
+					   "spi0_0_ss1_grp", "spi0_0_ss2_grp",
+					   "spi0_1_grp", "spi0_1_ss0_grp",
+					   "spi0_1_ss1_grp", "spi0_1_ss2_grp",
+					   "spi0_2_grp", "spi0_2_ss0_grp",
+					   "spi0_2_ss1_grp", "spi0_2_ss2_grp"};
+static const char * const spi1_groups[] = {"spi1_0_grp", "spi1_0_ss0_grp",
+					   "spi1_0_ss1_grp", "spi1_0_ss2_grp",
+					   "spi1_1_grp", "spi1_1_ss0_grp",
+					   "spi1_1_ss1_grp", "spi1_1_ss2_grp",
+					   "spi1_2_grp", "spi1_2_ss0_grp",
+					   "spi1_2_ss1_grp", "spi1_2_ss2_grp",
+					   "spi1_3_grp", "spi1_3_ss0_grp",
+					   "spi1_3_ss1_grp", "spi1_3_ss2_grp"};
 static const char * const sdio0_groups[] = {"sdio0_0_grp", "sdio0_1_grp",
 					    "sdio0_2_grp"};
 static const char * const sdio1_groups[] = {"sdio1_0_grp", "sdio1_1_grp",
-- 
1.7.10.4

