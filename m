From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] tools/gpio: remove old Makefile
Date: Fri, 17 Jun 2016 21:24:20 +0300
Message-ID: <1466187862-71801-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:41525 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932106AbcFQSYe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jun 2016 14:24:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Prepare to switch to tools build system, i.e. remove Makefile completely. There
is no much sense to keep it since it will be rewritten (almost) completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/gpio/Makefile | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 tools/gpio/Makefile

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
deleted file mode 100644
index 619314f..0000000
--- a/tools/gpio/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-CC = $(CROSS_COMPILE)gcc
-CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
-
-all: lsgpio gpio-hammer gpio-event-mon
-
-lsgpio: lsgpio.o gpio-utils.o
-gpio-hammer: gpio-hammer.o gpio-utils.o
-gpio-event-mon: gpio-event-mon.o gpio-utils.o
-
-%.o: %.c gpio-utils.h
-
-.PHONY: clean
-clean:
-	rm -f *.o lsgpio gpio-hammer gpio-event-mon
-- 
2.8.1

