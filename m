From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: add __rcu annotations to fix sparse warnings
Date: Fri,  4 Aug 2017 13:52:05 +0900
Message-ID: <1501822325-25512-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Sparse reports "warning: incorrect type in assignment (different
address spaces)".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c   | 2 +-
 drivers/pinctrl/pinmux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 89b9ca77daea..60f82c67b92d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL_GPL(pinctrl_generic_remove_group);
 static void pinctrl_generic_free_groups(struct pinctrl_dev *pctldev)
 {
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 
 	radix_tree_for_each_slot(slot, &pctldev->pin_group_tree, &iter, 0)
 		radix_tree_delete(&pctldev->pin_group_tree, iter.index);
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 36d5da9dc587..55502fc4479c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -833,7 +833,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_remove_function);
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
 {
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 
 	radix_tree_for_each_slot(slot, &pctldev->pin_function_tree, &iter, 0)
 		radix_tree_delete(&pctldev->pin_function_tree, iter.index);
-- 
2.7.4
