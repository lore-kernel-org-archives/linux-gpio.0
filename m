From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 3/5] pinctrl: atlas7: adjust pin groups of atlas7 nanddisk
Date: Mon, 30 Nov 2015 06:05:55 +0000
Message-ID: <1448863557-25352-3-git-send-email-21cnbao@gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34956 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752715AbbK3Fzr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 00:55:47 -0500
Received: by pacej9 with SMTP id ej9so173483817pac.2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 21:55:47 -0800 (PST)
In-Reply-To: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Wei Chen <Wei.Chen@csr.com>

Remove write-protect and chip-selector pins from nand pin group.
And then create two separate pin groups for these two pin.

So the nand driver can choose correct pin groups as board desgin:
For example:
1. nand without wp&cs:
	nand@17050000 {
		pinctrl-0 = <&nd_df_basic_pmx>;
	};
2. nand with wp
        nand@17050000 {
                pinctrl-0 = <&nd_df_basic_pmx &nd_df_wp_pmx>;
        };
3. nand with cs:
        nand@17050000 {
                pinctrl-0 = <&nd_df_basic_pmx &nd_df_cs_pmx>;
        };
4. nand with wp&cs:
        nand@17050000 {
                pinctrl-0 = <&nd_df_basic_pmx &nd_df_wp_pmx &nd_df_cs_pmx>;
        };

Signed-off-by: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 88 +++++++++++------------------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 47c63c5..f73eff5 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -889,12 +889,10 @@ static const unsigned int lr_lcdrom_pins[] = { 73, 54, 57, 58, 59, 60, 61,
 		62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 56, 53, 55, };
 static const unsigned int lvds_analog_pins[] = { 149, 150, 151, 152, 153, 154,
 		155, 156, 157, 158, };
-static const unsigned int nd_df_pins[] = { 44, 43, 42, 41, 40, 39, 38, 37,
-		47, 46, 52, 51, 45, 49, 50, 48, 124, };
-static const unsigned int nd_df_nowp_pins[] = { 44, 43, 42, 41, 40, 39, 38,
-		37, 47, 46, 52, 51, 45, 49, 50, 48, };
-static const unsigned int nd_df_nocs_pins[] = { 44, 43, 42, 41, 40, 39, 38,
-		37, 47, 46, 52, 45, 49, 50, 48, 124, };
+static const unsigned int nd_df_basic_pins[] = { 44, 43, 42, 41, 40, 39, 38,
+		37, 47, 46, 52, 45, 49, 50, 48, };
+static const unsigned int nd_df_wp_pins[] = { 124, };
+static const unsigned int nd_df_cs_pins[] = { 51, };
 static const unsigned int ps_pins[] = { 120, 119, 121, };
 static const unsigned int pwc_core_on_pins[] = { 8, };
 static const unsigned int pwc_ext_on_pins[] = { 6, };
@@ -1148,9 +1146,9 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("ld_ldd_lck_grp", ld_ldd_lck_pins),
 	GROUP("lr_lcdrom_grp", lr_lcdrom_pins),
 	GROUP("lvds_analog_grp", lvds_analog_pins),
-	GROUP("nd_df_grp", nd_df_pins),
-	GROUP("nd_df_nowp_grp", nd_df_nowp_pins),
-	GROUP("nd_df_nocs_grp", nd_df_nocs_pins),
+	GROUP("nd_df_basic_grp", nd_df_basic_pins),
+	GROUP("nd_df_wp_grp", nd_df_wp_pins),
+	GROUP("nd_df_cs_grp", nd_df_cs_pins),
 	GROUP("ps_grp", ps_pins),
 	GROUP("pwc_core_on_grp", pwc_core_on_pins),
 	GROUP("pwc_ext_on_grp", pwc_ext_on_pins),
@@ -1428,9 +1426,9 @@ static const char * const ld_ldd_fck_grp[] = { "ld_ldd_fck_grp", };
 static const char * const ld_ldd_lck_grp[] = { "ld_ldd_lck_grp", };
 static const char * const lr_lcdrom_grp[] = { "lr_lcdrom_grp", };
 static const char * const lvds_analog_grp[] = { "lvds_analog_grp", };
-static const char * const nd_df_grp[] = { "nd_df_grp", };
-static const char * const nd_df_nowp_grp[] = { "nd_df_nowp_grp", };
-static const char * const nd_df_nocs_grp[] = { "nd_df_nocs_grp", };
+static const char * const nd_df_basic_grp[] = { "nd_df_basic_grp", };
+static const char * const nd_df_wp_grp[] = { "nd_df_wp_grp", };
+static const char * const nd_df_cs_grp[] = { "nd_df_cs_grp", };
 static const char * const ps_grp[] = { "ps_grp", };
 static const char * const pwc_core_on_grp[] = { "pwc_core_on_grp", };
 static const char * const pwc_ext_on_grp[] = { "pwc_ext_on_grp", };
