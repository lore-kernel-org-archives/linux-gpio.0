From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a779[01]: move 'union vin_data' to shared header file
Date: Wed, 23 Sep 2015 01:06:21 +0300
Message-ID: <20048813.n6aqe5klWJ@wasted.cogentembedded.com>
References: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:35260 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934926AbbIVWGZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2015 18:06:25 -0400
Received: by lagj9 with SMTP id j9so29990605lag.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2015 15:06:24 -0700 (PDT)
In-Reply-To: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

R8A7790/1 PFC  drivers use almost identical  'union vin_data' and completely
identical VIN_DATA_PIN_GROUP() macro; we thus can  move them into the shared
header file...

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git' repo.

Changed in version 2:
- removed leftover empty line from the R8A7790 driver;
- added Geert's ACK.

 drivers/pinctrl/sh-pfc/pfc-r8a7790.c |   19 -------------------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c |   18 ------------------
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   18 ++++++++++++++++++
 3 files changed, 18 insertions(+), 37 deletions(-)

Index: renesas/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
===================================================================
--- renesas.orig/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ renesas/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -3624,25 +3624,6 @@ static const unsigned int usb2_pins[] =
 static const unsigned int usb2_mux[] = {
 	USB2_PWEN_MARK, USB2_OVC_MARK,
 };
-
-union vin_data {
-	unsigned int data24[24];
-	unsigned int data20[20];
-	unsigned int data16[16];
-	unsigned int data12[12];
-	unsigned int data10[10];
-	unsigned int data8[8];
-	unsigned int data4[4];
-};
-
-#define VIN_DATA_PIN_GROUP(n, s)				\
-	{							\
-		.name = #n#s,					\
-		.pins = n##_pins.data##s,			\
-		.mux = n##_mux.data##s,				\
-		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
-	}
-
 /* - VIN0 ------------------------------------------------------------------- */
 static const union vin_data vin0_data_pins = {
 	.data24 = {
Index: renesas/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
===================================================================
--- renesas.orig/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ renesas/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -3986,24 +3986,6 @@ static const unsigned int usb1_mux[] = {
 	USB1_PWEN_MARK,
 	USB1_OVC_MARK,
 };
-
-union vin_data {
-	unsigned int data24[24];
-	unsigned int data20[20];
-	unsigned int data16[16];
-	unsigned int data12[12];
-	unsigned int data10[10];
-	unsigned int data8[8];
-};
-
-#define VIN_DATA_PIN_GROUP(n, s)				\
-	{							\
-		.name = #n#s,					\
-		.pins = n##_pins.data##s,			\
-		.mux = n##_mux.data##s,				\
-		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
-	}
-
 /* - VIN0 ------------------------------------------------------------------- */
 static const union vin_data vin0_data_pins = {
 	.data24 = {
Index: renesas/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- renesas.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ renesas/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -52,6 +52,24 @@ struct sh_pfc_pin_group {
 	unsigned int nr_pins;
 };
 
+#define VIN_DATA_PIN_GROUP(n, s)				\
+	{							\
+		.name = #n#s,					\
+		.pins = n##_pins.data##s,			\
+		.mux = n##_mux.data##s,				\
+		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
+	}
+
+union vin_data {
+	unsigned int data24[24];
+	unsigned int data20[20];
+	unsigned int data16[16];
+	unsigned int data12[12];
+	unsigned int data10[10];
+	unsigned int data8[8];
+	unsigned int data4[4];
+};
+
 #define SH_PFC_FUNCTION(n)				\
 	{						\
 		.name = #n,				\

