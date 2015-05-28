From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: fix confusing debug message in pinctrl_register_map()
Date: Thu, 28 May 2015 21:52:59 +0900
Message-ID: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There are two types for pinctrl maps: pinmux and pinconfig
This debug message shows the number of maps of both types.
The string "pinmux map" is not precise.  Let's say "pinctrl map"
instead.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 18ee208..36c5592 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1115,7 +1115,7 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
 	int i, ret;
 	struct pinctrl_maps *maps_node;
 
-	pr_debug("add %d pinmux maps\n", num_maps);
+	pr_debug("add %d pinctrl maps\n", num_maps);
 
 	/* First sanity check the new mapping */
 	for (i = 0; i < num_maps; i++) {
-- 
1.9.1
