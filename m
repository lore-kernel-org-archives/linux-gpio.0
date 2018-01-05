From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: remove redundant mux_setting clear in pinmux_disable_setting()
Date: Fri,  5 Jan 2018 19:52:26 +0900
Message-ID: <1515149546-31282-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

desc->mux_setting is set to NULL in pin_free() called just below.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/pinmux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 55502fc..82b18ef 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -493,8 +493,6 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 			continue;
 		}
 		if (desc->mux_setting == &(setting->data.mux)) {
-			desc->mux_setting = NULL;
-			/* And release the pin */
 			pin_free(pctldev, pins[i], NULL);
 		} else {
 			const char *gname;
-- 
2.7.4
