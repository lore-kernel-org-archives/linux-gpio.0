From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH] pinctrl: atlas7: support atlas7 step B changes
Date: Fri,  9 Oct 2015 06:31:18 +0000
Message-ID: <1444372278-3044-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:33437 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753828AbbJIGWo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2015 02:22:44 -0400
Received: by pacex6 with SMTP id ex6so77613975pac.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2015 23:22:44 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Wei Chen <Wei.Chen@csr.com>

The the pin groups and pin functions have been changed
in atlas7 step B soc. We have to update the driver
to support step B chip.

Changes:
1. add 5 jtag pins to IOC_TOP:
	"jtag_tdo", "jtag_tms","jtag_tck", "jtag_tdi", "jtag_trstn"
	these 5 pins can be mutiplex with other functions, so we
	have to conver these 5 pins in pinmux.
2. add pin groups for audio digmic, audio spdif, can transceiver
	en, can transceiver stb, i2s0, i2s1 and jtag.
3. serval pins can be located to more PADs:
	audio_uart0_urfs, audio_uart1_urfs, audio_uart2_urfs,
	audio_uart2_urxd, audio_uart2_usclk, audio_uart2_utfs,
	audio_uart2_utxd, can0_rxd, can0_txd, can1_rxd, can1_txd
	jtag_ntrst, jtag_swdiotms, jtag_tck, jtag_tdi, jtag_tdo,
	pw_cko0, pw_cko1, pw_i2s01, pw_pwm0, pw_pwm1, sd2_cdb,
	sd2_wpb, uart2_cts, uart2_rts, uart2_rxd, uart2_txd,
	uart3_cts, uart3_rts, uart3_rxd, uart3_txd, uart4_cts,
	uart4_rts, usb0_drvvbus, usb1_drvvbus.

Because of Changes#3, some functions should have more than one
pin groups. So we have to split the original pin group to serval
pin groups.

For example:
audio_uart0 has 5 pins, on STEPA, each of these 5 pins only has
one related PAD. But on STEPB, audio_uart0_urfs has 4 related
PAD.
So we place the 4 pins with one PAD into a single pin group:
	audio_uart0_basic_group.
and place urfs pin wtih different PADs to 4 different pin groups:
	audio_uart0_urfs_group0, ..., audio_uart0_urfs_group3

A full audio_uart0 pin group can be:
	pinctrl-0 = <&audio_uart0_basic_group &audio_uart0_urfs_group0>;
If audio_uart0 pin group encountered some confiction, we only have
to change the urfs group:
	pinctrl-0 = <&audio_uart0_basic_group &audio_uart0_urfs_group2>;

Signed-off-by: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 1828 +++++++++++++++++++++++++++------
 1 file changed, 1540 insertions(+), 288 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 0d24d9e..829018c 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -544,6 +544,11 @@ static const struct pinctrl_pin_desc atlas7_ioc_pads[] = {
 	PINCTRL_PIN(156, "lvds_tx0d1n"),
 	PINCTRL_PIN(157, "lvds_tx0d0p"),
 	PINCTRL_PIN(158, "lvds_tx0d0n"),
+	PINCTRL_PIN(159, "jtag_tdo"),
+	PINCTRL_PIN(160, "jtag_tms"),
+	PINCTRL_PIN(161, "jtag_tck"),
+	PINCTRL_PIN(162, "jtag_tdi"),
+	PINCTRL_PIN(163, "jtag_trstn"),
 };
 
 struct atlas7_pad_config atlas7_ioc_pad_confs[] = {
@@ -708,6 +713,11 @@ struct atlas7_pad_config atlas7_ioc_pad_confs[] = {
 	PADCONF(156, 7, 0x130, 0x270, -1, 0x480, 28, 14, 0, 7),
 	PADCONF(157, 7, 0x138, 0x278, -1, 0x480, 0, 0, 0, 8),
 	PADCONF(158, 7, 0x138, 0x278, -1, 0x480, 4, 2, 0, 9),
+	PADCONF(159, 5, 0x140, 0x280, 0x380, -1, 0, 0, 0, 0),
+	PADCONF(160, 6, 0x140, 0x280, 0x380, -1, 4, 2, 2, 0),
+	PADCONF(161, 5, 0x140, 0x280, 0x380, -1, 8, 4, 4, 0),
+	PADCONF(162, 6, 0x140, 0x280, 0x380, -1, 12, 6, 6, 0),
+	PADCONF(163, 6, 0x140, 0x280, 0x380, -1, 16, 8, 8, 0),
 };
 
 /* pin list of each pin group */
@@ -724,12 +734,15 @@ static const unsigned int sp_rgmii_gpio_pins[] = { 97, 98, 99, 100, 101, 102,
 		141, 142, 143, 144, 145, 146, 147, 148, };
 static const unsigned int lvds_gpio_pins[] = { 157, 158, 155, 156, 153, 154,
 		151, 152, 149, 150, };
-static const unsigned int uart_nand_gpio_pins[] = { 44, 43, 42, 41, 40, 39,
-		38, 37, 46, 47, 48, 49, 50, 52, 51, 45, 133, 134, 135, 136,
-		137, 138, 139, 140, };
+static const unsigned int jtag_uart_nand_gpio_pins[] = { 44, 43, 42, 41, 40,
+		39, 38, 37, 46, 47, 48, 49, 50, 52, 51, 45, 133, 134, 135,
+		136, 137, 138, 139, 140, 159, 160, 161, 162, 163, };
 static const unsigned int rtc_gpio_pins[] = { 0, 1, 2, 3, 4, 10, 11, 12, 13,
-		14, 15, 16, 17, };
+		14, 15, 16, 17, 9, };
 static const unsigned int audio_ac97_pins[] = { 113, 118, 115, 114, };
+static const unsigned int audio_digmic_pins0[] = { 51, };
+static const unsigned int audio_digmic_pins1[] = { 122, };
+static const unsigned int audio_digmic_pins2[] = { 161, };
 static const unsigned int audio_func_dbg_pins[] = { 141, 144, 44, 43, 42, 41,
 		40, 39, 38, 37, 74, 75, 76, 77, 78, 79, 81, 113, 114, 118,
 		115, 49, 50, 142, 143, 80, };
@@ -737,16 +750,49 @@ static const unsigned int audio_i2s_pins[] = { 118, 115, 116, 117, 112, 113,
 		114, };
 static const unsigned int audio_i2s_2ch_pins[] = { 118, 115, 112, 113, 114, };
 static const unsigned int audio_i2s_extclk_pins[] = { 112, };
-static const unsigned int audio_uart0_pins[] = { 143, 142, 141, 144, };
-static const unsigned int audio_uart1_pins[] = { 147, 146, 145, 148, };
-static const unsigned int audio_uart2_pins0[] = { 20, 21, 19, 18, };
-static const unsigned int audio_uart2_pins1[] = { 109, 110, 101, 111, };
-static const unsigned int c_can_trnsvr_pins[] = { 1, };
-static const unsigned int c0_can_pins0[] = { 11, 10, };
-static const unsigned int c0_can_pins1[] = { 2, 3, };
-static const unsigned int c1_can_pins0[] = { 138, 137, };
-static const unsigned int c1_can_pins1[] = { 147, 146, };
-static const unsigned int c1_can_pins2[] = { 2, 3, };
+static const unsigned int audio_spdif_out_pins0[] = { 112, };
+static const unsigned int audio_spdif_out_pins1[] = { 116, };
+static const unsigned int audio_spdif_out_pins2[] = { 142, };
+static const unsigned int audio_uart0_basic_pins[] = { 143, 142, 141, 144, };
+static const unsigned int audio_uart0_urfs_pins0[] = { 117, };
+static const unsigned int audio_uart0_urfs_pins1[] = { 139, };
+static const unsigned int audio_uart0_urfs_pins2[] = { 163, };
+static const unsigned int audio_uart0_urfs_pins3[] = { 162, };
+static const unsigned int audio_uart1_basic_pins[] = { 147, 146, 145, 148, };
+static const unsigned int audio_uart1_urfs_pins0[] = { 117, };
+static const unsigned int audio_uart1_urfs_pins1[] = { 140, };
+static const unsigned int audio_uart1_urfs_pins2[] = { 163, };
+static const unsigned int audio_uart2_urfs_pins0[] = { 139, };
+static const unsigned int audio_uart2_urfs_pins1[] = { 163, };
+static const unsigned int audio_uart2_urfs_pins2[] = { 96, };
+static const unsigned int audio_uart2_urxd_pins0[] = { 20, };
+static const unsigned int audio_uart2_urxd_pins1[] = { 109, };
+static const unsigned int audio_uart2_urxd_pins2[] = { 93, };
+static const unsigned int audio_uart2_usclk_pins0[] = { 19, };
+static const unsigned int audio_uart2_usclk_pins1[] = { 101, };
+static const unsigned int audio_uart2_usclk_pins2[] = { 91, };
+static const unsigned int audio_uart2_utfs_pins0[] = { 18, };
+static const unsigned int audio_uart2_utfs_pins1[] = { 111, };
+static const unsigned int audio_uart2_utfs_pins2[] = { 94, };
+static const unsigned int audio_uart2_utxd_pins0[] = { 21, };
+static const unsigned int audio_uart2_utxd_pins1[] = { 110, };
+static const unsigned int audio_uart2_utxd_pins2[] = { 92, };
+static const unsigned int c_can_trnsvr_en_pins0[] = { 2, };
+static const unsigned int c_can_trnsvr_en_pins1[] = { 0, };
+static const unsigned int c_can_trnsvr_intr_pins[] = { 1, };
+static const unsigned int c_can_trnsvr_stb_n_pins[] = { 3, };
+static const unsigned int c0_can_rxd_trnsv0_pins[] = { 11, };
+static const unsigned int c0_can_rxd_trnsv1_pins[] = { 2, };
+static const unsigned int c0_can_txd_trnsv0_pins[] = { 10, };
+static const unsigned int c0_can_txd_trnsv1_pins[] = { 3, };
+static const unsigned int c1_can_rxd_pins0[] = { 138, };
+static const unsigned int c1_can_rxd_pins1[] = { 147, };
+static const unsigned int c1_can_rxd_pins2[] = { 2, };
+static const unsigned int c1_can_rxd_pins3[] = { 162, };
+static const unsigned int c1_can_txd_pins0[] = { 137, };
+static const unsigned int c1_can_txd_pins1[] = { 146, };
+static const unsigned int c1_can_txd_pins2[] = { 3, };
+static const unsigned int c1_can_txd_pins3[] = { 161, };
 static const unsigned int ca_audio_lpc_pins[] = { 62, 63, 64, 65, 66, 67, 68,
 		69, 70, 71, };
 static const unsigned int ca_bt_lpc_pins[] = { 85, 86, 87, 88, 89, 90, };
@@ -804,7 +850,29 @@ static const unsigned int gn_trg_shutdown_pins2[] = { 117, };
 static const unsigned int gn_trg_shutdown_pins3[] = { 123, };
 static const unsigned int i2c0_pins[] = { 128, 127, };
 static const unsigned int i2c1_pins[] = { 126, 125, };