@@ -3182,7 +3180,7 @@ static struct atlas7_grp_mux lvds_analog_grp_mux = {
 	.pad_mux_list = lvds_analog_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux nd_df_grp_pad_mux[] = {
+static struct atlas7_pad_mux nd_df_basic_grp_pad_mux[] = {
 	MUX(1, 44, 1, N, N, N, N),
 	MUX(1, 43, 1, N, N, N, N),
 	MUX(1, 42, 1, N, N, N, N),
@@ -3194,65 +3192,33 @@ static struct atlas7_pad_mux nd_df_grp_pad_mux[] = {
 	MUX(1, 47, 1, N, N, N, N),
 	MUX(1, 46, 1, N, N, N, N),
 	MUX(1, 52, 1, N, N, N, N),
-	MUX(1, 51, 1, N, N, N, N),
 	MUX(1, 45, 1, N, N, N, N),
 	MUX(1, 49, 1, N, N, N, N),
 	MUX(1, 50, 1, N, N, N, N),
 	MUX(1, 48, 1, N, N, N, N),
-	MUX(1, 124, 4, N, N, N, N),
 };
 
-static struct atlas7_grp_mux nd_df_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(nd_df_grp_pad_mux),
-	.pad_mux_list = nd_df_grp_pad_mux,
+static struct atlas7_grp_mux nd_df_basic_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(nd_df_basic_grp_pad_mux),
+	.pad_mux_list = nd_df_basic_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux nd_df_nowp_grp_pad_mux[] = {
-	MUX(1, 44, 1, N, N, N, N),
-	MUX(1, 43, 1, N, N, N, N),
-	MUX(1, 42, 1, N, N, N, N),
-	MUX(1, 41, 1, N, N, N, N),
-	MUX(1, 40, 1, N, N, N, N),
-	MUX(1, 39, 1, N, N, N, N),
-	MUX(1, 38, 1, N, N, N, N),
-	MUX(1, 37, 1, N, N, N, N),
-	MUX(1, 47, 1, N, N, N, N),
-	MUX(1, 46, 1, N, N, N, N),
-	MUX(1, 52, 1, N, N, N, N),
-	MUX(1, 51, 1, N, N, N, N),
-	MUX(1, 45, 1, N, N, N, N),
-	MUX(1, 49, 1, N, N, N, N),
-	MUX(1, 50, 1, N, N, N, N),
-	MUX(1, 48, 1, N, N, N, N),
+static struct atlas7_pad_mux nd_df_wp_grp_pad_mux[] = {
+	MUX(1, 124, 4, N, N, N, N),
 };
 
-static struct atlas7_grp_mux nd_df_nowp_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(nd_df_nowp_grp_pad_mux),
-	.pad_mux_list = nd_df_nowp_grp_pad_mux,
+static struct atlas7_grp_mux nd_df_wp_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(nd_df_wp_grp_pad_mux),
+	.pad_mux_list = nd_df_wp_grp_pad_mux,
 };
 
-static struct atlas7_pad_mux nd_df_nocs_grp_pad_mux[] = {
-	MUX(1, 44, 1, N, N, N, N),
-	MUX(1, 43, 1, N, N, N, N),
-	MUX(1, 42, 1, N, N, N, N),
-	MUX(1, 41, 1, N, N, N, N),
-	MUX(1, 40, 1, N, N, N, N),
-	MUX(1, 39, 1, N, N, N, N),
-	MUX(1, 38, 1, N, N, N, N),
-	MUX(1, 37, 1, N, N, N, N),
-	MUX(1, 47, 1, N, N, N, N),
-	MUX(1, 46, 1, N, N, N, N),
-	MUX(1, 52, 1, N, N, N, N),
-	MUX(1, 45, 1, N, N, N, N),
-	MUX(1, 49, 1, N, N, N, N),
-	MUX(1, 50, 1, N, N, N, N),
-	MUX(1, 48, 1, N, N, N, N),
-	MUX(1, 124, 4, N, N, N, N),
+static struct atlas7_pad_mux nd_df_cs_grp_pad_mux[] = {
+	MUX(1, 51, 1, N, N, N, N),
 };
 
-static struct atlas7_grp_mux nd_df_nocs_grp_mux = {
-	.pad_mux_count = ARRAY_SIZE(nd_df_nocs_grp_pad_mux),
-	.pad_mux_list = nd_df_nocs_grp_pad_mux,
+static struct atlas7_grp_mux nd_df_cs_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(nd_df_cs_grp_pad_mux),
+	.pad_mux_list = nd_df_cs_grp_pad_mux,
 };
 
 static struct atlas7_pad_mux ps_grp_pad_mux[] = {
@@ -4630,9 +4596,9 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("ld_ldd_lck", ld_ldd_lck_grp, &ld_ldd_lck_grp_mux),
 	FUNCTION("lr_lcdrom", lr_lcdrom_grp, &lr_lcdrom_grp_mux),
 	FUNCTION("lvds_analog", lvds_analog_grp, &lvds_analog_grp_mux),
-	FUNCTION("nd_df", nd_df_grp, &nd_df_grp_mux),
-	FUNCTION("nd_df_nowp", nd_df_nowp_grp, &nd_df_nowp_grp_mux),
-	FUNCTION("nd_df_nocs", nd_df_nocs_grp, &nd_df_nocs_grp_mux),
+	FUNCTION("nd_df_basic", nd_df_basic_grp, &nd_df_basic_grp_mux),
+	FUNCTION("nd_df_wp", nd_df_wp_grp, &nd_df_wp_grp_mux),
+	FUNCTION("nd_df_cs", nd_df_cs_grp, &nd_df_cs_grp_mux),
 	FUNCTION("ps", ps_grp, &ps_grp_mux),
 	FUNCTION("pwc_core_on", pwc_core_on_grp, &pwc_core_on_grp_mux),
 	FUNCTION("pwc_ext_on", pwc_ext_on_grp, &pwc_ext_on_grp_mux),
-- 
1.9.1

