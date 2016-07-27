From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] tools/gpio: fix gpio-event-mon header comment
Date: Wed, 27 Jul 2016 08:41:49 +0300
Message-ID: <afb7b91b271fd4409966ab65cbdf9223995dbc4f.1469598109.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:46938 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751627AbcG0Fvs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 27 Jul 2016 01:51:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Fixes: 97f69747d8b1 ('tools/gpio: add the gpio-event-mon tool')
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 tools/gpio/gpio-event-mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 448ed96b3b4f..1c14c2595158 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -1,5 +1,5 @@
 /*
- * gpio-hammer - example swiss army knife to shake GPIO lines on a system
+ * gpio-event-mon - monitor GPIO line events from userspace
  *
  * Copyright (C) 2016 Linus Walleij
  *
-- 
2.8.1

