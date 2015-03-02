From: Rob Herring <robh@kernel.org>
Subject: [PATCH] gpio: pxa: simplify BANK_OFF macro offset calculation
Date: Mon,  2 Mar 2015 15:30:58 -0600
Message-ID: <1425331858-6018-1-git-send-email-robh@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:58276 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942AbbCBVcA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 16:32:00 -0500
Received: by mail-oi0-f42.google.com with SMTP id h136so29522387oig.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 13:32:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The macro BANK_OFF which calculates the base offset for each GPIO port.
The macro is needlessly complex and unreadable. Simplify the
calculation to a simple math operation.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-pxa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index e45637b..d2324b9 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -61,8 +61,7 @@
 #define GAFR_OFFSET	0x54
 #define ED_MASK_OFFSET	0x9C	/* GPIO edge detection for AP side */
 
-#define BANK_OFF(n)	(((n) < 3) ? (n) << 2 : ((n) > 5 ? 0x200 : 0x100)	\
-			+ (((n) % 3) << 2))
+#define BANK_OFF(n)	(((n) / 3) << 8) + (((n) % 3) << 2)
 
 int pxa_last_gpio;
 static int irq_base;
-- 
2.1.0

