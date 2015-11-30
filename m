From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 1/5] pinctrl: atlas7: add pingroup with reduced cs line for atlas7 nand
Date: Mon, 30 Nov 2015 06:05:53 +0000
Message-ID: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:36352 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325AbbK3Fzm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 00:55:42 -0500
Received: by pacdm15 with SMTP id dm15so173583108pac.3
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 21:55:42 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Wei Chen <Wei.Chen@csr.com>

The nand in atlas7 has two chip select line. But in most time, the
nand only has one chip, so only one chip select line is enough.
The nand driver select this new pin group can free one chip select
line for other modules to avoid pin conflict.

Signed-off-by: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 829018c..30db524 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -889,6 +889,8 @@ static const unsigned int nd_df_pins[] = { 44, 43, 42, 41, 40, 39, 38, 37,
 		47, 46, 52, 51, 45, 49, 50, 48, 124, };
 static const unsigned int nd_df_nowp_pins[] = { 44, 43, 42, 41, 40, 39, 38,
 		37, 47, 46, 52, 51, 45, 49, 50, 48, };
+static const unsigned int nd_df_nocs_pins[] = { 44, 43, 42, 41, 40, 39, 38,
+		37, 47, 46, 52, 45, 49, 50, 48, 124, };
 static const unsigned int ps_pins[] = { 120, 119, 121, };
 static const unsigned int pwc_core_on_pins[] = { 8, };
 static const unsigned int pwc_ext_on_pins[] = { 6, };
@@ -1144,6 +1146,7 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("lvds_analog_grp", lvds_analog_pins),
 	GROUP("nd_df_grp", nd_df_pins),
 	GROUP("nd_df_nowp_grp", nd_df_nowp_pins),
+	GROUP("nd_df_nocs_grp", nd_df_nocs_pins),
 	GROUP("ps_grp", ps_pins),
 	GROUP("pwc_core_on_grp", pwc_core_on_pins),
 	GROUP("pwc_ext_on_grp", pwc_ext_on_pins),
@@ -1423,6 +1426,7 @@ static const char * const lr_lcdrom_grp[] = { "lr_lcdrom_grp", };
 static const char * const lvds_analog_grp[] = { "lvds_analog_grp", };
 static const char * const nd_df_grp[] = { "nd_df_grp", };
 static const char * const nd_df_nowp_grp[] = { "nd_df_nowp_grp", };
+static const char * const nd_df_nocs_grp[] = { "nd_df_nocs_grp", };
 static const char * const ps_grp[] = { "ps_grp", };
 static const char * const pwc_core_on_grp[] = { "pwc_core_on_grp", };
 static const char * const pwc_ext_on_grp[] = { "pwc_ext_on_grp", };
@@ -3223,6 +3227,30 @@ static struct atlas7_grp_mux nd_df_nowp_grp_mux = {
 	.pad_mux_list = nd_df_nowp_grp_pad_mux,
 };
 
+static struct atlas7_pad_mux nd_df_nocs_grp_pad_mux[] = {
+	MUX(1, 44, 1, N, N, N, N),
+	MUX(1, 43, 1, N, N, N, N),
+	MUX(1, 42, 1, N, N, N, N),
+	MUX(1, 41, 1, N, N, N, N),
+	MUX(1, 40, 1, N, N, N, N),
+	MUX(1, 39, 1, N, N, N, N),
+	MUX(1, 38, 1, N, N, N, N),
+	MUX(1, 37, 1, N, N, N, N),
+	MUX(1, 47, 1, N, N, N, N),
+	MUX(1, 46, 1, N, N, N, N),
+	MUX(1, 52, 1, N, N, N, N),
+	MUX(1, 45, 1, N, N, N, N),
+	MUX(1, 49, 1, N, N, N, N),
+	MUX(1, 50, 1, N, N, N, N),
+	MUX(1, 48, 1, N, N, N, N),
+	MUX(1, 124, 4, N, N, N, N),
+};
+
+static struct atlas7_grp_mux nd_df_nocs_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(nd_df_nocs_grp_pad_mux),
+	.pad_mux_list = nd_df_nocs_grp_pad_mux,
+};
+
 static struct atlas7_pad_mux ps_grp_pad_mux[] = {
 	MUX(1, 120, 2, N, N, N, N),
 	MUX(1, 119, 2, N, N, N, N),
@@ -4600,6 +4628,7 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("lvds_analog", lvds_analog_grp, &lvds_analog_grp_mux),
 	FUNCTION("nd_df", nd_df_grp, &nd_df_grp_mux),
 	FUNCTION("nd_df_nowp", nd_df_nowp_grp, &nd_df_nowp_grp_mux),
+	FUNCTION("nd_df_nocs", nd_df_nocs_grp, &nd_df_nocs_grp_mux),
 	FUNCTION("ps", ps_grp, &ps_grp_mux),
 	FUNCTION("pwc_core_on", pwc_core_on_grp, &pwc_core_on_grp_mux),
 	FUNCTION("pwc_ext_on", pwc_ext_on_grp, &pwc_ext_on_grp_mux),
-- 
1.9.1