-static const unsigned int jtag_pins0[] = { 125, 4, 2, 0, 1, 3, };
+static const unsigned int i2s0_pins[] = { 91, 93, 94, 92, };
+static const unsigned int i2s1_basic_pins[] = { 95, 96, };
+static const unsigned int i2s1_rxd0_pins0[] = { 61, };
+static const unsigned int i2s1_rxd0_pins1[] = { 131, };
+static const unsigned int i2s1_rxd0_pins2[] = { 129, };
+static const unsigned int i2s1_rxd0_pins3[] = { 117, };
+static const unsigned int i2s1_rxd0_pins4[] = { 83, };
+static const unsigned int i2s1_rxd1_pins0[] = { 72, };
+static const unsigned int i2s1_rxd1_pins1[] = { 132, };
+static const unsigned int i2s1_rxd1_pins2[] = { 130, };
+static const unsigned int i2s1_rxd1_pins3[] = { 118, };
+static const unsigned int i2s1_rxd1_pins4[] = { 84, };
+static const unsigned int jtag_jt_dbg_nsrst_pins[] = { 125, };
+static const unsigned int jtag_ntrst_pins0[] = { 4, };
+static const unsigned int jtag_ntrst_pins1[] = { 163, };
+static const unsigned int jtag_swdiotms_pins0[] = { 2, };
+static const unsigned int jtag_swdiotms_pins1[] = { 160, };
+static const unsigned int jtag_tck_pins0[] = { 0, };
+static const unsigned int jtag_tck_pins1[] = { 161, };
+static const unsigned int jtag_tdi_pins0[] = { 1, };
+static const unsigned int jtag_tdi_pins1[] = { 162, };
+static const unsigned int jtag_tdo_pins0[] = { 3, };
+static const unsigned int jtag_tdo_pins1[] = { 159, };
 static const unsigned int ks_kas_spi_pins0[] = { 141, 144, 143, 142, };
 static const unsigned int ld_ldd_pins[] = { 57, 58, 59, 60, 61, 62, 63, 64,
 		65, 66, 67, 68, 69, 70, 71, 72, 74, 75, 76, 77, 78, 79, 80,
@@ -821,7 +889,7 @@ static const unsigned int nd_df_pins[] = { 44, 43, 42, 41, 40, 39, 38, 37,
 		47, 46, 52, 51, 45, 49, 50, 48, 124, };
 static const unsigned int nd_df_nowp_pins[] = { 44, 43, 42, 41, 40, 39, 38,
 		37, 47, 46, 52, 51, 45, 49, 50, 48, };
-static const unsigned int ps_pins[] = { 120, 119, };
+static const unsigned int ps_pins[] = { 120, 119, 121, };
 static const unsigned int pwc_core_on_pins[] = { 8, };
 static const unsigned int pwc_ext_on_pins[] = { 6, };
 static const unsigned int pwc_gpio3_clk_pins[] = { 3, };
@@ -836,18 +904,26 @@ static const unsigned int pwc_wakeup_src3_pins[] = { 3, };
 static const unsigned int pw_cko0_pins0[] = { 123, };
 static const unsigned int pw_cko0_pins1[] = { 101, };
 static const unsigned int pw_cko0_pins2[] = { 82, };
+static const unsigned int pw_cko0_pins3[] = { 162, };
 static const unsigned int pw_cko1_pins0[] = { 124, };
 static const unsigned int pw_cko1_pins1[] = { 110, };
+static const unsigned int pw_cko1_pins2[] = { 163, };
 static const unsigned int pw_i2s01_clk_pins0[] = { 125, };
 static const unsigned int pw_i2s01_clk_pins1[] = { 117, };
-static const unsigned int pw_pwm0_pins[] = { 119, };
-static const unsigned int pw_pwm1_pins[] = { 120, };
+static const unsigned int pw_i2s01_clk_pins2[] = { 132, };
+static const unsigned int pw_pwm0_pins0[] = { 119, };
+static const unsigned int pw_pwm0_pins1[] = { 159, };
+static const unsigned int pw_pwm1_pins0[] = { 120, };
+static const unsigned int pw_pwm1_pins1[] = { 160, };
+static const unsigned int pw_pwm1_pins2[] = { 131, };
 static const unsigned int pw_pwm2_pins0[] = { 121, };
 static const unsigned int pw_pwm2_pins1[] = { 98, };
+static const unsigned int pw_pwm2_pins2[] = { 161, };
 static const unsigned int pw_pwm3_pins0[] = { 122, };
 static const unsigned int pw_pwm3_pins1[] = { 73, };
 static const unsigned int pw_pwm_cpu_vol_pins0[] = { 121, };
 static const unsigned int pw_pwm_cpu_vol_pins1[] = { 98, };
+static const unsigned int pw_pwm_cpu_vol_pins2[] = { 161, };
 static const unsigned int pw_backlight_pins0[] = { 122, };
 static const unsigned int pw_backlight_pins1[] = { 73, };
 static const unsigned int rg_eth_mac_pins[] = { 108, 103, 104, 105, 106, 107,
@@ -863,8 +939,11 @@ static const unsigned int sd1_pins[] = { 48, 49, 44, 43, 42, 41, 40, 39, 38,
 		37, };
 static const unsigned int sd1_4bit_pins0[] = { 48, 49, 44, 43, 42, 41, };
 static const unsigned int sd1_4bit_pins1[] = { 48, 49, 40, 39, 38, 37, };
-static const unsigned int sd2_pins0[] = { 124, 31, 32, 33, 34, 35, 36, 123, };
-static const unsigned int sd2_no_cdb_pins0[] = { 31, 32, 33, 34, 35, 36, 123, };
+static const unsigned int sd2_basic_pins[] = { 31, 32, 33, 34, 35, 36, };
+static const unsigned int sd2_cdb_pins0[] = { 124, };
+static const unsigned int sd2_cdb_pins1[] = { 161, };
+static const unsigned int sd2_wpb_pins0[] = { 123, };
+static const unsigned int sd2_wpb_pins1[] = { 163, };
 static const unsigned int sd3_pins[] = { 85, 86, 87, 88, 89, 90, };
 static const unsigned int sd5_pins[] = { 91, 92, 93, 94, 95, 96, };
 static const unsigned int sd6_pins0[] = { 79, 78, 74, 75, 76, 77, };
@@ -877,19 +956,39 @@ static const unsigned int tpiu_trace_pins[] = { 53, 56, 57, 58, 59, 60, 61,
 static const unsigned int uart0_pins[] = { 121, 120, 134, 133, };
 static const unsigned int uart0_nopause_pins[] = { 134, 133, };
 static const unsigned int uart1_pins[] = { 136, 135, };
-static const unsigned int uart2_pins[] = { 11, 10, };
-static const unsigned int uart3_pins0[] = { 125, 126, 138, 137, };
-static const unsigned int uart3_pins1[] = { 111, 109, 84, 83, };
-static const unsigned int uart3_pins2[] = { 140, 139, 138, 137, };
-static const unsigned int uart3_pins3[] = { 139, 140, 84, 83, };
-static const unsigned int uart3_nopause_pins0[] = { 138, 137, };
-static const unsigned int uart3_nopause_pins1[] = { 84, 83, };
-static const unsigned int uart4_pins0[] = { 122, 123, 140, 139, };
-static const unsigned int uart4_pins1[] = { 100, 99, 140, 139, };
-static const unsigned int uart4_pins2[] = { 117, 116, 140, 139, };
-static const unsigned int uart4_nopause_pins[] = { 140, 139, };
-static const unsigned int usb0_drvvbus_pins[] = { 51, };
-static const unsigned int usb1_drvvbus_pins[] = { 134, };
+static const unsigned int uart2_cts_pins0[] = { 132, };
+static const unsigned int uart2_cts_pins1[] = { 162, };
+static const unsigned int uart2_rts_pins0[] = { 131, };
+static const unsigned int uart2_rts_pins1[] = { 161, };
+static const unsigned int uart2_rxd_pins0[] = { 11, };
+static const unsigned int uart2_rxd_pins1[] = { 160, };
+static const unsigned int uart2_rxd_pins2[] = { 130, };
+static const unsigned int uart2_txd_pins0[] = { 10, };
+static const unsigned int uart2_txd_pins1[] = { 159, };
+static const unsigned int uart2_txd_pins2[] = { 129, };
+static const unsigned int uart3_cts_pins0[] = { 125, };
+static const unsigned int uart3_cts_pins1[] = { 111, };
+static const unsigned int uart3_cts_pins2[] = { 140, };
+static const unsigned int uart3_rts_pins0[] = { 126, };
+static const unsigned int uart3_rts_pins1[] = { 109, };
+static const unsigned int uart3_rts_pins2[] = { 139, };
+static const unsigned int uart3_rxd_pins0[] = { 138, };
+static const unsigned int uart3_rxd_pins1[] = { 84, };
+static const unsigned int uart3_rxd_pins2[] = { 162, };
+static const unsigned int uart3_txd_pins0[] = { 137, };
+static const unsigned int uart3_txd_pins1[] = { 83, };
+static const unsigned int uart3_txd_pins2[] = { 161, };
+static const unsigned int uart4_basic_pins[] = { 140, 139, };
+static const unsigned int uart4_cts_pins0[] = { 122, };
+static const unsigned int uart4_cts_pins1[] = { 100, };
+static const unsigned int uart4_cts_pins2[] = { 117, };
+static const unsigned int uart4_rts_pins0[] = { 123, };
+static const unsigned int uart4_rts_pins1[] = { 99, };
+static const unsigned int uart4_rts_pins2[] = { 116, };
+static const unsigned int usb0_drvvbus_pins0[] = { 51, };
+static const unsigned int usb0_drvvbus_pins1[] = { 162, };
+static const unsigned int usb1_drvvbus_pins0[] = { 134, };
+static const unsigned int usb1_drvvbus_pins1[] = { 163, };
 static const unsigned int visbus_dout_pins[] = { 57, 58, 59, 60, 61, 62, 63,
 		64, 65, 66, 67, 68, 69, 70, 71, 72, 53, 54, 55, 56, 85, 86,
 		87, 88, 89, 90, 91, 92, 93, 94, 95, 96, };
@@ -910,23 +1009,59 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("sdio_i2s_gpio_grp", sdio_i2s_gpio_pins),
 	GROUP("sp_rgmii_gpio_grp", sp_rgmii_gpio_pins),
 	GROUP("lvds_gpio_grp", lvds_gpio_pins),
-	GROUP("uart_nand_gpio_grp", uart_nand_gpio_pins),
+	GROUP("jtag_uart_nand_gpio_grp", jtag_uart_nand_gpio_pins),
 	GROUP("rtc_gpio_grp", rtc_gpio_pins),
 	GROUP("audio_ac97_grp", audio_ac97_pins),
+	GROUP("audio_digmic_grp0", audio_digmic_pins0),
+	GROUP("audio_digmic_grp1", audio_digmic_pins1),
+	GROUP("audio_digmic_grp2", audio_digmic_pins2),
 	GROUP("audio_func_dbg_grp", audio_func_dbg_pins),
 	GROUP("audio_i2s_grp", audio_i2s_pins),
 	GROUP("audio_i2s_2ch_grp", audio_i2s_2ch_pins),
 	GROUP("audio_i2s_extclk_grp", audio_i2s_extclk_pins),
-	GROUP("audio_uart0_grp", audio_uart0_pins),
-	GROUP("audio_uart1_grp", audio_uart1_pins),
-	GROUP("audio_uart2_grp0", audio_uart2_pins0),
-	GROUP("audio_uart2_grp1", audio_uart2_pins1),
-	GROUP("c_can_trnsvr_grp", c_can_trnsvr_pins),
-	GROUP("c0_can_grp0", c0_can_pins0),
-	GROUP("c0_can_grp1", c0_can_pins1),
-	GROUP("c1_can_grp0", c1_can_pins0),
-	GROUP("c1_can_grp1", c1_can_pins1),
-	GROUP("c1_can_grp2", c1_can_pins2),
+	GROUP("audio_spdif_out_grp0", audio_spdif_out_pins0),
+	GROUP("audio_spdif_out_grp1", audio_spdif_out_pins1),
+	GROUP("audio_spdif_out_grp2", audio_spdif_out_pins2),
+	GROUP("audio_uart0_basic_grp", audio_uart0_basic_pins),
+	GROUP("audio_uart0_urfs_grp0", audio_uart0_urfs_pins0),
+	GROUP("audio_uart0_urfs_grp1", audio_uart0_urfs_pins1),
+	GROUP("audio_uart0_urfs_grp2", audio_uart0_urfs_pins2),
+	GROUP("audio_uart0_urfs_grp3", audio_uart0_urfs_pins3),
+	GROUP("audio_uart1_basic_grp", audio_uart1_basic_pins),
+	GROUP("audio_uart1_urfs_grp0", audio_uart1_urfs_pins0),
+	GROUP("audio_uart1_urfs_grp1", audio_uart1_urfs_pins1),
+	GROUP("audio_uart1_urfs_grp2", audio_uart1_urfs_pins2),
+	GROUP("audio_uart2_urfs_grp0", audio_uart2_urfs_pins0),
+	GROUP("audio_uart2_urfs_grp1", audio_uart2_urfs_pins1),
+	GROUP("audio_uart2_urfs_grp2", audio_uart2_urfs_pins2),
+	GROUP("audio_uart2_urxd_grp0", audio_uart2_urxd_pins0),
+	GROUP("audio_uart2_urxd_grp1", audio_uart2_urxd_pins1),
+	GROUP("audio_uart2_urxd_grp2", audio_uart2_urxd_pins2),
+	GROUP("audio_uart2_usclk_grp0", audio_uart2_usclk_pins0),
+	GROUP("audio_uart2_usclk_grp1", audio_uart2_usclk_pins1),
+	GROUP("audio_uart2_usclk_grp2", audio_uart2_usclk_pins2),
+	GROUP("audio_uart2_utfs_grp0", audio_uart2_utfs_pins0),
+	GROUP("audio_uart2_utfs_grp1", audio_uart2_utfs_pins1),
+	GROUP("audio_uart2_utfs_grp2", audio_uart2_utfs_pins2),
+	GROUP("audio_uart2_utxd_grp0", audio_uart2_utxd_pins0),
+	GROUP("audio_uart2_utxd_grp1", audio_uart2_utxd_pins1),
+	GROUP("audio_uart2_utxd_grp2", audio_uart2_utxd_pins2),
+	GROUP("c_can_trnsvr_en_grp0", c_can_trnsvr_en_pins0),
+	GROUP("c_can_trnsvr_en_grp1", c_can_trnsvr_en_pins1),
+	GROUP("c_can_trnsvr_intr_grp", c_can_trnsvr_intr_pins),
+	GROUP("c_can_trnsvr_stb_n_grp", c_can_trnsvr_stb_n_pins),
+	GROUP("c0_can_rxd_trnsv0_grp", c0_can_rxd_trnsv0_pins),
+	GROUP("c0_can_rxd_trnsv1_grp", c0_can_rxd_trnsv1_pins),
+	GROUP("c0_can_txd_trnsv0_grp", c0_can_txd_trnsv0_pins),
+	GROUP("c0_can_txd_trnsv1_grp", c0_can_txd_trnsv1_pins),
+	GROUP("c1_can_rxd_grp0", c1_can_rxd_pins0),
+	GROUP("c1_can_rxd_grp1", c1_can_rxd_pins1),
+	GROUP("c1_can_rxd_grp2", c1_can_rxd_pins2),
+	GROUP("c1_can_rxd_grp3", c1_can_rxd_pins3),
+	GROUP("c1_can_txd_grp0", c1_can_txd_pins0),
+	GROUP("c1_can_txd_grp1", c1_can_txd_pins1),
+	GROUP("c1_can_txd_grp2", c1_can_txd_pins2),
+	GROUP("c1_can_txd_grp3", c1_can_txd_pins3),
 	GROUP("ca_audio_lpc_grp", ca_audio_lpc_pins),
 	GROUP("ca_bt_lpc_grp", ca_bt_lpc_pins),
 	GROUP("ca_coex_grp", ca_coex_pins),
@@ -977,7 +1112,29 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("gn_trg_shutdown_grp3", gn_trg_shutdown_pins3),
 	GROUP("i2c0_grp", i2c0_pins),
 	GROUP("i2c1_grp", i2c1_pins),
-	GROUP("jtag_grp0", jtag_pins0),
+	GROUP("i2s0_grp", i2s0_pins),
+	GROUP("i2s1_basic_grp", i2s1_basic_pins),
+	GROUP("i2s1_rxd0_grp0", i2s1_rxd0_pins0),
+	GROUP("i2s1_rxd0_grp1", i2s1_rxd0_pins1),
+	GROUP("i2s1_rxd0_grp2", i2s1_rxd0_pins2),
+	GROUP("i2s1_rxd0_grp3", i2s1_rxd0_pins3),
+	GROUP("i2s1_rxd0_grp4", i2s1_rxd0_pins4),
+	GROUP("i2s1_rxd1_grp0", i2s1_rxd1_pins0),
+	GROUP("i2s1_rxd1_grp1", i2s1_rxd1_pins1),
+	GROUP("i2s1_rxd1_grp2", i2s1_rxd1_pins2),
+	GROUP("i2s1_rxd1_grp3", i2s1_rxd1_pins3),
+	GROUP("i2s1_rxd1_grp4", i2s1_rxd1_pins4),
+	GROUP("jtag_jt_dbg_nsrst_grp", jtag_jt_dbg_nsrst_pins),
+	GROUP("jtag_ntrst_grp0", jtag_ntrst_pins0),
+	GROUP("jtag_ntrst_grp1", jtag_ntrst_pins1),
+	GROUP("jtag_swdiotms_grp0", jtag_swdiotms_pins0),
+	GROUP("jtag_swdiotms_grp1", jtag_swdiotms_pins1),
+	GROUP("jtag_tck_grp0", jtag_tck_pins0),
+	GROUP("jtag_tck_grp1", jtag_tck_pins1),
+	GROUP("jtag_tdi_grp0", jtag_tdi_pins0),
+	GROUP("jtag_tdi_grp1", jtag_tdi_pins1),
+	GROUP("jtag_tdo_grp0", jtag_tdo_pins0),
+	GROUP("jtag_tdo_grp1", jtag_tdo_pins1),
 	GROUP("ks_kas_spi_grp0", ks_kas_spi_pins0),
 	GROUP("ld_ldd_grp", ld_ldd_pins),
 	GROUP("ld_ldd_16bit_grp", ld_ldd_16bit_pins),
@@ -1002,18 +1159,26 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("pw_cko0_grp0", pw_cko0_pins0),
 	GROUP("pw_cko0_grp1", pw_cko0_pins1),
 	GROUP("pw_cko0_grp2", pw_cko0_pins2),
+	GROUP("pw_cko0_grp3", pw_cko0_pins3),
 	GROUP("pw_cko1_grp0", pw_cko1_pins0),
 	GROUP("pw_cko1_grp1", pw_cko1_pins1),
+	GROUP("pw_cko1_grp2", pw_cko1_pins2),
 	GROUP("pw_i2s01_clk_grp0", pw_i2s01_clk_pins0),
 	GROUP("pw_i2s01_clk_grp1", pw_i2s01_clk_pins1),
-	GROUP("pw_pwm0_grp", pw_pwm0_pins),
-	GROUP("pw_pwm1_grp", pw_pwm1_pins),
+	GROUP("pw_i2s01_clk_grp2", pw_i2s01_clk_pins2),
+	GROUP("pw_pwm0_grp0", pw_pwm0_pins0),
+	GROUP("pw_pwm0_grp1", pw_pwm0_pins1),
+	GROUP("pw_pwm1_grp0", pw_pwm1_pins0),
+	GROUP("pw_pwm1_grp1", pw_pwm1_pins1),
+	GROUP("pw_pwm1_grp2", pw_pwm1_pins2),
 	GROUP("pw_pwm2_grp0", pw_pwm2_pins0),
 	GROUP("pw_pwm2_grp1", pw_pwm2_pins1),
+	GROUP("pw_pwm2_grp2", pw_pwm2_pins2),
 	GROUP("pw_pwm3_grp0", pw_pwm3_pins0),
 	GROUP("pw_pwm3_grp1", pw_pwm3_pins1),
 	GROUP("pw_pwm_cpu_vol_grp0", pw_pwm_cpu_vol_pins0),
 	GROUP("pw_pwm_cpu_vol_grp1", pw_pwm_cpu_vol_pins1),
+	GROUP("pw_pwm_cpu_vol_grp2", pw_pwm_cpu_vol_pins2),
 	GROUP("pw_backlight_grp0", pw_backlight_pins0),
 	GROUP("pw_backlight_grp1", pw_backlight_pins1),
 	GROUP("rg_eth_mac_grp", rg_eth_mac_pins),
@@ -1026,8 +1191,11 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("sd1_grp", sd1_pins),
 	GROUP("sd1_4bit_grp0", sd1_4bit_pins0),
 	GROUP("sd1_4bit_grp1", sd1_4bit_pins1),
-	GROUP("sd2_grp0", sd2_pins0),
-	GROUP("sd2_no_cdb_grp0", sd2_no_cdb_pins0),
+	GROUP("sd2_basic_grp", sd2_basic_pins),
+	GROUP("sd2_cdb_grp0", sd2_cdb_pins0),
+	GROUP("sd2_cdb_grp1", sd2_cdb_pins1),
+	GROUP("sd2_wpb_grp0", sd2_wpb_pins0),
+	GROUP("sd2_wpb_grp1", sd2_wpb_pins1),
 	GROUP("sd3_grp", sd3_pins),
 	GROUP("sd5_grp", sd5_pins),
 	GROUP("sd6_grp0", sd6_pins0),
@@ -1039,19 +1207,39 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("uart0_grp", uart0_pins),
 	GROUP("uart0_nopause_grp", uart0_nopause_pins),
 	GROUP("uart1_grp", uart1_pins),
-	GROUP("uart2_grp", uart2_pins),
-	GROUP("uart3_grp0", uart3_pins0),
-	GROUP("uart3_grp1", uart3_pins1),
-	GROUP("uart3_grp2", uart3_pins2),
-	GROUP("uart3_grp3", uart3_pins3),
-	GROUP("uart3_nopause_grp0", uart3_nopause_pins0),
-	GROUP("uart3_nopause_grp1", uart3_nopause_pins1),
-	GROUP("uart4_grp0", uart4_pins0),
-	GROUP("uart4_grp1", uart4_pins1),
-	GROUP("uart4_grp2", uart4_pins2),
-	GROUP("uart4_nopause_grp", uart4_nopause_pins),
-	GROUP("usb0_drvvbus_grp", usb0_drvvbus_pins),
-	GROUP("usb1_drvvbus_grp", usb1_drvvbus_pins),
+	GROUP("uart2_cts_grp0", uart2_cts_pins0),
+	GROUP("uart2_cts_grp1", uart2_cts_pins1),
+	GROUP("uart2_rts_grp0", uart2_rts_pins0),
+	GROUP("uart2_rts_grp1", uart2_rts_pins1),
+	GROUP("uart2_rxd_grp0", uart2_rxd_pins0),
+	GROUP("uart2_rxd_grp1", uart2_rxd_pins1),
+	GROUP("uart2_rxd_grp2", uart2_rxd_pins2),
+	GROUP("uart2_txd_grp0", uart2_txd_pins0),
+	GROUP("uart2_txd_grp1", uart2_txd_pins1),
+	GROUP("uart2_txd_grp2", uart2_txd_pins2),
+	GROUP("uart3_cts_grp0", uart3_cts_pins0),
+	GROUP("uart3_cts_grp1", uart3_cts_pins1),
+	GROUP("uart3_cts_grp2", uart3_cts_pins2),
+	GROUP("uart3_rts_grp0", uart3_rts_pins0),
+	GROUP("uart3_rts_grp1", uart3_rts_pins1),
+	GROUP("uart3_rts_grp2", uart3_rts_pins2),
+	GROUP("uart3_rxd_grp0", uart3_rxd_pins0),
+	GROUP("uart3_rxd_grp1", uart3_rxd_pins1),
+	GROUP("uart3_rxd_grp2", uart3_rxd_pins2),
+	GROUP("uart3_txd_grp0", uart3_txd_pins0),
+	GROUP("uart3_txd_grp1", uart3_txd_pins1),
+	GROUP("uart3_txd_grp2", uart3_txd_pins2),
+	GROUP("uart4_basic_grp", uart4_basic_pins),
+	GROUP("uart4_cts_grp0", uart4_cts_pins0),
+	GROUP("uart4_cts_grp1", uart4_cts_pins1),
+	GROUP("uart4_cts_grp2", uart4_cts_pins2),
+	GROUP("uart4_rts_grp0", uart4_rts_pins0),
+	GROUP("uart4_rts_grp1", uart4_rts_pins1),
+	GROUP("uart4_rts_grp2", uart4_rts_pins2),
+	GROUP("usb0_drvvbus_grp0", usb0_drvvbus_pins0),
+	GROUP("usb0_drvvbus_grp1", usb0_drvvbus_pins1),
+	GROUP("usb1_drvvbus_grp0", usb1_drvvbus_pins0),
+	GROUP("usb1_drvvbus_grp1", usb1_drvvbus_pins1),
 	GROUP("visbus_dout_grp", visbus_dout_pins),
 	GROUP("vi_vip1_grp", vi_vip1_pins),
 	GROUP("vi_vip1_ext_grp", vi_vip1_ext_pins),
@@ -1065,23 +1253,90 @@ static const char * const lcd_vip_gpio_grp[] = { "lcd_vip_gpio_grp", };
 static const char * const sdio_i2s_gpio_grp[] = { "sdio_i2s_gpio_grp", };
 static const char * const sp_rgmii_gpio_grp[] = { "sp_rgmii_gpio_grp", };
 static const char * const lvds_gpio_grp[] = { "lvds_gpio_grp", };
-static const char * const uart_nand_gpio_grp[] = { "uart_nand_gpio_grp", };
+static const char * const jtag_uart_nand_gpio_grp[] = {
+				"jtag_uart_nand_gpio_grp", };
 static const char * const rtc_gpio_grp[] = { "rtc_gpio_grp", };
 static const char * const audio_ac97_grp[] = { "audio_ac97_grp", };
+static const char * const audio_digmic_grp0[] = { "audio_digmic_grp0", };
+static const char * const audio_digmic_grp1[] = { "audio_digmic_grp1", };
+static const char * const audio_digmic_grp2[] = { "audio_digmic_grp2", };
 static const char * const audio_func_dbg_grp[] = { "audio_func_dbg_grp", };
 static const char * const audio_i2s_grp[] = { "audio_i2s_grp", };
 static const char * const audio_i2s_2ch_grp[] = { "audio_i2s_2ch_grp", };
 static const char * const audio_i2s_extclk_grp[] = { "audio_i2s_extclk_grp", };
-static const char * const audio_uart0_grp[] = { "audio_uart0_grp", };
-static const char * const audio_uart1_grp[] = { "audio_uart1_grp", };
-static const char * const audio_uart2_grp0[] = { "audio_uart2_grp0", };
-static const char * const audio_uart2_grp1[] = { "audio_uart2_grp1", };
-static const char * const c_can_trnsvr_grp[] = { "c_can_trnsvr_grp", };
-static const char * const c0_can_grp0[] = { "c0_can_grp0", };
-static const char * const c0_can_grp1[] = { "c0_can_grp1", };
-static const char * const c1_can_grp0[] = { "c1_can_grp0", };
-static const char * const c1_can_grp1[] = { "c1_can_grp1", };
-static const char * const c1_can_grp2[] = { "c1_can_grp2", };
+static const char * const audio_spdif_out_grp0[] = { "audio_spdif_out_grp0", };
+static const char * const audio_spdif_out_grp1[] = { "audio_spdif_out_grp1", };
+static const char * const audio_spdif_out_grp2[] = { "audio_spdif_out_grp2", };
+static const char * const audio_uart0_basic_grp[] = {
+				"audio_uart0_basic_grp", };
+static const char * const audio_uart0_urfs_grp0[] = {
+				"audio_uart0_urfs_grp0", };
+static const char * const audio_uart0_urfs_grp1[] = {
+				"audio_uart0_urfs_grp1", };
+static const char * const audio_uart0_urfs_grp2[] = {
+				"audio_uart0_urfs_grp2", };
+static const char * const audio_uart0_urfs_grp3[] = {
+				"audio_uart0_urfs_grp3", };
+static const char * const audio_uart1_basic_grp[] = {
+				"audio_uart1_basic_grp", };
+static const char * const audio_uart1_urfs_grp0[] = {
+				"audio_uart1_urfs_grp0", };
+static const char * const audio_uart1_urfs_grp1[] = {
+				"audio_uart1_urfs_grp1", };
+static const char * const audio_uart1_urfs_grp2[] = {
+				"audio_uart1_urfs_grp2", };
+static const char * const audio_uart2_urfs_grp0[] = {
+				"audio_uart2_urfs_grp0", };
+static const char * const audio_uart2_urfs_grp1[] = {
+				"audio_uart2_urfs_grp1", };
+static const char * const audio_uart2_urfs_grp2[] = {
+				"audio_uart2_urfs_grp2", };
+static const char * const audio_uart2_urxd_grp0[] = {
+				"audio_uart2_urxd_grp0", };
+static const char * const audio_uart2_urxd_grp1[] = {
+				"audio_uart2_urxd_grp1", };
+static const char * const audio_uart2_urxd_grp2[] = {
+				"audio_uart2_urxd_grp2", };
+static const char * const audio_uart2_usclk_grp0[] = {
+				"audio_uart2_usclk_grp0", };
+static const char * const audio_uart2_usclk_grp1[] = {
+				"audio_uart2_usclk_grp1", };
+static const char * const audio_uart2_usclk_grp2[] = {
+				"audio_uart2_usclk_grp2", };
+static const char * const audio_uart2_utfs_grp0[] = {
+				"audio_uart2_utfs_grp0", };
+static const char * const audio_uart2_utfs_grp1[] = {
+				"audio_uart2_utfs_grp1", };
+static const char * const audio_uart2_utfs_grp2[] = {
+				"audio_uart2_utfs_grp2", };
+static const char * const audio_uart2_utxd_grp0[] = {
+				"audio_uart2_utxd_grp0", };
+static const char * const audio_uart2_utxd_grp1[] = {
+				"audio_uart2_utxd_grp1", };
+static const char * const audio_uart2_utxd_grp2[] = {
+				"audio_uart2_utxd_grp2", };
+static const char * const c_can_trnsvr_en_grp0[] = { "c_can_trnsvr_en_grp0", };
+static const char * const c_can_trnsvr_en_grp1[] = { "c_can_trnsvr_en_grp1", };
+static const char * const c_can_trnsvr_intr_grp[] = {
+				"c_can_trnsvr_intr_grp", };
+static const char * const c_can_trnsvr_stb_n_grp[] = {
+				"c_can_trnsvr_stb_n_grp", };
+static const char * const c0_can_rxd_trnsv0_grp[] = {
+				"c0_can_rxd_trnsv0_grp", };
+static const char * const c0_can_rxd_trnsv1_grp[] = {
+				"c0_can_rxd_trnsv1_grp", };
+static const char * const c0_can_txd_trnsv0_grp[] = {
+				"c0_can_txd_trnsv0_grp", };
+static const char * const c0_can_txd_trnsv1_grp[] = {
+				"c0_can_txd_trnsv1_grp", };
+static const char * const c1_can_rxd_grp0[] = { "c1_can_rxd_grp0", };
+static const char * const c1_can_rxd_grp1[] = { "c1_can_rxd_grp1", };
+static const char * const c1_can_rxd_grp2[] = { "c1_can_rxd_grp2", };
+static const char * const c1_can_rxd_grp3[] = { "c1_can_rxd_grp3", };
+static const char * const c1_can_txd_grp0[] = { "c1_can_txd_grp0", };
+static const char * const c1_can_txd_grp1[] = { "c1_can_txd_grp1", };
+static const char * const c1_can_txd_grp2[] = { "c1_can_txd_grp2", };
+static const char * const c1_can_txd_grp3[] = { "c1_can_txd_grp3", };
 static const char * const ca_audio_lpc_grp[] = { "ca_audio_lpc_grp", };
 static const char * const ca_bt_lpc_grp[] = { "ca_bt_lpc_grp", };
 static const char * const ca_coex_grp[] = { "ca_coex_grp", };
@@ -1135,7 +1390,30 @@ static const char * const gn_trg_shutdown_grp2[] = { "gn_trg_shutdown_grp2", };
 static const char * const gn_trg_shutdown_grp3[] = { "gn_trg_shutdown_grp3", };
 static const char * const i2c0_grp[] = { "i2c0_grp", };
 static const char * const i2c1_grp[] = { "i2c1_grp", };
-static const char * const jtag_grp0[] = { "jtag_grp0", };
+static const char * const i2s0_grp[] = { "i2s0_grp", };
+static const char * const i2s1_basic_grp[] = { "i2s1_basic_grp", };
+static const char * const i2s1_rxd0_grp0[] = { "i2s1_rxd0_grp0", };
+static const char * const i2s1_rxd0_grp1[] = { "i2s1_rxd0_grp1", };
+static const char * const i2s1_rxd0_grp2[] = { "i2s1_rxd0_grp2", };
+static const char * const i2s1_rxd0_grp3[] = { "i2s1_rxd0_grp3", };
+static const char * const i2s1_rxd0_grp4[] = { "i2s1_rxd0_grp4", };
+static const char * const i2s1_rxd1_grp0[] = { "i2s1_rxd1_grp0", };
+static const char * const i2s1_rxd1_grp1[] = { "i2s1_rxd1_grp1", };
+static const char * const i2s1_rxd1_grp2[] = { "i2s1_rxd1_grp2", };
+static const char * const i2s1_rxd1_grp3[] = { "i2s1_rxd1_grp3", };
+static const char * const i2s1_rxd1_grp4[] = { "i2s1_rxd1_grp4", };
+static const char * const jtag_jt_dbg_nsrst_grp[] = {
+				"jtag_jt_dbg_nsrst_grp", };
+static const char * const jtag_ntrst_grp0[] = { "jtag_ntrst_grp0", };
+static const char * const jtag_ntrst_grp1[] = { "jtag_ntrst_grp1", };
+static const char * const jtag_swdiotms_grp0[] = { "jtag_swdiotms_grp0", };
+static const char * const jtag_swdiotms_grp1[] = { "jtag_swdiotms_grp1", };
+static const char * const jtag_tck_grp0[] = { "jtag_tck_grp0", };
+static const char * const jtag_tck_grp1[] = { "jtag_tck_grp1", };
+static const char * const jtag_tdi_grp0[] = { "jtag_tdi_grp0", };
+static const char * const jtag_tdi_grp1[] = { "jtag_tdi_grp1", };
+static const char * const jtag_tdo_grp0[] = { "jtag_tdo_grp0", };
+static const char * const jtag_tdo_grp1[] = { "jtag_tdo_grp1", };
 static const char * const ks_kas_spi_grp0[] = { "ks_kas_spi_grp0", };
 static const char * const ld_ldd_grp[] = { "ld_ldd_grp", };
 static const char * const ld_ldd_16bit_grp[] = { "ld_ldd_16bit_grp", };
@@ -1160,18 +1438,26 @@ static const char * const pwc_wakeup_src3_grp[] = { "pwc_wakeup_src3_grp", };
 static const char * const pw_cko0_grp0[] = { "pw_cko0_grp0", };
 static const char * const pw_cko0_grp1[] = { "pw_cko0_grp1", };
 static const char * const pw_cko0_grp2[] = { "pw_cko0_grp2", };
+static const char * const pw_cko0_grp3[] = { "pw_cko0_grp3", };
 static const char * const pw_cko1_grp0[] = { "pw_cko1_grp0", };
 static const char * const pw_cko1_grp1[] = { "pw_cko1_grp1", };
+static const char * const pw_cko1_grp2[] = { "pw_cko1_grp2", };
 static const char * const pw_i2s01_clk_grp0[] = { "pw_i2s01_clk_grp0", };
 static const char * const pw_i2s01_clk_grp1[] = { "pw_i2s01_clk_grp1", };
-static const char * const pw_pwm0_grp[] = { "pw_pwm0_grp", };
-static const char * const pw_pwm1_grp[] = { "pw_pwm1_grp", };
+static const char * const pw_i2s01_clk_grp2[] = { "pw_i2s01_clk_grp2", };
+static const char * const pw_pwm0_grp0[] = { "pw_pwm0_grp0", };
+static const char * const pw_pwm0_grp1[] = { "pw_pwm0_grp1", };
+static const char * const pw_pwm1_grp0[] = { "pw_pwm1_grp0", };
+static const char * const pw_pwm1_grp1[] = { "pw_pwm1_grp1", };
+static const char * const pw_pwm1_grp2[] = { "pw_pwm1_grp2", };
 static const char * const pw_pwm2_grp0[] = { "pw_pwm2_grp0", };
 static const char * const pw_pwm2_grp1[] = { "pw_pwm2_grp1", };
+static const char * const pw_pwm2_grp2[] = { "pw_pwm2_grp2", };
 static const char * const pw_pwm3_grp0[] = { "pw_pwm3_grp0", };
 static const char * const pw_pwm3_grp1[] = { "pw_pwm3_grp1", };
 static const char * const pw_pwm_cpu_vol_grp0[] = { "pw_pwm_cpu_vol_grp0", };
 static const char * const pw_pwm_cpu_vol_grp1[] = { "pw_pwm_cpu_vol_grp1", };
+static const char * const pw_pwm_cpu_vol_grp2[] = { "pw_pwm_cpu_vol_grp2", };
 static const char * const pw_backlight_grp0[] = { "pw_backlight_grp0", };
 static const char * const pw_backlight_grp1[] = { "pw_backlight_grp1", };
 static const char * const rg_eth_mac_grp[] = { "rg_eth_mac_grp", };
@@ -1187,8 +1473,11 @@ static const char * const sd0_4bit_grp[] = { "sd0_4bit_grp", };
 static const char * const sd1_grp[] = { "sd1_grp", };
 static const char * const sd1_4bit_grp0[] = { "sd1_4bit_grp0", };
 static const char * const sd1_4bit_grp1[] = { "sd1_4bit_grp1", };
-static const char * const sd2_grp0[] = { "sd2_grp0", };
-static const char * const sd2_no_cdb_grp0[] = { "sd2_no_cdb_grp0", };
+static const char * const sd2_basic_grp[] = { "sd2_basic_grp", };
+static const char * const sd2_cdb_grp0[] = { "sd2_cdb_grp0", };
+static const char * const sd2_cdb_grp1[] = { "sd2_cdb_grp1", };
+static const char * const sd2_wpb_grp0[] = { "sd2_wpb_grp0", };
+static const char * const sd2_wpb_grp1[] = { "sd2_wpb_grp1", };
 static const char * const sd3_grp[] = { "sd3_grp", };
 static const char * const sd5_grp[] = { "sd5_grp", };
 static const char * const sd6_grp0[] = { "sd6_grp0", };
@@ -1200,19 +1489,39 @@ static const char * const tpiu_trace_grp[] = { "tpiu_trace_grp", };
 static const char * const uart0_grp[] = { "uart0_grp", };
 static const char * const uart0_nopause_grp[] = { "uart0_nopause_grp", };
 static const char * const uart1_grp[] = { "uart1_grp", };
-static const char * const uart2_grp[] = { "uart2_grp", };
-static const char * const uart3_grp0[] = { "uart3_grp0", };
-static const char * const uart3_grp1[] = { "uart3_grp1", };
-static const char * const uart3_grp2[] = { "uart3_grp2", };
-static const char * const uart3_grp3[] = { "uart3_grp3", };
-static const char * const uart3_nopause_grp0[] = { "uart3_nopause_grp0", };
-static const char * const uart3_nopause_grp1[] = { "uart3_nopause_grp1", };
-static const char * const uart4_grp0[] = { "uart4_grp0", };
-static const char * const uart4_grp1[] = { "uart4_grp1", };
-static const char * const uart4_grp2[] = { "uart4_grp2", };
-static const char * const uart4_nopause_grp[] = { "uart4_nopause_grp", };
-static const char * const usb0_drvvbus_grp[] = { "usb0_drvvbus_grp", };
-static const char * const usb1_drvvbus_grp[] = { "usb1_drvvbus_grp", };
+static const char * const uart2_cts_grp0[] = { "uart2_cts_grp0", };
+static const char * const uart2_cts_grp1[] = { "uart2_cts_grp1", };
+static const char * const uart2_rts_grp0[] = { "uart2_rts_grp0", };
+static const char * const uart2_rts_grp1[] = { "uart2_rts_grp1", };
+static const char * const uart2_rxd_grp0[] = { "uart2_rxd_grp0", };
+static const char * const uart2_rxd_grp1[] = { "uart2_rxd_grp1", };
+static const char * const uart2_rxd_grp2[] = { "uart2_rxd_grp2", };
+static const char * const uart2_txd_grp0[] = { "uart2_txd_grp0", };
+static const char * const uart2_txd_grp1[] = { "uart2_txd_grp1", };
+static const char * const uart2_txd_grp2[] = { "uart2_txd_grp2", };
+static const char * const uart3_cts_grp0[] = { "uart3_cts_grp0", };
+static const char * const uart3_cts_grp1[] = { "uart3_cts_grp1", };
+static const char * const uart3_cts_grp2[] = { "uart3_cts_grp2", };
+static const char * const uart3_rts_grp0[] = { "uart3_rts_grp0", };
+static const char * const uart3_rts_grp1[] = { "uart3_rts_grp1", };
+static const char * const uart3_rts_grp2[] = { "uart3_rts_grp2", };
+static const char * const uart3_rxd_grp0[] = { "uart3_rxd_grp0", };
+static const char * const uart3_rxd_grp1[] = { "uart3_rxd_grp1", };
+static const char * const uart3_rxd_grp2[] = { "uart3_rxd_grp2", };
+static const char * const uart3_txd_grp0[] = { "uart3_txd_grp0", };
+static const char * const uart3_txd_grp1[] = { "uart3_txd_grp1", };
+static const char * const uart3_txd_grp2[] = { "uart3_txd_grp2", };
+static const char * const uart4_basic_grp[] = { "uart4_basic_grp", };
+static const char * const uart4_cts_grp0[] = { "uart4_cts_grp0", };
+static const char * const uart4_cts_grp1[] = { "uart4_cts_grp1", };
+static const char * const uart4_cts_grp2[] = { "uart4_cts_grp2", };
+static const char * const uart4_rts_grp0[] = { "uart4_rts_grp0", };
+static const char * const uart4_rts_grp1[] = { "uart4_rts_grp1", };
+static const char * const uart4_rts_grp2[] = { "uart4_rts_grp2", };
+static const char * const usb0_drvvbus_grp0[] = { "usb0_drvvbus_grp0", };
+static const char * const usb0_drvvbus_grp1[] = { "usb0_drvvbus_grp1", };
+static const char * const usb1_drvvbus_grp0[] = { "usb1_drvvbus_grp0", };
+static const char * const usb1_drvvbus_grp1[] = { "usb1_drvvbus_grp1", };
 static const char * const visbus_dout_grp[] = { "visbus_dout_grp", };
 static const char * const vi_vip1_grp[] = { "vi_vip1_grp", };
 static const char * const vi_vip1_ext_grp[] = { "vi_vip1_ext_grp", };
@@ -1376,7 +1685,7 @@ static struct atlas7_grp_mux lvds_gpio_grp_mux = {
 	.pad_mux_list = lvds_gpio_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux uart_nand_gpio_grp_pad_mux[] = {
+static struct atlas7_pad_mux jtag_uart_nand_gpio_grp_pad_mux[] = {
 	MUX(1, 44, 0, N, N, N, N),
 	MUX(1, 43, 0, N, N, N, N),
 	MUX(1, 42, 0, N, N, N, N),
@@ -1401,11 +1710,16 @@ static struct atlas7_pad_mux uart_nand_gpio_grp_pad_mux[] = {
 	MUX(1, 138, 0, N, N, N, N),
 	MUX(1, 139, 0, N, N, N, N),
 	MUX(1, 140, 0, N, N, N, N),
+	MUX(1, 159, 0, N, N, N, N),
+	MUX(1, 160, 0, N, N, N, N),
+	MUX(1, 161, 0, N, N, N, N),
+	MUX(1, 162, 0, N, N, N, N),
+	MUX(1, 163, 0, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart_nand_gpio_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart_nand_gpio_grp_pad_mux),
-	.pad_mux_list = uart_nand_gpio_grp_pad_mux,
+static struct atlas7_grp_mux jtag_uart_nand_gpio_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_uart_nand_gpio_grp_pad_mux),
+	.pad_mux_list = jtag_uart_nand_gpio_grp_pad_mux,
 };
 
 static struct atlas7_pad_mux rtc_gpio_grp_pad_mux[] = {
@@ -1422,6 +1736,7 @@ static struct atlas7_pad_mux rtc_gpio_grp_pad_mux[] = {
 	MUX(0, 15, 0, N, N, N, N),
 	MUX(0, 16, 0, N, N, N, N),
 	MUX(0, 17, 0, N, N, N, N),
+	MUX(0, 9, 0, N, N, N, N),
 };
 
 static struct atlas7_grp_mux rtc_gpio_grp_mux = {
@@ -1441,6 +1756,33 @@ static struct atlas7_grp_mux audio_ac97_grp_mux = {
 	.pad_mux_list = audio_ac97_grp_pad_mux,
 };
 
+static struct atlas7_pad_mux audio_digmic_grp0_pad_mux[] = {
+	MUX(1, 51, 3, 0xa10, 20, 0xa90, 20),
+};
+
+static struct atlas7_grp_mux audio_digmic_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_digmic_grp0_pad_mux),
+	.pad_mux_list = audio_digmic_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_digmic_grp1_pad_mux[] = {
+	MUX(1, 122, 5, 0xa10, 20, 0xa90, 20),
+};
+
+static struct atlas7_grp_mux audio_digmic_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_digmic_grp1_pad_mux),
+	.pad_mux_list = audio_digmic_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_digmic_grp2_pad_mux[] = {
+	MUX(1, 161, 7, 0xa10, 20, 0xa90, 20),
+};
+
+static struct atlas7_grp_mux audio_digmic_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_digmic_grp2_pad_mux),
+	.pad_mux_list = audio_digmic_grp2_pad_mux,
+};
+
 static struct atlas7_pad_mux audio_func_dbg_grp_pad_mux[] = {
 	MUX(1, 141, 4, N, N, N, N),
 	MUX(1, 144, 4, N, N, N, N),
@@ -1512,111 +1854,397 @@ static struct atlas7_grp_mux audio_i2s_extclk_grp_mux = {
 	.pad_mux_list = audio_i2s_extclk_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux audio_uart0_grp_pad_mux[] = {
+static struct atlas7_pad_mux audio_spdif_out_grp0_pad_mux[] = {
+	MUX(1, 112, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux audio_spdif_out_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_spdif_out_grp0_pad_mux),
+	.pad_mux_list = audio_spdif_out_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_spdif_out_grp1_pad_mux[] = {
+	MUX(1, 116, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux audio_spdif_out_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_spdif_out_grp1_pad_mux),
+	.pad_mux_list = audio_spdif_out_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_spdif_out_grp2_pad_mux[] = {
+	MUX(1, 142, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux audio_spdif_out_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_spdif_out_grp2_pad_mux),
+	.pad_mux_list = audio_spdif_out_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart0_basic_grp_pad_mux[] = {
 	MUX(1, 143, 1, N, N, N, N),
 	MUX(1, 142, 1, N, N, N, N),
 	MUX(1, 141, 1, N, N, N, N),
 	MUX(1, 144, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux audio_uart0_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(audio_uart0_grp_pad_mux),
-	.pad_mux_list = audio_uart0_grp_pad_mux,
+static struct atlas7_grp_mux audio_uart0_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart0_basic_grp_pad_mux),
+	.pad_mux_list = audio_uart0_basic_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart0_urfs_grp0_pad_mux[] = {
+	MUX(1, 117, 5, 0xa10, 28, 0xa90, 28),
 };
 
-static struct atlas7_pad_mux audio_uart1_grp_pad_mux[] = {
-	MUX(1, 147, 1, N, N, N, N),
-	MUX(1, 146, 1, N, N, N, N),
-	MUX(1, 145, 1, N, N, N, N),
-	MUX(1, 148, 1, N, N, N, N),
+static struct atlas7_grp_mux audio_uart0_urfs_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart0_urfs_grp0_pad_mux),
+	.pad_mux_list = audio_uart0_urfs_grp0_pad_mux,
 };
 
-static struct atlas7_grp_mux audio_uart1_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(audio_uart1_grp_pad_mux),
-	.pad_mux_list = audio_uart1_grp_pad_mux,
+static struct atlas7_pad_mux audio_uart0_urfs_grp1_pad_mux[] = {
+	MUX(1, 139, 3, 0xa10, 28, 0xa90, 28),
 };
 
-static struct atlas7_pad_mux audio_uart2_grp0_pad_mux[] = {
+static struct atlas7_grp_mux audio_uart0_urfs_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart0_urfs_grp1_pad_mux),
+	.pad_mux_list = audio_uart0_urfs_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart0_urfs_grp2_pad_mux[] = {
+	MUX(1, 163, 3, 0xa10, 28, 0xa90, 28),
+};
+
+static struct atlas7_grp_mux audio_uart0_urfs_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart0_urfs_grp2_pad_mux),
+	.pad_mux_list = audio_uart0_urfs_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart0_urfs_grp3_pad_mux[] = {
+	MUX(1, 162, 6, 0xa10, 28, 0xa90, 28),
+};
+
+static struct atlas7_grp_mux audio_uart0_urfs_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart0_urfs_grp3_pad_mux),
+	.pad_mux_list = audio_uart0_urfs_grp3_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart1_basic_grp_pad_mux[] = {
+	MUX(1, 147, 1, 0xa10, 24, 0xa90, 24),
+	MUX(1, 146, 1, 0xa10, 25, 0xa90, 25),
+	MUX(1, 145, 1, 0xa10, 23, 0xa90, 23),
+	MUX(1, 148, 1, 0xa10, 22, 0xa90, 22),
+};
+
+static struct atlas7_grp_mux audio_uart1_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart1_basic_grp_pad_mux),
+	.pad_mux_list = audio_uart1_basic_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart1_urfs_grp0_pad_mux[] = {
+	MUX(1, 117, 6, 0xa10, 29, 0xa90, 29),
+};
+
+static struct atlas7_grp_mux audio_uart1_urfs_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart1_urfs_grp0_pad_mux),
+	.pad_mux_list = audio_uart1_urfs_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart1_urfs_grp1_pad_mux[] = {
+	MUX(1, 140, 3, 0xa10, 29, 0xa90, 29),
+};
+
+static struct atlas7_grp_mux audio_uart1_urfs_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart1_urfs_grp1_pad_mux),
+	.pad_mux_list = audio_uart1_urfs_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart1_urfs_grp2_pad_mux[] = {
+	MUX(1, 163, 4, 0xa10, 29, 0xa90, 29),
+};
+
+static struct atlas7_grp_mux audio_uart1_urfs_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart1_urfs_grp2_pad_mux),
+	.pad_mux_list = audio_uart1_urfs_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_urfs_grp0_pad_mux[] = {
+	MUX(1, 139, 4, 0xa10, 30, 0xa90, 30),
+};
+
+static struct atlas7_grp_mux audio_uart2_urfs_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urfs_grp0_pad_mux),
+	.pad_mux_list = audio_uart2_urfs_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_urfs_grp1_pad_mux[] = {
+	MUX(1, 163, 6, 0xa10, 30, 0xa90, 30),
+};
+
+static struct atlas7_grp_mux audio_uart2_urfs_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urfs_grp1_pad_mux),
+	.pad_mux_list = audio_uart2_urfs_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_urfs_grp2_pad_mux[] = {
+	MUX(1, 96, 3, 0xa10, 30, 0xa90, 30),
+};
+
+static struct atlas7_grp_mux audio_uart2_urfs_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urfs_grp2_pad_mux),
+	.pad_mux_list = audio_uart2_urfs_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_urxd_grp0_pad_mux[] = {
 	MUX(1, 20, 2, 0xa00, 24, 0xa80, 24),
-	MUX(1, 21, 2, 0xa00, 25, 0xa80, 25),
-	MUX(1, 19, 2, 0xa00, 23, 0xa80, 23),
-	MUX(1, 18, 2, 0xa00, 22, 0xa80, 22),
 };
 
