From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] pinctrl: xway: Change structure initialisation to c99 style
Date: Sat, 11 Jun 2016 09:32:52 +0530
Message-ID: <20160611040252.GA20307@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33028 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbcFKEC7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jun 2016 00:02:59 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Replace the in order struct initialisation style with explicit field
style.

The Coccinelle semantic patch used to make this change is as follows:

@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@@
identifier decl.i1,i2,decl.fld;
expression e;
position bad.p, bad.fix;
@@

struct i1 i2@p = { ...,
+ .fld = e
- e@fix
 ,...};

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/pinctrl/pinctrl-xway.c | 72 ++++++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index a13f2b6..dac88a2 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1616,50 +1616,74 @@ struct pinctrl_xway_soc {
 
 /* xway xr9 series (DEPRECATED: Use XWAY xRX100/xRX200 Family) */
 static struct pinctrl_xway_soc xr9_pinctrl = {
-	XR9_MAX_PIN, xway_mfp,
-	xway_grps, ARRAY_SIZE(xway_grps),
-	xrx_funcs, ARRAY_SIZE(xrx_funcs),
-	xway_exin_pin_map, 6
+	.pin_count = XR9_MAX_PIN,
+	.mfp = xway_mfp,
+	.grps = xway_grps,
+	.num_grps = ARRAY_SIZE(xway_grps),
+	.funcs = xrx_funcs,
+	.num_funcs = ARRAY_SIZE(xrx_funcs),
+	.exin = xway_exin_pin_map,
+	.num_exin = 6
 };
 
 /* XWAY AMAZON Family */
 static struct pinctrl_xway_soc ase_pinctrl = {
-	ASE_MAX_PIN, ase_mfp,
-	ase_grps, ARRAY_SIZE(ase_grps),
-	ase_funcs, ARRAY_SIZE(ase_funcs),
-	ase_exin_pin_map, 3
+	.pin_count = ASE_MAX_PIN,
+	.mfp = ase_mfp,
+	.grps = ase_grps,
+	.num_grps = ARRAY_SIZE(ase_grps),
+	.funcs = ase_funcs,
+	.num_funcs = ARRAY_SIZE(ase_funcs),
+	.exin = ase_exin_pin_map,
+	.num_exin = 3
 };
 
 /* XWAY DANUBE Family */
 static struct pinctrl_xway_soc danube_pinctrl = {
-	DANUBE_MAX_PIN, danube_mfp,
-	danube_grps, ARRAY_SIZE(danube_grps),
-	danube_funcs, ARRAY_SIZE(danube_funcs),
-	danube_exin_pin_map, 3
+	.pin_count = DANUBE_MAX_PIN,
+	.mfp = danube_mfp,
+	.grps = danube_grps,
+	.num_grps = ARRAY_SIZE(danube_grps),
+	.funcs = danube_funcs,
+	.num_funcs = ARRAY_SIZE(danube_funcs),
+	.exin = danube_exin_pin_map,
+	.num-exin = 3
 };
 
 /* XWAY xRX100 Family */
 static struct pinctrl_xway_soc xrx100_pinctrl = {
-	XRX100_MAX_PIN, xrx100_mfp,
-	xrx100_grps, ARRAY_SIZE(xrx100_grps),
-	xrx100_funcs, ARRAY_SIZE(xrx100_funcs),
-	xrx100_exin_pin_map, 6
+	.pin_count = XRX100_MAX_PIN,
+	.mfp = xrx100_mfp,
+	.grps = xrx100_grps,
+	.num_grps = ARRAY_SIZE(xrx100_grps),
+	.funcs = xrx100_funcs,
+	.num_funcs = ARRAY_SIZE(xrx100_funcs),
+	.exin = xrx100_exin_pin_map,
+	.num_exin = 6
 };
 
 /* XWAY xRX200 Family */
 static struct pinctrl_xway_soc xrx200_pinctrl = {
-	XRX200_MAX_PIN, xrx200_mfp,
-	xrx200_grps, ARRAY_SIZE(xrx200_grps),
-	xrx200_funcs, ARRAY_SIZE(xrx200_funcs),
-	xrx200_exin_pin_map, 6
+	.pin_count = XRX200_MAX_PIN,
+	.mfp = xrx200_mfp,
+	.grps = xrx200_grps,
+	.num_grps = ARRAY_SIZE(xrx200_grps),
+	.funcs = xrx200_funcs,
+	.num_funcs = ARRAY_SIZE(xrx200_funcs),
+	.exin = xrx200_exin_pin_map,
+	.num_exin = 6
 };
 
 /* XWAY xRX300 Family */
 static struct pinctrl_xway_soc xrx300_pinctrl = {
-	XRX300_MAX_PIN, xrx300_mfp,
-	xrx300_grps, ARRAY_SIZE(xrx300_grps),
-	xrx300_funcs, ARRAY_SIZE(xrx300_funcs),
-	xrx300_exin_pin_map, 5
+	.pin_count = XRX300_MAX_PIN,
+	.mfp = xrx300_mfp,
+	.grps = xrx300_grps,
+	.num_grps = ARRAY_SIZE(xrx300_grps),
+	.funcs = xrx300_funcs,
+	.num_funcs = ARRAY_SIZE(xrx300_funcs),
+	.exin = xrx300_exin_pin_map,
+	.num_exin = 5
 };
 
 static struct pinctrl_gpio_range xway_gpio_range = {
-- 
1.9.1

