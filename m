From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: join lines that can be a single line within 80 columns
Date: Sat,  1 Aug 2015 13:22:38 +0900
Message-ID: <1438402958-7744-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:63066 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750993AbbHAEWt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2015 00:22:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

There is no reason to break a line shorter than 80 columns.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinmux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 18ce18c..18a837f 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -313,8 +313,7 @@ static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
 
 	/* See if this pctldev has this function */
 	while (selector < nfuncs) {
-		const char *fname = ops->get_function_name(pctldev,
-							   selector);
+		const char *fname = ops->get_function_name(pctldev, selector);
 
 		if (!strcmp(function, fname))
 			return selector;
-- 
1.9.1

