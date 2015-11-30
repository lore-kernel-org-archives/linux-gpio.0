From: Barry Song <21cnbao@gmail.com>
Subject: [PATCH 5/5] pinctrl: atlas7: add pulse conter pin group without direction pin
Date: Mon, 30 Nov 2015 06:05:57 +0000
Message-ID: <1448863557-25352-5-git-send-email-21cnbao@gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:33555 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752715AbbK3Fzx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 00:55:53 -0500
Received: by pabfh17 with SMTP id fh17so178812227pab.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 21:55:53 -0800 (PST)
In-Reply-To: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: workgroup.linux@csr.com, Guoying Zhang <Guoying.Zhang@csr.com>, Barry Song <Baohua.Song@csr.com>

From: Guoying Zhang <Guoying.Zhang@csr.com>

DR needs use the pulse counter direction pin as common gpio
function.

Signed-off-by: Guoying Zhang <Guoying.Zhang@csr.com>
Signed-off-by: Barry Song <Baohua.Song@csr.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index fc9c3f7..053d98e 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -894,6 +894,7 @@ static const unsigned int nd_df_basic_pins[] = { 44, 43, 42, 41, 40, 39, 38,
 static const unsigned int nd_df_wp_pins[] = { 124, };
 static const unsigned int nd_df_cs_pins[] = { 51, };
 static const unsigned int ps_pins[] = { 120, 119, 121, };
+static const unsigned int ps_no_dir_pins[] = { 119, };
 static const unsigned int pwc_core_on_pins[] = { 8, };
 static const unsigned int pwc_ext_on_pins[] = { 6, };
 static const unsigned int pwc_gpio3_clk_pins[] = { 3, };
@@ -1150,6 +1151,7 @@ struct atlas7_pin_group altas7_pin_groups[] = {
 	GROUP("nd_df_wp_grp", nd_df_wp_pins),
 	GROUP("nd_df_cs_grp", nd_df_cs_pins),
 	GROUP("ps_grp", ps_pins),
+	GROUP("ps_no_dir_grp", ps_no_dir_pins),
 	GROUP("pwc_core_on_grp", pwc_core_on_pins),
 	GROUP("pwc_ext_on_grp", pwc_ext_on_pins),
 	GROUP("pwc_gpio3_clk_grp", pwc_gpio3_clk_pins),
@@ -1430,6 +1432,7 @@ static const char * const nd_df_basic_grp[] = { "nd_df_basic_grp", };
 static const char * const nd_df_wp_grp[] = { "nd_df_wp_grp", };
 static const char * const nd_df_cs_grp[] = { "nd_df_cs_grp", };
 static const char * const ps_grp[] = { "ps_grp", };
+static const char * const ps_no_dir_grp[] = { "ps_no_dir_grp", };
 static const char * const pwc_core_on_grp[] = { "pwc_core_on_grp", };
 static const char * const pwc_ext_on_grp[] = { "pwc_ext_on_grp", };
 static const char * const pwc_gpio3_clk_grp[] = { "pwc_gpio3_clk_grp", };
@@ -3232,6 +3235,15 @@ static struct atlas7_grp_mux ps_grp_mux = {
 	.pad_mux_list = ps_grp_pad_mux,
 };
 
+static struct atlas7_pad_mux ps_no_dir_grp_pad_mux[] = {
+	MUX(1, 119, 2, N, N, N, N),
+};
+
+static struct atlas7_grp_mux ps_no_dir_grp_mux = {
+	.pad_mux_count = ARRAY_SIZE(ps_no_dir_grp_pad_mux),
+	.pad_mux_list = ps_no_dir_grp_pad_mux,
+};
+
 static struct atlas7_pad_mux pwc_core_on_grp_pad_mux[] = {
 	MUX(0, 8, 1, N, N, N, N),
 };
@@ -4606,6 +4618,7 @@ static struct atlas7_pmx_func atlas7_pmx_functions[] = {
 	FUNCTION("nd_df_wp", nd_df_wp_grp, &nd_df_wp_grp_mux),
 	FUNCTION("nd_df_cs", nd_df_cs_grp, &nd_df_cs_grp_mux),
 	FUNCTION("ps", ps_grp, &ps_grp_mux),
+	FUNCTION("ps_no_dir", ps_no_dir_grp, &ps_no_dir_grp_mux),
 	FUNCTION("pwc_core_on", pwc_core_on_grp, &pwc_core_on_grp_mux),
 	FUNCTION("pwc_ext_on", pwc_ext_on_grp, &pwc_ext_on_grp_mux),
 	FUNCTION("pwc_gpio3_clk", pwc_gpio3_clk_grp, &pwc_gpio3_clk_grp_mux),
-- 
1.9.1

