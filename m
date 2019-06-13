From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] pinctrl: make pinconf.h self-contained
Date: Thu, 13 Jun 2019 10:55:32 +0900
Message-ID: <20190613015532.19685-2-yamada.masahiro@socionext.com>
References: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613015532.19685-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This header uses 'bool', but it does not include any header by itself.

So, it could cause unknown type name error, depending on the header
include order, although probably <linux/types.h> has been included by
someone else.

Include <linux/types.h> to make it self-contained.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/pinctrl/pinconf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pinctrl/pinconf.h b/include/linux/pinctrl/pinconf.h
index eb16a1e0bcfa..f8a8215e9021 100644
--- a/include/linux/pinctrl/pinconf.h
+++ b/include/linux/pinctrl/pinconf.h
@@ -11,6 +11,8 @@
 #ifndef __LINUX_PINCTRL_PINCONF_H
 #define __LINUX_PINCTRL_PINCONF_H
 
+#include <linux/types.h>
+
 struct pinctrl_dev;
 struct seq_file;
 
-- 
2.17.1
