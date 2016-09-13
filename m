From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/4] pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
Date: Tue, 13 Sep 2016 16:03:13 +0200
Message-ID: <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:54302 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756712AbcIMODc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 10:03:32 -0400
In-Reply-To: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Group the AVB pins into similar groups found in other sh-pfc drivers.
The pins can not be muxed between functions other then AVB but there
drive strength can be controlled.

The group avb_mdc containing ADV_MDC and ADV_MDIO are on other SoCs
called avb_mdio. In pfc-r8a7795 the adv_mdc group already existed and
is in use in DT. Therefor the ADV_MDIO pin to the existing group
instead of renaming it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 4a60f15..7b9a355 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1635,11 +1635,11 @@ static const unsigned int avb_phy_int_mux[] = {
 	AVB_PHY_INT_MARK,
 };
 static const unsigned int avb_mdc_pins[] = {
-	/* AVB_MDC */
-	RCAR_GP_PIN(2, 9),
+	/* AVB_MDC, AVB_MDIO */
+	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
 };
 static const unsigned int avb_mdc_mux[] = {
-	AVB_MDC_MARK,
+	AVB_MDC_MARK, AVB_MDIO_MARK,
 };
 static const unsigned int avb_avtp_pps_pins[] = {
 	/* AVB_AVTP_PPS */
@@ -1676,6 +1676,28 @@ static const unsigned int avb_avtp_capture_b_pins[] = {
 static const unsigned int avb_avtp_capture_b_mux[] = {
 	AVB_AVTP_CAPTURE_B_MARK,
 };
+static const unsigned int avb_mii_pins[] = {
+	/*
+	 * AVB_TX_CTL, AVB_TXC, AVB_TD0,
+	 * AVB_TD1, AVB_TD2, AVB_TD3,
+	 * AVB_RX_CTL, AVB_RXC, AVB_RD0,
+	 * AVB_RD1, AVB_RD2, AVB_RD3,
+	 * AVB_TXREFCLK
+	 */
+	PIN_NUMBER('A', 8), PIN_NUMBER('A', 19), PIN_NUMBER('A', 18),
+	PIN_NUMBER('B', 18), PIN_NUMBER('A', 17), PIN_NUMBER('B', 17),
+	PIN_NUMBER('A', 16), PIN_NUMBER('B', 19), PIN_NUMBER('A', 13),
+	PIN_NUMBER('B', 13), PIN_NUMBER('A', 14), PIN_NUMBER('B', 14),
+	PIN_NUMBER('A', 12),
+
+};
+static const unsigned int avb_mii_mux[] = {
+	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
+	AVB_TD1_MARK, AVB_TD2_MARK, AVB_TD3_MARK,
+	AVB_RX_CTL_MARK, AVB_RXC_MARK, AVB_RD0_MARK,
+	AVB_RD1_MARK, AVB_RD2_MARK, AVB_RD3_MARK,
+	AVB_TXREFCLK_MARK,
+};
 
 /* - CAN ------------------------------------------------------------------ */
 static const unsigned int can0_data_a_pins[] = {
@@ -3632,6 +3654,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
+	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(can0_data_a),
 	SH_PFC_PIN_GROUP(can0_data_b),
 	SH_PFC_PIN_GROUP(can1_data),
@@ -3928,6 +3951,7 @@ static const char * const avb_groups[] = {
 	"avb_avtp_capture_a",
 	"avb_avtp_match_b",
 	"avb_avtp_capture_b",
+	"avb_mii",
 };
 
 static const char * const can0_groups[] = {
-- 
2.9.3

