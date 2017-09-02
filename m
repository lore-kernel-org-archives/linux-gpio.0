From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: include <linux/build_bug.h> instead of <linux/bug.h>
Date: Sun,  3 Sep 2017 02:26:18 +0900
Message-ID: <1504373178-1022-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:47476 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751436AbdIBR1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Sep 2017 13:27:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The #includes <linux/bug.h> is here to use BUILD_BUG_ON_ZERO().

Thanks to commit bc6245e5efd7 ("bug: split BUILD_BUG stuff out into
<linux/build_bug.h>"), it is now possible to reduce the number of
headers pulled in.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier.h b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
index c075ecb8e5db..0a3d2ac27503 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier.h
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
@@ -17,7 +17,7 @@
 #define __PINCTRL_UNIPHIER_H__
 
 #include <linux/bitops.h>
-#include <linux/bug.h>
+#include <linux/build_bug.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 
-- 
2.7.4

