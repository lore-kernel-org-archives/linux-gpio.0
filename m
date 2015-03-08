From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: staticise example code funcs/structs
Date: Sun,  8 Mar 2015 12:03:05 +0200
Message-ID: <c3ed2457215426bbb856f5ebff39bb97259403fb.1425808985.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45844 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751325AbbCHKDP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 8 Mar 2015 06:03:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Make the example code consistent wrt local function and struct definitions.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/pinctrl.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index b8f2147b96dd..3ba4661fd8b4 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -683,12 +683,12 @@ static const struct foo_pmx_func foo_functions[] = {
 	},
 };
 
-int foo_get_functions_count(struct pinctrl_dev *pctldev)
+static int foo_get_functions_count(struct pinctrl_dev *pctldev)
 {
 	return ARRAY_SIZE(foo_functions);
 }
 
-const char *foo_get_fname(struct pinctrl_dev *pctldev, unsigned selector)
+static const char *foo_get_fname(struct pinctrl_dev *pctldev, unsigned selector)
 {
 	return foo_functions[selector].name;
 }
@@ -702,7 +702,7 @@ static int foo_get_groups(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-int foo_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
+static int foo_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		unsigned group)
 {
 	u8 regbit = (1 << selector + group);
@@ -711,7 +711,7 @@ int foo_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-struct pinmux_ops foo_pmxops = {
+static struct pinmux_ops foo_pmxops = {
 	.get_functions_count = foo_get_functions_count,
 	.get_function_name = foo_get_fname,
 	.get_function_groups = foo_get_groups,
-- 
2.1.4

