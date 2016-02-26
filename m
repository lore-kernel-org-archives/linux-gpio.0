From: Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: [PATCH] tools: gpio: add kernel headers in CFLAGS
Date: Fri, 26 Feb 2016 22:06:30 +0800
Message-ID: <1456495590-7610-1-git-send-email-bamv2005@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:36106 "EHLO
	mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932611AbcBZOGo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 09:06:44 -0500
Received: by mail-pf0-f175.google.com with SMTP id e127so52935134pfe.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 06:06:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Gpio tools require linux/gpio.h which may be only exist in kernel
source code in a cross compile environment.

Add such header to CFLAGS to avoid compiling failure.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 tools/gpio/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 4d198d5..6b8804f 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -1,5 +1,11 @@
+ifneq ($(INSTALL_HDR_PATH),)
+KERNEL_HEADERS := $(INSTALL_HDR_PATH)/include
+else
+KERNEL_HEADERS ?= $(abspath ../../usr/include)
+endif
+
 CC = $(CROSS_COMPILE)gcc
-CFLAGS += -Wall -g -D_GNU_SOURCE
+CFLAGS += -Wall -g -D_GNU_SOURCE -I $(KERNEL_HEADERS)
 
 all: lsgpio
 
-- 
2.6.2