-static struct atlas7_grp_mux audio_uart2_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(audio_uart2_grp0_pad_mux),
-	.pad_mux_list = audio_uart2_grp0_pad_mux,
+static struct atlas7_grp_mux audio_uart2_urxd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urxd_grp0_pad_mux),
+	.pad_mux_list = audio_uart2_urxd_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux audio_uart2_grp1_pad_mux[] = {
+static struct atlas7_pad_mux audio_uart2_urxd_grp1_pad_mux[] = {
 	MUX(1, 109, 2, 0xa00, 24, 0xa80, 24),
-	MUX(1, 110, 2, 0xa00, 25, 0xa80, 25),
+};
+
+static struct atlas7_grp_mux audio_uart2_urxd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urxd_grp1_pad_mux),
+	.pad_mux_list = audio_uart2_urxd_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_urxd_grp2_pad_mux[] = {
+	MUX(1, 93, 3, 0xa00, 24, 0xa80, 24),
+};
+
+static struct atlas7_grp_mux audio_uart2_urxd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_urxd_grp2_pad_mux),
+	.pad_mux_list = audio_uart2_urxd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_usclk_grp0_pad_mux[] = {
+	MUX(1, 19, 2, 0xa00, 23, 0xa80, 23),
+};
+
+static struct atlas7_grp_mux audio_uart2_usclk_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_usclk_grp0_pad_mux),
+	.pad_mux_list = audio_uart2_usclk_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_usclk_grp1_pad_mux[] = {
 	MUX(1, 101, 2, 0xa00, 23, 0xa80, 23),
+};
+
+static struct atlas7_grp_mux audio_uart2_usclk_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_usclk_grp1_pad_mux),
+	.pad_mux_list = audio_uart2_usclk_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_usclk_grp2_pad_mux[] = {
+	MUX(1, 91, 3, 0xa00, 23, 0xa80, 23),
+};
+
+static struct atlas7_grp_mux audio_uart2_usclk_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_usclk_grp2_pad_mux),
+	.pad_mux_list = audio_uart2_usclk_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utfs_grp0_pad_mux[] = {
+	MUX(1, 18, 2, 0xa00, 22, 0xa80, 22),
+};
+
+static struct atlas7_grp_mux audio_uart2_utfs_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utfs_grp0_pad_mux),
+	.pad_mux_list = audio_uart2_utfs_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utfs_grp1_pad_mux[] = {
 	MUX(1, 111, 2, 0xa00, 22, 0xa80, 22),
 };
 
