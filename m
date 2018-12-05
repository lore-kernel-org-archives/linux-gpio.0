From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: uniphier: convert to SPDX License Identifier
Date: Wed,  5 Dec 2018 21:54:09 +0900
Message-ID: <1544014449-5104-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

checkpatch.pl suggests to use SPDX license tag. I am happy to
follow it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-uniphier.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 74551cbd..0f662b2 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -1,16 +1,7 @@
-/*
- * Copyright (C) 2017 Socionext Inc.
- *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2017 Socionext Inc.
+//   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
 
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
-- 
2.7.4
