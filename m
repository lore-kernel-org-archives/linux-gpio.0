From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: include <linux/bits.h> instead of <linux/bitops.h>
Date: Tue, 16 Oct 2018 13:09:58 +0900
Message-ID: <1539662998-15467-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The reason of including <linux/bitops.h> here is just for BIT() macro.

Since commit 8bd9cb51daac8 ("locking/atomics, asm-generic: Move some
macros from <linux/bitops.h> to a new <linux/bits.h> file"),
<linux/bits.h> is enough for such compile-time macros.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier.h b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
index 0a3d2ac..c63e3c8 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier.h
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
@@ -16,7 +16,7 @@
 #ifndef __PINCTRL_UNIPHIER_H__
 #define __PINCTRL_UNIPHIER_H__
 
-#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
-- 
2.7.4