-static struct atlas7_grp_mux audio_uart2_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(audio_uart2_grp1_pad_mux),
-	.pad_mux_list = audio_uart2_grp1_pad_mux,
+static struct atlas7_grp_mux audio_uart2_utfs_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utfs_grp1_pad_mux),
+	.pad_mux_list = audio_uart2_utfs_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utfs_grp2_pad_mux[] = {
+	MUX(1, 94, 3, 0xa00, 22, 0xa80, 22),
+};
+
+static struct atlas7_grp_mux audio_uart2_utfs_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utfs_grp2_pad_mux),
+	.pad_mux_list = audio_uart2_utfs_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utxd_grp0_pad_mux[] = {
+	MUX(1, 21, 2, 0xa00, 25, 0xa80, 25),
+};
+
+static struct atlas7_grp_mux audio_uart2_utxd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utxd_grp0_pad_mux),
+	.pad_mux_list = audio_uart2_utxd_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utxd_grp1_pad_mux[] = {
+	MUX(1, 110, 2, 0xa00, 25, 0xa80, 25),
+};
+
+static struct atlas7_grp_mux audio_uart2_utxd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utxd_grp1_pad_mux),
+	.pad_mux_list = audio_uart2_utxd_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux audio_uart2_utxd_grp2_pad_mux[] = {
+	MUX(1, 92, 3, 0xa00, 25, 0xa80, 25),
+};
+
+static struct atlas7_grp_mux audio_uart2_utxd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(audio_uart2_utxd_grp2_pad_mux),
+	.pad_mux_list = audio_uart2_utxd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux c_can_trnsvr_en_grp0_pad_mux[] = {
+	MUX(0, 2, 6, N, N, N, N),
 };
 
