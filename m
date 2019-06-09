From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: add include guard to pinctrl-state.h
Date: Sun,  9 Jun 2019 23:43:13 +0900
Message-ID: <20190609144313.4842-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinctrl-state.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl-state.h b/include/linux/pinctrl/pinctrl-state.h
index a0e785815a64..635d97e9285e 100644
--- a/include/linux/pinctrl/pinctrl-state.h
+++ b/include/linux/pinctrl/pinctrl-state.h
@@ -3,6 +3,9 @@
  * Standard pin control state definitions
  */
 
+#ifndef __LINUX_PINCTRL_PINCTRL_STATE_H
+#define __LINUX_PINCTRL_PINCTRL_STATE_H
+
 /**
  * @PINCTRL_STATE_DEFAULT: the state the pinctrl handle shall be put
  *	into as default, usually this means the pins are up and ready to
@@ -31,3 +34,5 @@
 #define PINCTRL_STATE_INIT "init"
 #define PINCTRL_STATE_IDLE "idle"
 #define PINCTRL_STATE_SLEEP "sleep"
+
+#endif /* __LINUX_PINCTRL_PINCTRL_STATE_H */
-- 
2.17.1
