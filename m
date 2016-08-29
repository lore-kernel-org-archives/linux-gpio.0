From: "winton.liu" <18502523564@163.com>
Subject: [PATCH] tools/gpio: delete useless file gpio-utils.c
Date: Mon, 29 Aug 2016 19:31:32 +0800
Message-ID: <1472470292-3751-2-git-send-email-18502523564@163.com>
References: <1472470292-3751-1-git-send-email-18502523564@163.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m50-133.163.com ([123.125.50.133]:58399 "EHLO m50-133.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756777AbcH2L1z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Aug 2016 07:27:55 -0400
In-Reply-To: <1472470292-3751-1-git-send-email-18502523564@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, "winton.liu" <18502523564@163.com>

From: "winton.liu" <18502523564@163.com>

1.gpio-utils.c only include a header file.
2.gpio-utils.c is not used in other code
Delete the useless code

Signed-off-by: winton.liu <18502523564@163.com>
---
 tools/gpio/Build        |    6 +++---
 tools/gpio/gpio-utils.c |   11 -----------
 2 files changed, 3 insertions(+), 14 deletions(-)
 delete mode 100644 tools/gpio/gpio-utils.c

diff --git a/tools/gpio/Build b/tools/gpio/Build
index 620c193..6df304f 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -1,3 +1,3 @@
-lsgpio-y += lsgpio.o gpio-utils.o
-gpio-hammer-y += gpio-hammer.o gpio-utils.o
-gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
+lsgpio-y += lsgpio.o
+gpio-hammer-y += gpio-hammer.o
+gpio-event-mon-y += gpio-event-mon.o
diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
deleted file mode 100644
index 8208718..0000000
--- a/tools/gpio/gpio-utils.c
+++ /dev/null
@@ -1,11 +0,0 @@
-/*
- * GPIO tools - helpers library for the GPIO tools
- *
- * Copyright (C) 2015 Linus Walleij
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- */
-
-#include "gpio-utils.h"
-- 
1.7.9.5


