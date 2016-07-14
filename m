From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: add CAN pin groups
Date: Thu, 14 Jul 2016 22:51:40 +0300
Message-ID: <9478063.142ffU0CUS@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33635 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160AbcGNTvp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2016 15:51:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id b199so72400147lfe.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jul 2016 12:51:44 -0700 (PDT)
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be

Add CAN0/1 data/clock pin groups to R8A7792 PFC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus my 4 R8A7792 PFC patches posted before...

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |   37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -809,6 +809,28 @@ static const unsigned int avb_avtp_match
 static const unsigned int avb_avtp_match_mux[] = {
 	AVB_AVTP_MATCH_MARK,
 };
+/* - CAN -------------------------------------------------------------------- */
+static const unsigned int can0_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(10, 27), RCAR_GP_PIN(10, 28),
+};
+static const unsigned int can0_data_mux[] = {
+	CAN0_TX_MARK, CAN0_RX_MARK,
+};
+static const unsigned int can1_data_pins[] = {
+	/* TX, RX */
+	RCAR_GP_PIN(10, 30), RCAR_GP_PIN(10, 31),
+};
+static const unsigned int can1_data_mux[] = {
+	CAN1_TX_MARK, CAN1_RX_MARK,
+};
+static const unsigned int can_clk_pins[] = {
+	/* CAN_CLK */
+	RCAR_GP_PIN(10, 29),
+};
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
 /* - INTC ------------------------------------------------------------------- */
 static const unsigned int intc_irq0_pins[] = {
 	/* IRQ0 */
@@ -978,6 +1000,9 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(avb_gmii),
 	SH_PFC_PIN_GROUP(avb_avtp_match),
+	SH_PFC_PIN_GROUP(can0_data),
+	SH_PFC_PIN_GROUP(can1_data),
+	SH_PFC_PIN_GROUP(can_clk),
 	SH_PFC_PIN_GROUP(intc_irq0),
 	SH_PFC_PIN_GROUP(intc_irq1),
 	SH_PFC_PIN_GROUP(intc_irq2),
@@ -1012,6 +1037,16 @@ static const char * const avb_groups[] =
 	"avb_avtp_match",
 };
 
+static const char * const can0_groups[] = {
+	"can0_data",
+	"can_clk",
+};
+
+static const char * const can1_groups[] = {
+	"can1_data",
+	"can_clk",
+};
+
 static const char * const intc_groups[] = {
 	"intc_irq0",
 	"intc_irq1",
@@ -1051,6 +1086,8 @@ static const char * const sdhi0_groups[]
 
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
+	SH_PFC_FUNCTION(can0),
+	SH_PFC_FUNCTION(can1),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(lbsc),
 	SH_PFC_FUNCTION(scif0),

