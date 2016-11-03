From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 4/4] pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins
Date: Thu,  3 Nov 2016 17:15:30 +0100
Message-ID: <20161103161530.11763-5-niklas.soderlund+renesas@ragnatech.se>
References: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:59063 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757832AbcKCQQs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 12:16:48 -0400
In-Reply-To: <20161103161530.11763-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Group the QSPI0 and QSPI1 pins into similar groups found in other sh-pfc
drivers.  The pins can not be muxed between functions other then QSPI
but there drive strength can be controlled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index c503f97..f90cb7f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3719,6 +3719,55 @@ static const unsigned int usb2_mux[] = {
 	USB2_PWEN_MARK, USB2_OVC_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* QSPI0_SPCLK, QSPI0_SSL */
+	PIN_NUMBER('W', 3), PIN_NUMBER('Y', 3),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data2_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
+	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
+};
+static const unsigned int qspi0_data2_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+};
+static const unsigned int qspi0_data4_pins[] = {
+	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1, QSPI0_IO2, QSPI0_IO3 */
+	PIN_A_NUMBER('C', 5), PIN_A_NUMBER('B', 4),
+	PIN_NUMBER('Y', 6), PIN_A_NUMBER('B', 6),
+};
+static const unsigned int qspi0_data4_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+};
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* QSPI1_SPCLK, QSPI1_SSL */
+	PIN_NUMBER('V', 3), PIN_NUMBER('V', 5),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data2_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
+	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
+};
+static const unsigned int qspi1_data2_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+};
+static const unsigned int qspi1_data4_pins[] = {
+	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1, QSPI1_IO2, QSPI1_IO3 */
+	PIN_A_NUMBER('C', 7), PIN_A_NUMBER('E', 5),
+	PIN_A_NUMBER('E', 4), PIN_A_NUMBER('C', 3),
+};
+static const unsigned int qspi1_data4_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -4019,6 +4068,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb2),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	SH_PFC_PIN_GROUP(qspi0_data2),
+	SH_PFC_PIN_GROUP(qspi0_data4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	SH_PFC_PIN_GROUP(qspi1_data2),
+	SH_PFC_PIN_GROUP(qspi1_data4),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4464,6 +4519,18 @@ static const char * const usb2_groups[] = {
 	"usb2",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4513,6 +4580,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb2),
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.10.2