-static struct atlas7_pad_mux c_can_trnsvr_grp_pad_mux[] = {
+static struct atlas7_grp_mux c_can_trnsvr_en_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(c_can_trnsvr_en_grp0_pad_mux),
+	.pad_mux_list = c_can_trnsvr_en_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux c_can_trnsvr_en_grp1_pad_mux[] = {
+	MUX(0, 0, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux c_can_trnsvr_en_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(c_can_trnsvr_en_grp1_pad_mux),
+	.pad_mux_list = c_can_trnsvr_en_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux c_can_trnsvr_intr_grp_pad_mux[] = {
 	MUX(0, 1, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c_can_trnsvr_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(c_can_trnsvr_grp_pad_mux),
-	.pad_mux_list = c_can_trnsvr_grp_pad_mux,
+static struct atlas7_grp_mux c_can_trnsvr_intr_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c_can_trnsvr_intr_grp_pad_mux),
+	.pad_mux_list = c_can_trnsvr_intr_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux c0_can_grp0_pad_mux[] = {
+static struct atlas7_pad_mux c_can_trnsvr_stb_n_grp_pad_mux[] = {
+	MUX(0, 3, 6, N, N, N, N),
+};
+
+static struct atlas7_grp_mux c_can_trnsvr_stb_n_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c_can_trnsvr_stb_n_grp_pad_mux),
+	.pad_mux_list = c_can_trnsvr_stb_n_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux c0_can_rxd_trnsv0_grp_pad_mux[] = {
 	MUX(0, 11, 1, 0xa08, 9, 0xa88, 9),
+};
+
+static struct atlas7_grp_mux c0_can_rxd_trnsv0_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c0_can_rxd_trnsv0_grp_pad_mux),
+	.pad_mux_list = c0_can_rxd_trnsv0_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux c0_can_rxd_trnsv1_grp_pad_mux[] = {
+	MUX(0, 2, 5, 0xa10, 9, 0xa90, 9),
+};
+
+static struct atlas7_grp_mux c0_can_rxd_trnsv1_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c0_can_rxd_trnsv1_grp_pad_mux),
+	.pad_mux_list = c0_can_rxd_trnsv1_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux c0_can_txd_trnsv0_grp_pad_mux[] = {
 	MUX(0, 10, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c0_can_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(c0_can_grp0_pad_mux),
-	.pad_mux_list = c0_can_grp0_pad_mux,
+static struct atlas7_grp_mux c0_can_txd_trnsv0_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c0_can_txd_trnsv0_grp_pad_mux),
+	.pad_mux_list = c0_can_txd_trnsv0_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux c0_can_grp1_pad_mux[] = {
-	MUX(0, 2, 5, 0xa08, 9, 0xa88, 9),
+static struct atlas7_pad_mux c0_can_txd_trnsv1_grp_pad_mux[] = {
 	MUX(0, 3, 5, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c0_can_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(c0_can_grp1_pad_mux),
-	.pad_mux_list = c0_can_grp1_pad_mux,
+static struct atlas7_grp_mux c0_can_txd_trnsv1_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(c0_can_txd_trnsv1_grp_pad_mux),
+	.pad_mux_list = c0_can_txd_trnsv1_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux c1_can_grp0_pad_mux[] = {
+static struct atlas7_pad_mux c1_can_rxd_grp0_pad_mux[] = {
 	MUX(1, 138, 2, 0xa00, 4, 0xa80, 4),
-	MUX(1, 137, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c1_can_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(c1_can_grp0_pad_mux),
-	.pad_mux_list = c1_can_grp0_pad_mux,
+static struct atlas7_grp_mux c1_can_rxd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_rxd_grp0_pad_mux),
+	.pad_mux_list = c1_can_rxd_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux c1_can_grp1_pad_mux[] = {
+static struct atlas7_pad_mux c1_can_rxd_grp1_pad_mux[] = {
 	MUX(1, 147, 2, 0xa00, 4, 0xa80, 4),
-	MUX(1, 146, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c1_can_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(c1_can_grp1_pad_mux),
-	.pad_mux_list = c1_can_grp1_pad_mux,
+static struct atlas7_grp_mux c1_can_rxd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_rxd_grp1_pad_mux),
+	.pad_mux_list = c1_can_rxd_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux c1_can_grp2_pad_mux[] = {
+static struct atlas7_pad_mux c1_can_rxd_grp2_pad_mux[] = {
 	MUX(0, 2, 2, 0xa00, 4, 0xa80, 4),
+};
+
+static struct atlas7_grp_mux c1_can_rxd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_rxd_grp2_pad_mux),
+	.pad_mux_list = c1_can_rxd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux c1_can_rxd_grp3_pad_mux[] = {
+	MUX(1, 162, 4, 0xa00, 4, 0xa80, 4),
+};
+
+static struct atlas7_grp_mux c1_can_rxd_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_rxd_grp3_pad_mux),
+	.pad_mux_list = c1_can_rxd_grp3_pad_mux,
+};
+
+static struct atlas7_pad_mux c1_can_txd_grp0_pad_mux[] = {
+	MUX(1, 137, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux c1_can_txd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_txd_grp0_pad_mux),
+	.pad_mux_list = c1_can_txd_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux c1_can_txd_grp1_pad_mux[] = {
+	MUX(1, 146, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux c1_can_txd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_txd_grp1_pad_mux),
+	.pad_mux_list = c1_can_txd_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux c1_can_txd_grp2_pad_mux[] = {
 	MUX(0, 3, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux c1_can_grp2_mux = {
-	.pad_mux_count = ARRAY_SIZE(c1_can_grp2_pad_mux),
-	.pad_mux_list = c1_can_grp2_pad_mux,
+static struct atlas7_grp_mux c1_can_txd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_txd_grp2_pad_mux),
+	.pad_mux_list = c1_can_txd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux c1_can_txd_grp3_pad_mux[] = {
+	MUX(1, 161, 4, N, N, N, N),
+};
+
+static struct atlas7_grp_mux c1_can_txd_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(c1_can_txd_grp3_pad_mux),
+	.pad_mux_list = c1_can_txd_grp3_pad_mux,
 };
 
 static struct atlas7_pad_mux ca_audio_lpc_grp_pad_mux[] = {
@@ -2198,18 +2826,215 @@ static struct atlas7_grp_mux i2c1_grp_mux = {
 	.pad_mux_list = i2c1_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux jtag_grp0_pad_mux[] = {
+static struct atlas7_pad_mux i2s0_grp_pad_mux[] = {
+	MUX(1, 91, 2, 0xa10, 12, 0xa90, 12),
+	MUX(1, 93, 2, 0xa10, 13, 0xa90, 13),
+	MUX(1, 94, 2, 0xa10, 14, 0xa90, 14),
+	MUX(1, 92, 2, 0xa10, 15, 0xa90, 15),
+};
+
+static struct atlas7_grp_mux i2s0_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s0_grp_pad_mux),
+	.pad_mux_list = i2s0_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_basic_grp_pad_mux[] = {
+	MUX(1, 95, 2, 0xa10, 16, 0xa90, 16),
+	MUX(1, 96, 2, 0xa10, 19, 0xa90, 19),
+};
+
+static struct atlas7_grp_mux i2s1_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_basic_grp_pad_mux),
+	.pad_mux_list = i2s1_basic_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd0_grp0_pad_mux[] = {
+	MUX(1, 61, 4, 0xa10, 17, 0xa90, 17),
+};
+
+static struct atlas7_grp_mux i2s1_rxd0_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd0_grp0_pad_mux),
+	.pad_mux_list = i2s1_rxd0_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd0_grp1_pad_mux[] = {
+	MUX(1, 131, 4, 0xa10, 17, 0xa90, 17),
+};
+
+static struct atlas7_grp_mux i2s1_rxd0_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd0_grp1_pad_mux),
+	.pad_mux_list = i2s1_rxd0_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd0_grp2_pad_mux[] = {
+	MUX(1, 129, 2, 0xa10, 17, 0xa90, 17),
+};
+
+static struct atlas7_grp_mux i2s1_rxd0_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd0_grp2_pad_mux),
+	.pad_mux_list = i2s1_rxd0_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd0_grp3_pad_mux[] = {
+	MUX(1, 117, 7, 0xa10, 17, 0xa90, 17),
+};
+
+static struct atlas7_grp_mux i2s1_rxd0_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd0_grp3_pad_mux),
+	.pad_mux_list = i2s1_rxd0_grp3_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd0_grp4_pad_mux[] = {
+	MUX(1, 83, 4, 0xa10, 17, 0xa90, 17),
+};
+
+static struct atlas7_grp_mux i2s1_rxd0_grp4_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd0_grp4_pad_mux),
+	.pad_mux_list = i2s1_rxd0_grp4_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd1_grp0_pad_mux[] = {
+	MUX(1, 72, 4, 0xa10, 18, 0xa90, 18),
+};
+
+static struct atlas7_grp_mux i2s1_rxd1_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd1_grp0_pad_mux),
+	.pad_mux_list = i2s1_rxd1_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd1_grp1_pad_mux[] = {
+	MUX(1, 132, 4, 0xa10, 18, 0xa90, 18),
+};
+
+static struct atlas7_grp_mux i2s1_rxd1_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd1_grp1_pad_mux),
+	.pad_mux_list = i2s1_rxd1_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd1_grp2_pad_mux[] = {
+	MUX(1, 130, 2, 0xa10, 18, 0xa90, 18),
+};
+
+static struct atlas7_grp_mux i2s1_rxd1_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd1_grp2_pad_mux),
+	.pad_mux_list = i2s1_rxd1_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd1_grp3_pad_mux[] = {
+	MUX(1, 118, 7, 0xa10, 18, 0xa90, 18),
+};
+
+static struct atlas7_grp_mux i2s1_rxd1_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd1_grp3_pad_mux),
+	.pad_mux_list = i2s1_rxd1_grp3_pad_mux,
+};
+
+static struct atlas7_pad_mux i2s1_rxd1_grp4_pad_mux[] = {
+	MUX(1, 84, 4, 0xa10, 18, 0xa90, 18),
+};
+
+static struct atlas7_grp_mux i2s1_rxd1_grp4_mux = {
+	.pad_mux_count = ARRAY_SIZE(i2s1_rxd1_grp4_pad_mux),
+	.pad_mux_list = i2s1_rxd1_grp4_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_jt_dbg_nsrst_grp_pad_mux[] = {
 	MUX(1, 125, 5, 0xa08, 2, 0xa88, 2),
+};
+
+static struct atlas7_grp_mux jtag_jt_dbg_nsrst_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_jt_dbg_nsrst_grp_pad_mux),
+	.pad_mux_list = jtag_jt_dbg_nsrst_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_ntrst_grp0_pad_mux[] = {
 	MUX(0, 4, 3, 0xa08, 3, 0xa88, 3),
-	MUX(0, 2, 3, N, N, N, N),
-	MUX(0, 0, 3, N, N, N, N),
-	MUX(0, 1, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux jtag_ntrst_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_ntrst_grp0_pad_mux),
+	.pad_mux_list = jtag_ntrst_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_ntrst_grp1_pad_mux[] = {
+	MUX(1, 163, 1, 0xa08, 3, 0xa88, 3),
+};
+
+static struct atlas7_grp_mux jtag_ntrst_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_ntrst_grp1_pad_mux),
+	.pad_mux_list = jtag_ntrst_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_swdiotms_grp0_pad_mux[] = {
+	MUX(0, 2, 3, 0xa10, 10, 0xa90, 10),
+};
+
+static struct atlas7_grp_mux jtag_swdiotms_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_swdiotms_grp0_pad_mux),
+	.pad_mux_list = jtag_swdiotms_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_swdiotms_grp1_pad_mux[] = {
+	MUX(1, 160, 1, 0xa10, 10, 0xa90, 10),
+};
+
+static struct atlas7_grp_mux jtag_swdiotms_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_swdiotms_grp1_pad_mux),
+	.pad_mux_list = jtag_swdiotms_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tck_grp0_pad_mux[] = {
+	MUX(0, 0, 3, 0xa10, 11, 0xa90, 11),
+};
+
+static struct atlas7_grp_mux jtag_tck_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tck_grp0_pad_mux),
+	.pad_mux_list = jtag_tck_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tck_grp1_pad_mux[] = {
+	MUX(1, 161, 1, 0xa10, 11, 0xa90, 11),
+};
+
+static struct atlas7_grp_mux jtag_tck_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tck_grp1_pad_mux),
+	.pad_mux_list = jtag_tck_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tdi_grp0_pad_mux[] = {
+	MUX(0, 1, 3, 0xa10, 31, 0xa90, 31),
+};
+
+static struct atlas7_grp_mux jtag_tdi_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tdi_grp0_pad_mux),
+	.pad_mux_list = jtag_tdi_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tdi_grp1_pad_mux[] = {
+	MUX(1, 162, 1, 0xa10, 31, 0xa90, 31),
+};
+
+static struct atlas7_grp_mux jtag_tdi_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tdi_grp1_pad_mux),
+	.pad_mux_list = jtag_tdi_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tdo_grp0_pad_mux[] = {
 	MUX(0, 3, 3, N, N, N, N),
 };
 
