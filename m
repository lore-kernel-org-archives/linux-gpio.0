From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: remove useless const qualifier
Date: Fri, 22 May 2015 15:19:37 +0900
Message-ID: <1432275577-13016-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:35700 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751688AbbEVGTd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 May 2015 02:19:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

This "const" claims the get_function_groups callback never
changes the given num_groups pointer.  It is always true
in C language, so not worth mentioning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinmux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index 511bda9..d6e52cb 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,7 +66,7 @@ struct pinmux_ops {
 	int (*get_function_groups) (struct pinctrl_dev *pctldev,
 				  unsigned selector,
 				  const char * const **groups,
-				  unsigned * const num_groups);
+				  unsigned *num_groups);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned func_selector,
 			unsigned group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
-- 
1.9.1

