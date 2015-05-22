From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: use "const struct ..." rather than "struct ... const"
Date: Fri, 22 May 2015 15:25:50 +0900
Message-ID: <1432275950-15374-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:30016 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752677AbbEVGZq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 May 2015 02:25:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

Only this member, pins, is defined as "struct ... const *", but the
others in this struct, pinlops, pmxops, confops, etc. are defined as
"const struct ... *".

Swap the "struct pinctrl_pin_desc" and "const" for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 66e4697..9ba59fc 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -127,7 +127,7 @@ struct pinctrl_ops {
  */
 struct pinctrl_desc {
 	const char *name;
-	struct pinctrl_pin_desc const *pins;
+	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	const struct pinctrl_ops *pctlops;
 	const struct pinmux_ops *pmxops;
-- 
1.9.1