-static struct atlas7_grp_mux jtag_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(jtag_grp0_pad_mux),
-	.pad_mux_list = jtag_grp0_pad_mux,
+static struct atlas7_grp_mux jtag_tdo_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tdo_grp0_pad_mux),
+	.pad_mux_list = jtag_tdo_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux jtag_tdo_grp1_pad_mux[] = {
+	MUX(1, 159, 1, N, N, N, N),
+};
+
+static struct atlas7_grp_mux jtag_tdo_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(jtag_tdo_grp1_pad_mux),
+	.pad_mux_list = jtag_tdo_grp1_pad_mux,
 };
 
 static struct atlas7_pad_mux ks_kas_spi_grp0_pad_mux[] = {
@@ -2401,6 +3226,7 @@ static struct atlas7_grp_mux nd_df_nowp_grp_mux = {
 static struct atlas7_pad_mux ps_grp_pad_mux[] = {
 	MUX(1, 120, 2, N, N, N, N),
 	MUX(1, 119, 2, N, N, N, N),
+	MUX(1, 121, 5, N, N, N, N),
 };
 
 static struct atlas7_grp_mux ps_grp_mux = {
@@ -2534,6 +3360,15 @@ static struct atlas7_grp_mux pw_cko0_grp2_mux = {
 	.pad_mux_list = pw_cko0_grp2_pad_mux,
 };
 
+static struct atlas7_pad_mux pw_cko0_grp3_pad_mux[] = {
+	MUX(1, 162, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_cko0_grp3_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_cko0_grp3_pad_mux),
+	.pad_mux_list = pw_cko0_grp3_pad_mux,
+};
+
 static struct atlas7_pad_mux pw_cko1_grp0_pad_mux[] = {
 	MUX(1, 124, 3, N, N, N, N),
 };
@@ -2552,6 +3387,15 @@ static struct atlas7_grp_mux pw_cko1_grp1_mux = {
 	.pad_mux_list = pw_cko1_grp1_pad_mux,
 };
 
+static struct atlas7_pad_mux pw_cko1_grp2_pad_mux[] = {
+	MUX(1, 163, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_cko1_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_cko1_grp2_pad_mux),
+	.pad_mux_list = pw_cko1_grp2_pad_mux,
+};
+
 static struct atlas7_pad_mux pw_i2s01_clk_grp0_pad_mux[] = {
 	MUX(1, 125, 3, N, N, N, N),
 };
@@ -2570,22 +3414,58 @@ static struct atlas7_grp_mux pw_i2s01_clk_grp1_mux = {
 	.pad_mux_list = pw_i2s01_clk_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux pw_pwm0_grp_pad_mux[] = {
+static struct atlas7_pad_mux pw_i2s01_clk_grp2_pad_mux[] = {
+	MUX(1, 132, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_i2s01_clk_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_i2s01_clk_grp2_pad_mux),
+	.pad_mux_list = pw_i2s01_clk_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux pw_pwm0_grp0_pad_mux[] = {
 	MUX(1, 119, 3, N, N, N, N),
 };
 
-static struct atlas7_grp_mux pw_pwm0_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(pw_pwm0_grp_pad_mux),
-	.pad_mux_list = pw_pwm0_grp_pad_mux,
+static struct atlas7_grp_mux pw_pwm0_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm0_grp0_pad_mux),
+	.pad_mux_list = pw_pwm0_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux pw_pwm0_grp1_pad_mux[] = {
+	MUX(1, 159, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_pwm0_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm0_grp1_pad_mux),
+	.pad_mux_list = pw_pwm0_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux pw_pwm1_grp_pad_mux[] = {
+static struct atlas7_pad_mux pw_pwm1_grp0_pad_mux[] = {
 	MUX(1, 120, 3, N, N, N, N),
 };
 
-static struct atlas7_grp_mux pw_pwm1_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(pw_pwm1_grp_pad_mux),
-	.pad_mux_list = pw_pwm1_grp_pad_mux,
+static struct atlas7_grp_mux pw_pwm1_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm1_grp0_pad_mux),
+	.pad_mux_list = pw_pwm1_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux pw_pwm1_grp1_pad_mux[] = {
+	MUX(1, 160, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_pwm1_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm1_grp1_pad_mux),
+	.pad_mux_list = pw_pwm1_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux pw_pwm1_grp2_pad_mux[] = {
+	MUX(1, 131, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_pwm1_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm1_grp2_pad_mux),
+	.pad_mux_list = pw_pwm1_grp2_pad_mux,
 };
 
 static struct atlas7_pad_mux pw_pwm2_grp0_pad_mux[] = {
@@ -2606,6 +3486,15 @@ static struct atlas7_grp_mux pw_pwm2_grp1_mux = {
 	.pad_mux_list = pw_pwm2_grp1_pad_mux,
 };
 
+static struct atlas7_pad_mux pw_pwm2_grp2_pad_mux[] = {
+	MUX(1, 161, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_pwm2_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm2_grp2_pad_mux),
+	.pad_mux_list = pw_pwm2_grp2_pad_mux,
+};
+
 static struct atlas7_pad_mux pw_pwm3_grp0_pad_mux[] = {
 	MUX(1, 122, 3, N, N, N, N),
 };
@@ -2642,6 +3531,15 @@ static struct atlas7_grp_mux pw_pwm_cpu_vol_grp1_mux = {
 	.pad_mux_list = pw_pwm_cpu_vol_grp1_pad_mux,
 };
 
+static struct atlas7_pad_mux pw_pwm_cpu_vol_grp2_pad_mux[] = {
+	MUX(1, 161, 5, N, N, N, N),
+};
+
+static struct atlas7_grp_mux pw_pwm_cpu_vol_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(pw_pwm_cpu_vol_grp2_pad_mux),
+	.pad_mux_list = pw_pwm_cpu_vol_grp2_pad_mux,
+};
+
 static struct atlas7_pad_mux pw_backlight_grp0_pad_mux[] = {
 	MUX(1, 122, 3, N, N, N, N),
 };
@@ -2795,35 +3693,54 @@ static struct atlas7_grp_mux sd1_4bit_grp1_mux = {
 	.pad_mux_list = sd1_4bit_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux sd2_grp0_pad_mux[] = {
-	MUX(1, 124, 2, 0xa08, 7, 0xa88, 7),
+static struct atlas7_pad_mux sd2_basic_grp_pad_mux[] = {
 	MUX(1, 31, 1, N, N, N, N),
 	MUX(1, 32, 1, N, N, N, N),
 	MUX(1, 33, 1, N, N, N, N),
 	MUX(1, 34, 1, N, N, N, N),
 	MUX(1, 35, 1, N, N, N, N),
 	MUX(1, 36, 1, N, N, N, N),
-	MUX(1, 123, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux sd2_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(sd2_grp0_pad_mux),
-	.pad_mux_list = sd2_grp0_pad_mux,
+static struct atlas7_grp_mux sd2_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd2_basic_grp_pad_mux),
+	.pad_mux_list = sd2_basic_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux sd2_no_cdb_grp0_pad_mux[] = {
-	MUX(1, 31, 1, N, N, N, N),
-	MUX(1, 32, 1, N, N, N, N),
-	MUX(1, 33, 1, N, N, N, N),
-	MUX(1, 34, 1, N, N, N, N),
-	MUX(1, 35, 1, N, N, N, N),
-	MUX(1, 36, 1, N, N, N, N),
-	MUX(1, 123, 2, N, N, N, N),
+static struct atlas7_pad_mux sd2_cdb_grp0_pad_mux[] = {
+	MUX(1, 124, 2, 0xa08, 7, 0xa88, 7),
 };
 
-static struct atlas7_grp_mux sd2_no_cdb_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(sd2_no_cdb_grp0_pad_mux),
-	.pad_mux_list = sd2_no_cdb_grp0_pad_mux,
+static struct atlas7_grp_mux sd2_cdb_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd2_cdb_grp0_pad_mux),
+	.pad_mux_list = sd2_cdb_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux sd2_cdb_grp1_pad_mux[] = {
+	MUX(1, 161, 6, 0xa08, 7, 0xa88, 7),
+};
+
+static struct atlas7_grp_mux sd2_cdb_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd2_cdb_grp1_pad_mux),
+	.pad_mux_list = sd2_cdb_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux sd2_wpb_grp0_pad_mux[] = {
+	MUX(1, 123, 2, 0xa10, 6, 0xa90, 6),
+};
+
+static struct atlas7_grp_mux sd2_wpb_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd2_wpb_grp0_pad_mux),
+	.pad_mux_list = sd2_wpb_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux sd2_wpb_grp1_pad_mux[] = {
+	MUX(1, 163, 7, 0xa10, 6, 0xa90, 6),
+};
+
+static struct atlas7_grp_mux sd2_wpb_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(sd2_wpb_grp1_pad_mux),
+	.pad_mux_list = sd2_wpb_grp1_pad_mux,
 };
 
 static struct atlas7_pad_mux sd3_grp_pad_mux[] = {
@@ -2975,146 +3892,302 @@ static struct atlas7_grp_mux uart1_grp_mux = {
 	.pad_mux_list = uart1_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux uart2_grp_pad_mux[] = {
-	MUX(0, 11, 2, N, N, N, N),
+static struct atlas7_pad_mux uart2_cts_grp0_pad_mux[] = {
+	MUX(1, 132, 3, 0xa10, 2, 0xa90, 2),
+};
+
+static struct atlas7_grp_mux uart2_cts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_cts_grp0_pad_mux),
+	.pad_mux_list = uart2_cts_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_cts_grp1_pad_mux[] = {
+	MUX(1, 162, 2, 0xa10, 2, 0xa90, 2),
+};
+
+static struct atlas7_grp_mux uart2_cts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_cts_grp1_pad_mux),
+	.pad_mux_list = uart2_cts_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_rts_grp0_pad_mux[] = {
+	MUX(1, 131, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart2_rts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_rts_grp0_pad_mux),
+	.pad_mux_list = uart2_rts_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_rts_grp1_pad_mux[] = {
+	MUX(1, 161, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart2_rts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_rts_grp1_pad_mux),
+	.pad_mux_list = uart2_rts_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_rxd_grp0_pad_mux[] = {
+	MUX(0, 11, 2, 0xa10, 5, 0xa90, 5),
+};
+
+static struct atlas7_grp_mux uart2_rxd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_rxd_grp0_pad_mux),
+	.pad_mux_list = uart2_rxd_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_rxd_grp1_pad_mux[] = {
+	MUX(1, 160, 2, 0xa10, 5, 0xa90, 5),
+};
+
+static struct atlas7_grp_mux uart2_rxd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_rxd_grp1_pad_mux),
+	.pad_mux_list = uart2_rxd_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_rxd_grp2_pad_mux[] = {
+	MUX(1, 130, 3, 0xa10, 5, 0xa90, 5),
+};
+
+static struct atlas7_grp_mux uart2_rxd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_rxd_grp2_pad_mux),
+	.pad_mux_list = uart2_rxd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_txd_grp0_pad_mux[] = {
 	MUX(0, 10, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart2_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart2_grp_pad_mux),
-	.pad_mux_list = uart2_grp_pad_mux,
+static struct atlas7_grp_mux uart2_txd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_txd_grp0_pad_mux),
+	.pad_mux_list = uart2_txd_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_txd_grp1_pad_mux[] = {
+	MUX(1, 159, 2, N, N, N, N),
 };
 
-static struct atlas7_pad_mux uart3_grp0_pad_mux[] = {
+static struct atlas7_grp_mux uart2_txd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_txd_grp1_pad_mux),
+	.pad_mux_list = uart2_txd_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart2_txd_grp2_pad_mux[] = {
+	MUX(1, 129, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart2_txd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart2_txd_grp2_pad_mux),
+	.pad_mux_list = uart2_txd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_cts_grp0_pad_mux[] = {
 	MUX(1, 125, 2, 0xa08, 0, 0xa88, 0),
-	MUX(1, 126, 2, N, N, N, N),
-	MUX(1, 138, 1, 0xa00, 5, 0xa80, 5),
-	MUX(1, 137, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_grp0_pad_mux),
-	.pad_mux_list = uart3_grp0_pad_mux,
+static struct atlas7_grp_mux uart3_cts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_cts_grp0_pad_mux),
+	.pad_mux_list = uart3_cts_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux uart3_grp1_pad_mux[] = {
+static struct atlas7_pad_mux uart3_cts_grp1_pad_mux[] = {
 	MUX(1, 111, 4, 0xa08, 0, 0xa88, 0),
-	MUX(1, 109, 4, N, N, N, N),
-	MUX(1, 84, 2, 0xa00, 5, 0xa80, 5),
-	MUX(1, 83, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_grp1_pad_mux),
-	.pad_mux_list = uart3_grp1_pad_mux,
+static struct atlas7_grp_mux uart3_cts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_cts_grp1_pad_mux),
+	.pad_mux_list = uart3_cts_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux uart3_grp2_pad_mux[] = {
+static struct atlas7_pad_mux uart3_cts_grp2_pad_mux[] = {
 	MUX(1, 140, 2, 0xa08, 0, 0xa88, 0),
+};
+
+static struct atlas7_grp_mux uart3_cts_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_cts_grp2_pad_mux),
+	.pad_mux_list = uart3_cts_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_rts_grp0_pad_mux[] = {
+	MUX(1, 126, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart3_rts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rts_grp0_pad_mux),
+	.pad_mux_list = uart3_rts_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_rts_grp1_pad_mux[] = {
+	MUX(1, 109, 4, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart3_rts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rts_grp1_pad_mux),
+	.pad_mux_list = uart3_rts_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_rts_grp2_pad_mux[] = {
 	MUX(1, 139, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart3_rts_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rts_grp2_pad_mux),
+	.pad_mux_list = uart3_rts_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_rxd_grp0_pad_mux[] = {
 	MUX(1, 138, 1, 0xa00, 5, 0xa80, 5),
-	MUX(1, 137, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_grp2_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_grp2_pad_mux),
-	.pad_mux_list = uart3_grp2_pad_mux,
+static struct atlas7_grp_mux uart3_rxd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rxd_grp0_pad_mux),
+	.pad_mux_list = uart3_rxd_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux uart3_grp3_pad_mux[] = {
-	MUX(1, 139, 2, N, N, N, N),
-	MUX(1, 140, 2, 0xa08, 0, 0xa88, 0),
+static struct atlas7_pad_mux uart3_rxd_grp1_pad_mux[] = {
 	MUX(1, 84, 2, 0xa00, 5, 0xa80, 5),
-	MUX(1, 83, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_grp3_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_grp3_pad_mux),
-	.pad_mux_list = uart3_grp3_pad_mux,
+static struct atlas7_grp_mux uart3_rxd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rxd_grp1_pad_mux),
+	.pad_mux_list = uart3_rxd_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux uart3_nopause_grp0_pad_mux[] = {
-	MUX(1, 138, 1, 0xa00, 5, 0xa80, 5),
+static struct atlas7_pad_mux uart3_rxd_grp2_pad_mux[] = {
+	MUX(1, 162, 3, 0xa00, 5, 0xa80, 5),
+};
+
+static struct atlas7_grp_mux uart3_rxd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_rxd_grp2_pad_mux),
+	.pad_mux_list = uart3_rxd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart3_txd_grp0_pad_mux[] = {
 	MUX(1, 137, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_nopause_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_nopause_grp0_pad_mux),
-	.pad_mux_list = uart3_nopause_grp0_pad_mux,
+static struct atlas7_grp_mux uart3_txd_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_txd_grp0_pad_mux),
+	.pad_mux_list = uart3_txd_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux uart3_nopause_grp1_pad_mux[] = {
-	MUX(1, 84, 2, 0xa00, 5, 0xa80, 5),
+static struct atlas7_pad_mux uart3_txd_grp1_pad_mux[] = {
 	MUX(1, 83, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart3_nopause_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart3_nopause_grp1_pad_mux),
-	.pad_mux_list = uart3_nopause_grp1_pad_mux,
+static struct atlas7_grp_mux uart3_txd_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_txd_grp1_pad_mux),
+	.pad_mux_list = uart3_txd_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux uart4_grp0_pad_mux[] = {
-	MUX(1, 122, 4, 0xa08, 1, 0xa88, 1),
-	MUX(1, 123, 4, N, N, N, N),
+static struct atlas7_pad_mux uart3_txd_grp2_pad_mux[] = {
+	MUX(1, 161, 3, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart3_txd_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart3_txd_grp2_pad_mux),
+	.pad_mux_list = uart3_txd_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux uart4_basic_grp_pad_mux[] = {
 	MUX(1, 140, 1, N, N, N, N),
 	MUX(1, 139, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart4_grp0_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart4_grp0_pad_mux),
-	.pad_mux_list = uart4_grp0_pad_mux,
+static struct atlas7_grp_mux uart4_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_basic_grp_pad_mux),
+	.pad_mux_list = uart4_basic_grp_pad_mux,
+};
+
+static struct atlas7_pad_mux uart4_cts_grp0_pad_mux[] = {
+	MUX(1, 122, 4, 0xa08, 1, 0xa88, 1),
+};
+
+static struct atlas7_grp_mux uart4_cts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_cts_grp0_pad_mux),
+	.pad_mux_list = uart4_cts_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux uart4_grp1_pad_mux[] = {
+static struct atlas7_pad_mux uart4_cts_grp1_pad_mux[] = {
 	MUX(1, 100, 4, 0xa08, 1, 0xa88, 1),
-	MUX(1, 99, 4, N, N, N, N),
-	MUX(1, 140, 1, N, N, N, N),
-	MUX(1, 139, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart4_grp1_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart4_grp1_pad_mux),
-	.pad_mux_list = uart4_grp1_pad_mux,
+static struct atlas7_grp_mux uart4_cts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_cts_grp1_pad_mux),
+	.pad_mux_list = uart4_cts_grp1_pad_mux,
 };
 
-static struct atlas7_pad_mux uart4_grp2_pad_mux[] = {
+static struct atlas7_pad_mux uart4_cts_grp2_pad_mux[] = {
 	MUX(1, 117, 2, 0xa08, 1, 0xa88, 1),
-	MUX(1, 116, 2, N, N, N, N),
-	MUX(1, 140, 1, N, N, N, N),
-	MUX(1, 139, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart4_grp2_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart4_grp2_pad_mux),
-	.pad_mux_list = uart4_grp2_pad_mux,
+static struct atlas7_grp_mux uart4_cts_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_cts_grp2_pad_mux),
+	.pad_mux_list = uart4_cts_grp2_pad_mux,
 };
 
-static struct atlas7_pad_mux uart4_nopause_grp_pad_mux[] = {
-	MUX(1, 140, 1, N, N, N, N),
-	MUX(1, 139, 1, N, N, N, N),
+static struct atlas7_pad_mux uart4_rts_grp0_pad_mux[] = {
+	MUX(1, 123, 4, N, N, N, N),
 };
 
-static struct atlas7_grp_mux uart4_nopause_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(uart4_nopause_grp_pad_mux),
-	.pad_mux_list = uart4_nopause_grp_pad_mux,
+static struct atlas7_grp_mux uart4_rts_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_rts_grp0_pad_mux),
+	.pad_mux_list = uart4_rts_grp0_pad_mux,
 };
 
-static struct atlas7_pad_mux usb0_drvvbus_grp_pad_mux[] = {
+static struct atlas7_pad_mux uart4_rts_grp1_pad_mux[] = {
+	MUX(1, 99, 4, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart4_rts_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_rts_grp1_pad_mux),
+	.pad_mux_list = uart4_rts_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux uart4_rts_grp2_pad_mux[] = {
+	MUX(1, 116, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux uart4_rts_grp2_mux = {
+	.pad_mux_count = ARRAY_SIZE(uart4_rts_grp2_pad_mux),
+	.pad_mux_list = uart4_rts_grp2_pad_mux,
+};
+
+static struct atlas7_pad_mux usb0_drvvbus_grp0_pad_mux[] = {
 	MUX(1, 51, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux usb0_drvvbus_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(usb0_drvvbus_grp_pad_mux),
-	.pad_mux_list = usb0_drvvbus_grp_pad_mux,
+static struct atlas7_grp_mux usb0_drvvbus_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(usb0_drvvbus_grp0_pad_mux),
+	.pad_mux_list = usb0_drvvbus_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux usb0_drvvbus_grp1_pad_mux[] = {
+	MUX(1, 162, 7, N, N, N, N),
 };
 
-static struct atlas7_pad_mux usb1_drvvbus_grp_pad_mux[] = {
+static struct atlas7_grp_mux usb0_drvvbus_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(usb0_drvvbus_grp1_pad_mux),
+	.pad_mux_list = usb0_drvvbus_grp1_pad_mux,
+};
+
+static struct atlas7_pad_mux usb1_drvvbus_grp0_pad_mux[] = {
 	MUX(1, 134, 2, N, N, N, N),
 };
 
-static struct atlas7_grp_mux usb1_drvvbus_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(usb1_drvvbus_grp_pad_mux),
-	.pad_mux_list = usb1_drvvbus_grp_pad_mux,
+static struct atlas7_grp_mux usb1_drvvbus_grp0_mux = {
+	.pad_mux_count = ARRAY_SIZE(usb1_drvvbus_grp0_pad_mux),
+	.pad_mux_list = usb1_drvvbus_grp0_pad_mux,
+};
+
+static struct atlas7_pad_mux usb1_drvvbus_grp1_pad_mux[] = {
+	MUX(1, 163, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux usb1_drvvbus_grp1_mux = {
+	.pad_mux_count = ARRAY_SIZE(usb1_drvvbus_grp1_pad_mux),
+	.pad_mux_list = usb1_drvvbus_grp1_pad_mux,
 };
 
 static struct atlas7_pad_mux visbus_dout_grp_pad_mux[] = {
@@ -3252,11 +4325,20 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("sdio_i2s_gpio", sdio_i2s_gpio_grp, &sdio_i2s_gpio_grp_mux),
 	FUNCTION("sp_rgmii_gpio", sp_rgmii_gpio_grp, &sp_rgmii_gpio_grp_mux),
 	FUNCTION("lvds_gpio", lvds_gpio_grp, &lvds_gpio_grp_mux),
-	FUNCTION("uart_nand_gpio",
-			uart_nand_gpio_grp,
-			&uart_nand_gpio_grp_mux),
+	FUNCTION("jtag_uart_nand_gpio",
+			jtag_uart_nand_gpio_grp,
+			&jtag_uart_nand_gpio_grp_mux),
 	FUNCTION("rtc_gpio", rtc_gpio_grp, &rtc_gpio_grp_mux),
 	FUNCTION("audio_ac97", audio_ac97_grp, &audio_ac97_grp_mux),
+	FUNCTION("audio_digmic_m0",
+			audio_digmic_grp0,
+			&audio_digmic_grp0_mux),
+	FUNCTION("audio_digmic_m1",
+			audio_digmic_grp1,
+			&audio_digmic_grp1_mux),
+	FUNCTION("audio_digmic_m2",
+			audio_digmic_grp2,
+			&audio_digmic_grp2_mux),
 	FUNCTION("audio_func_dbg",
 			audio_func_dbg_grp,
 			&audio_func_dbg_grp_mux),
@@ -3265,16 +4347,119 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("audio_i2s_extclk",
 			audio_i2s_extclk_grp,
 			&audio_i2s_extclk_grp_mux),
-	FUNCTION("audio_uart0", audio_uart0_grp, &audio_uart0_grp_mux),
-	FUNCTION("audio_uart1", audio_uart1_grp, &audio_uart1_grp_mux),
-	FUNCTION("audio_uart2_m0", audio_uart2_grp0, &audio_uart2_grp0_mux),
-	FUNCTION("audio_uart2_m1", audio_uart2_grp1, &audio_uart2_grp1_mux),
-	FUNCTION("c_can_trnsvr", c_can_trnsvr_grp, &c_can_trnsvr_grp_mux),
-	FUNCTION("c0_can_m0", c0_can_grp0, &c0_can_grp0_mux),
-	FUNCTION("c0_can_m1", c0_can_grp1, &c0_can_grp1_mux),
-	FUNCTION("c1_can_m0", c1_can_grp0, &c1_can_grp0_mux),
-	FUNCTION("c1_can_m1", c1_can_grp1, &c1_can_grp1_mux),
-	FUNCTION("c1_can_m2", c1_can_grp2, &c1_can_grp2_mux),
+	FUNCTION("audio_spdif_out_m0",
+			audio_spdif_out_grp0,
+			&audio_spdif_out_grp0_mux),
+	FUNCTION("audio_spdif_out_m1",
+			audio_spdif_out_grp1,
+			&audio_spdif_out_grp1_mux),
+	FUNCTION("audio_spdif_out_m2",
+			audio_spdif_out_grp2,
+			&audio_spdif_out_grp2_mux),
+	FUNCTION("audio_uart0_basic",
+			audio_uart0_basic_grp,
+			&audio_uart0_basic_grp_mux),
+	FUNCTION("audio_uart0_urfs_m0",
+			audio_uart0_urfs_grp0,
+			&audio_uart0_urfs_grp0_mux),
+	FUNCTION("audio_uart0_urfs_m1",
+			audio_uart0_urfs_grp1,
+			&audio_uart0_urfs_grp1_mux),
+	FUNCTION("audio_uart0_urfs_m2",
+			audio_uart0_urfs_grp2,
+			&audio_uart0_urfs_grp2_mux),
+	FUNCTION("audio_uart0_urfs_m3",
+			audio_uart0_urfs_grp3,
+			&audio_uart0_urfs_grp3_mux),
+	FUNCTION("audio_uart1_basic",
+			audio_uart1_basic_grp,
+			&audio_uart1_basic_grp_mux),
+	FUNCTION("audio_uart1_urfs_m0",
+			audio_uart1_urfs_grp0,
+			&audio_uart1_urfs_grp0_mux),
+	FUNCTION("audio_uart1_urfs_m1",
+			audio_uart1_urfs_grp1,
+			&audio_uart1_urfs_grp1_mux),
+	FUNCTION("audio_uart1_urfs_m2",
+			audio_uart1_urfs_grp2,
+			&audio_uart1_urfs_grp2_mux),
+	FUNCTION("audio_uart2_urfs_m0",
+			audio_uart2_urfs_grp0,
+			&audio_uart2_urfs_grp0_mux),
+	FUNCTION("audio_uart2_urfs_m1",
+			audio_uart2_urfs_grp1,
+			&audio_uart2_urfs_grp1_mux),
+	FUNCTION("audio_uart2_urfs_m2",
+			audio_uart2_urfs_grp2,
+			&audio_uart2_urfs_grp2_mux),
+	FUNCTION("audio_uart2_urxd_m0",
+			audio_uart2_urxd_grp0,
+			&audio_uart2_urxd_grp0_mux),
+	FUNCTION("audio_uart2_urxd_m1",
+			audio_uart2_urxd_grp1,
+			&audio_uart2_urxd_grp1_mux),
+	FUNCTION("audio_uart2_urxd_m2",
+			audio_uart2_urxd_grp2,
+			&audio_uart2_urxd_grp2_mux),
+	FUNCTION("audio_uart2_usclk_m0",
+			audio_uart2_usclk_grp0,
+			&audio_uart2_usclk_grp0_mux),
+	FUNCTION("audio_uart2_usclk_m1",
+			audio_uart2_usclk_grp1,
+			&audio_uart2_usclk_grp1_mux),
+	FUNCTION("audio_uart2_usclk_m2",
+			audio_uart2_usclk_grp2,
+			&audio_uart2_usclk_grp2_mux),
+	FUNCTION("audio_uart2_utfs_m0",
+			audio_uart2_utfs_grp0,
+			&audio_uart2_utfs_grp0_mux),
+	FUNCTION("audio_uart2_utfs_m1",
+			audio_uart2_utfs_grp1,
+			&audio_uart2_utfs_grp1_mux),
+	FUNCTION("audio_uart2_utfs_m2",
+			audio_uart2_utfs_grp2,
+			&audio_uart2_utfs_grp2_mux),
+	FUNCTION("audio_uart2_utxd_m0",
+			audio_uart2_utxd_grp0,
+			&audio_uart2_utxd_grp0_mux),
+	FUNCTION("audio_uart2_utxd_m1",
+			audio_uart2_utxd_grp1,
+			&audio_uart2_utxd_grp1_mux),
+	FUNCTION("audio_uart2_utxd_m2",
+			audio_uart2_utxd_grp2,
+			&audio_uart2_utxd_grp2_mux),
+	FUNCTION("c_can_trnsvr_en_m0",
+			c_can_trnsvr_en_grp0,
+			&c_can_trnsvr_en_grp0_mux),
+	FUNCTION("c_can_trnsvr_en_m1",
+			c_can_trnsvr_en_grp1,
+			&c_can_trnsvr_en_grp1_mux),
+	FUNCTION("c_can_trnsvr_intr",
+			c_can_trnsvr_intr_grp,
+			&c_can_trnsvr_intr_grp_mux),
+	FUNCTION("c_can_trnsvr_stb_n",
+			c_can_trnsvr_stb_n_grp,
+			&c_can_trnsvr_stb_n_grp_mux),
+	FUNCTION("c0_can_rxd_trnsv0",
+			c0_can_rxd_trnsv0_grp,
+			&c0_can_rxd_trnsv0_grp_mux),
+	FUNCTION("c0_can_rxd_trnsv1",
+			c0_can_rxd_trnsv1_grp,
+			&c0_can_rxd_trnsv1_grp_mux),
+	FUNCTION("c0_can_txd_trnsv0",
+			c0_can_txd_trnsv0_grp,
+			&c0_can_txd_trnsv0_grp_mux),
+	FUNCTION("c0_can_txd_trnsv1",
+			c0_can_txd_trnsv1_grp,
+			&c0_can_txd_trnsv1_grp_mux),
+	FUNCTION("c1_can_rxd_m0", c1_can_rxd_grp0, &c1_can_rxd_grp0_mux),
+	FUNCTION("c1_can_rxd_m1", c1_can_rxd_grp1, &c1_can_rxd_grp1_mux),
+	FUNCTION("c1_can_rxd_m2", c1_can_rxd_grp2, &c1_can_rxd_grp2_mux),
+	FUNCTION("c1_can_rxd_m3", c1_can_rxd_grp3, &c1_can_rxd_grp3_mux),
+	FUNCTION("c1_can_txd_m0", c1_can_txd_grp0, &c1_can_txd_grp0_mux),
+	FUNCTION("c1_can_txd_m1", c1_can_txd_grp1, &c1_can_txd_grp1_mux),
+	FUNCTION("c1_can_txd_m2", c1_can_txd_grp2, &c1_can_txd_grp2_mux),
+	FUNCTION("c1_can_txd_m3", c1_can_txd_grp3, &c1_can_txd_grp3_mux),
 	FUNCTION("ca_audio_lpc", ca_audio_lpc_grp, &ca_audio_lpc_grp_mux),
 	FUNCTION("ca_bt_lpc", ca_bt_lpc_grp, &ca_bt_lpc_grp_mux),
 	FUNCTION("ca_coex", ca_coex_grp, &ca_coex_grp_mux),
@@ -3377,7 +4562,35 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 			&gn_trg_shutdown_grp3_mux),
 	FUNCTION("i2c0", i2c0_grp, &i2c0_grp_mux),
 	FUNCTION("i2c1", i2c1_grp, &i2c1_grp_mux),
-	FUNCTION("jtag_m0", jtag_grp0, &jtag_grp0_mux),
+	FUNCTION("i2s0", i2s0_grp, &i2s0_grp_mux),
+	FUNCTION("i2s1_basic", i2s1_basic_grp, &i2s1_basic_grp_mux),
+	FUNCTION("i2s1_rxd0_m0", i2s1_rxd0_grp0, &i2s1_rxd0_grp0_mux),
+	FUNCTION("i2s1_rxd0_m1", i2s1_rxd0_grp1, &i2s1_rxd0_grp1_mux),
+	FUNCTION("i2s1_rxd0_m2", i2s1_rxd0_grp2, &i2s1_rxd0_grp2_mux),
+	FUNCTION("i2s1_rxd0_m3", i2s1_rxd0_grp3, &i2s1_rxd0_grp3_mux),
+	FUNCTION("i2s1_rxd0_m4", i2s1_rxd0_grp4, &i2s1_rxd0_grp4_mux),
+	FUNCTION("i2s1_rxd1_m0", i2s1_rxd1_grp0, &i2s1_rxd1_grp0_mux),
+	FUNCTION("i2s1_rxd1_m1", i2s1_rxd1_grp1, &i2s1_rxd1_grp1_mux),
+	FUNCTION("i2s1_rxd1_m2", i2s1_rxd1_grp2, &i2s1_rxd1_grp2_mux),
+	FUNCTION("i2s1_rxd1_m3", i2s1_rxd1_grp3, &i2s1_rxd1_grp3_mux),
+	FUNCTION("i2s1_rxd1_m4", i2s1_rxd1_grp4, &i2s1_rxd1_grp4_mux),
+	FUNCTION("jtag_jt_dbg_nsrst",
+			jtag_jt_dbg_nsrst_grp,
+			&jtag_jt_dbg_nsrst_grp_mux),
+	FUNCTION("jtag_ntrst_m0", jtag_ntrst_grp0, &jtag_ntrst_grp0_mux),
+	FUNCTION("jtag_ntrst_m1", jtag_ntrst_grp1, &jtag_ntrst_grp1_mux),
+	FUNCTION("jtag_swdiotms_m0",
+			jtag_swdiotms_grp0,
+			&jtag_swdiotms_grp0_mux),
+	FUNCTION("jtag_swdiotms_m1",
+			jtag_swdiotms_grp1,
+			&jtag_swdiotms_grp1_mux),
+	FUNCTION("jtag_tck_m0", jtag_tck_grp0, &jtag_tck_grp0_mux),
+	FUNCTION("jtag_tck_m1", jtag_tck_grp1, &jtag_tck_grp1_mux),
+	FUNCTION("jtag_tdi_m0", jtag_tdi_grp0, &jtag_tdi_grp0_mux),
+	FUNCTION("jtag_tdi_m1", jtag_tdi_grp1, &jtag_tdi_grp1_mux),
+	FUNCTION("jtag_tdo_m0", jtag_tdo_grp0, &jtag_tdo_grp0_mux),
+	FUNCTION("jtag_tdo_m1", jtag_tdo_grp1, &jtag_tdo_grp1_mux),
 	FUNCTION("ks_kas_spi_m0", ks_kas_spi_grp0, &ks_kas_spi_grp0_mux),
 	FUNCTION("ld_ldd", ld_ldd_grp, &ld_ldd_grp_mux),
 	FUNCTION("ld_ldd_16bit", ld_ldd_16bit_grp, &ld_ldd_16bit_grp_mux),
@@ -3414,18 +4627,27 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("pw_cko0_m0", pw_cko0_grp0, &pw_cko0_grp0_mux),
 	FUNCTION("pw_cko0_m1", pw_cko0_grp1, &pw_cko0_grp1_mux),
 	FUNCTION("pw_cko0_m2", pw_cko0_grp2, &pw_cko0_grp2_mux),
+	FUNCTION("pw_cko0_m3", pw_cko0_grp3, &pw_cko0_grp3_mux),
 	FUNCTION("pw_cko1_m0", pw_cko1_grp0, &pw_cko1_grp0_mux),
 	FUNCTION("pw_cko1_m1", pw_cko1_grp1, &pw_cko1_grp1_mux),
+	FUNCTION("pw_cko1_m2", pw_cko1_grp2, &pw_cko1_grp2_mux),
 	FUNCTION("pw_i2s01_clk_m0",
 			pw_i2s01_clk_grp0,
 			&pw_i2s01_clk_grp0_mux),
 	FUNCTION("pw_i2s01_clk_m1",
 			pw_i2s01_clk_grp1,
 			&pw_i2s01_clk_grp1_mux),
-	FUNCTION("pw_pwm0", pw_pwm0_grp, &pw_pwm0_grp_mux),
-	FUNCTION("pw_pwm1", pw_pwm1_grp, &pw_pwm1_grp_mux),
+	FUNCTION("pw_i2s01_clk_m2",
+			pw_i2s01_clk_grp2,
+			&pw_i2s01_clk_grp2_mux),
+	FUNCTION("pw_pwm0_m0", pw_pwm0_grp0, &pw_pwm0_grp0_mux),
+	FUNCTION("pw_pwm0_m1", pw_pwm0_grp1, &pw_pwm0_grp1_mux),
+	FUNCTION("pw_pwm1_m0", pw_pwm1_grp0, &pw_pwm1_grp0_mux),
+	FUNCTION("pw_pwm1_m1", pw_pwm1_grp1, &pw_pwm1_grp1_mux),
+	FUNCTION("pw_pwm1_m2", pw_pwm1_grp2, &pw_pwm1_grp2_mux),
 	FUNCTION("pw_pwm2_m0", pw_pwm2_grp0, &pw_pwm2_grp0_mux),
 	FUNCTION("pw_pwm2_m1", pw_pwm2_grp1, &pw_pwm2_grp1_mux),
+	FUNCTION("pw_pwm2_m2", pw_pwm2_grp2, &pw_pwm2_grp2_mux),
 	FUNCTION("pw_pwm3_m0", pw_pwm3_grp0, &pw_pwm3_grp0_mux),
 	FUNCTION("pw_pwm3_m1", pw_pwm3_grp1, &pw_pwm3_grp1_mux),
 	FUNCTION("pw_pwm_cpu_vol_m0",
@@ -3434,6 +4656,9 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("pw_pwm_cpu_vol_m1",
 			pw_pwm_cpu_vol_grp1,
 			&pw_pwm_cpu_vol_grp1_mux),
+	FUNCTION("pw_pwm_cpu_vol_m2",
+			pw_pwm_cpu_vol_grp2,
+			&pw_pwm_cpu_vol_grp2_mux),
 	FUNCTION("pw_backlight_m0",
 			pw_backlight_grp0,
 			&pw_backlight_grp0_mux),
@@ -3456,8 +4681,11 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("sd1", sd1_grp, &sd1_grp_mux),
 	FUNCTION("sd1_4bit_m0", sd1_4bit_grp0, &sd1_4bit_grp0_mux),
 	FUNCTION("sd1_4bit_m1", sd1_4bit_grp1, &sd1_4bit_grp1_mux),
-	FUNCTION("sd2_m0", sd2_grp0, &sd2_grp0_mux),
-	FUNCTION("sd2_no_cdb_m0", sd2_no_cdb_grp0, &sd2_no_cdb_grp0_mux),
+	FUNCTION("sd2_basic", sd2_basic_grp, &sd2_basic_grp_mux),
+	FUNCTION("sd2_cdb_m0", sd2_cdb_grp0, &sd2_cdb_grp0_mux),
+	FUNCTION("sd2_cdb_m1", sd2_cdb_grp1, &sd2_cdb_grp1_mux),
+	FUNCTION("sd2_wpb_m0", sd2_wpb_grp0, &sd2_wpb_grp0_mux),
+	FUNCTION("sd2_wpb_m1", sd2_wpb_grp1, &sd2_wpb_grp1_mux),
 	FUNCTION("sd3", sd3_grp, &sd3_grp_mux),
 	FUNCTION("sd5", sd5_grp, &sd5_grp_mux),
 	FUNCTION("sd6_m0", sd6_grp0, &sd6_grp0_mux),
@@ -3471,23 +4699,47 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("uart0", uart0_grp, &uart0_grp_mux),
 	FUNCTION("uart0_nopause", uart0_nopause_grp, &uart0_nopause_grp_mux),
 	FUNCTION("uart1", uart1_grp, &uart1_grp_mux),
-	FUNCTION("uart2", uart2_grp, &uart2_grp_mux),
-	FUNCTION("uart3_m0", uart3_grp0, &uart3_grp0_mux),
-	FUNCTION("uart3_m1", uart3_grp1, &uart3_grp1_mux),
-	FUNCTION("uart3_m2", uart3_grp2, &uart3_grp2_mux),
-	FUNCTION("uart3_m3", uart3_grp3, &uart3_grp3_mux),
-	FUNCTION("uart3_nopause_m0",
-			uart3_nopause_grp0,
-			&uart3_nopause_grp0_mux),
-	FUNCTION("uart3_nopause_m1",
-			uart3_nopause_grp1,
-			&uart3_nopause_grp1_mux),
-	FUNCTION("uart4_m0", uart4_grp0, &uart4_grp0_mux),
-	FUNCTION("uart4_m1", uart4_grp1, &uart4_grp1_mux),
-	FUNCTION("uart4_m2", uart4_grp2, &uart4_grp2_mux),
-	FUNCTION("uart4_nopause", uart4_nopause_grp, &uart4_nopause_grp_mux),
-	FUNCTION("usb0_drvvbus", usb0_drvvbus_grp, &usb0_drvvbus_grp_mux),
-	FUNCTION("usb1_drvvbus", usb1_drvvbus_grp, &usb1_drvvbus_grp_mux),
+	FUNCTION("uart2_cts_m0", uart2_cts_grp0, &uart2_cts_grp0_mux),
+	FUNCTION("uart2_cts_m1", uart2_cts_grp1, &uart2_cts_grp1_mux),
+	FUNCTION("uart2_rts_m0", uart2_rts_grp0, &uart2_rts_grp0_mux),
+	FUNCTION("uart2_rts_m1", uart2_rts_grp1, &uart2_rts_grp1_mux),
+	FUNCTION("uart2_rxd_m0", uart2_rxd_grp0, &uart2_rxd_grp0_mux),
+	FUNCTION("uart2_rxd_m1", uart2_rxd_grp1, &uart2_rxd_grp1_mux),
+	FUNCTION("uart2_rxd_m2", uart2_rxd_grp2, &uart2_rxd_grp2_mux),
+	FUNCTION("uart2_txd_m0", uart2_txd_grp0, &uart2_txd_grp0_mux),
+	FUNCTION("uart2_txd_m1", uart2_txd_grp1, &uart2_txd_grp1_mux),
+	FUNCTION("uart2_txd_m2", uart2_txd_grp2, &uart2_txd_grp2_mux),
+	FUNCTION("uart3_cts_m0", uart3_cts_grp0, &uart3_cts_grp0_mux),
+	FUNCTION("uart3_cts_m1", uart3_cts_grp1, &uart3_cts_grp1_mux),
+	FUNCTION("uart3_cts_m2", uart3_cts_grp2, &uart3_cts_grp2_mux),
+	FUNCTION("uart3_rts_m0", uart3_rts_grp0, &uart3_rts_grp0_mux),
+	FUNCTION("uart3_rts_m1", uart3_rts_grp1, &uart3_rts_grp1_mux),
+	FUNCTION("uart3_rts_m2", uart3_rts_grp2, &uart3_rts_grp2_mux),
+	FUNCTION("uart3_rxd_m0", uart3_rxd_grp0, &uart3_rxd_grp0_mux),
+	FUNCTION("uart3_rxd_m1", uart3_rxd_grp1, &uart3_rxd_grp1_mux),
+	FUNCTION("uart3_rxd_m2", uart3_rxd_grp2, &uart3_rxd_grp2_mux),
+	FUNCTION("uart3_txd_m0", uart3_txd_grp0, &uart3_txd_grp0_mux),
+	FUNCTION("uart3_txd_m1", uart3_txd_grp1, &uart3_txd_grp1_mux),
+	FUNCTION("uart3_txd_m2", uart3_txd_grp2, &uart3_txd_grp2_mux),
+	FUNCTION("uart4_basic", uart4_basic_grp, &uart4_basic_grp_mux),
+	FUNCTION("uart4_cts_m0", uart4_cts_grp0, &uart4_cts_grp0_mux),
+	FUNCTION("uart4_cts_m1", uart4_cts_grp1, &uart4_cts_grp1_mux),
+	FUNCTION("uart4_cts_m2", uart4_cts_grp2, &uart4_cts_grp2_mux),
+	FUNCTION("uart4_rts_m0", uart4_rts_grp0, &uart4_rts_grp0_mux),
+	FUNCTION("uart4_rts_m1", uart4_rts_grp1, &uart4_rts_grp1_mux),
+	FUNCTION("uart4_rts_m2", uart4_rts_grp2, &uart4_rts_grp2_mux),
+	FUNCTION("usb0_drvvbus_m0",
+			usb0_drvvbus_grp0,
+			&usb0_drvvbus_grp0_mux),
+	FUNCTION("usb0_drvvbus_m1",
+			usb0_drvvbus_grp1,
+			&usb0_drvvbus_grp1_mux),
+	FUNCTION("usb1_drvvbus_m0",
+			usb1_drvvbus_grp0,
+			&usb1_drvvbus_grp0_mux),
+	FUNCTION("usb1_drvvbus_m1",
+			usb1_drvvbus_grp1,
+			&usb1_drvvbus_grp1_mux),
 	FUNCTION("visbus_dout", visbus_dout_grp, &visbus_dout_grp_mux),
 	FUNCTION("vi_vip1", vi_vip1_grp, &vi_vip1_grp_mux),
 	FUNCTION("vi_vip1_ext", vi_vip1_ext_grp, &vi_vip1_ext_grp_mux),
-- 
1.9.1

