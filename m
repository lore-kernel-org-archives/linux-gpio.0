From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: bail out silently on NULL descriptors
Date: Mon, 30 May 2016 16:59:01 +0200
Message-ID: <1464620341-24326-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35219 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754704AbcE3O7M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 10:59:12 -0400
Received: by mail-lf0-f54.google.com with SMTP id w16so61531772lfd.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 07:59:12 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>

In fdeb8e1547cb9dd39d5d7223b33f3565cf86c28e
("gpio: reflect base and ngpio into gpio_device")
assumed that GPIO descriptors are either valid or error
pointers, but gpiod_get_[index_]optional() actually return
NULL descriptors and then all subsequent calls should just
bail out.

Cc: stable@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
=46ixes: fdeb8e1547cb ("gpio: reflect base and ngpio into gpio_device")
Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 68dbff5d8f57..246b6b051b0d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1367,10 +1367,13 @@ done:
 /*
  * This descriptor validation needs to be inserted verbatim into each
  * function taking a descriptor, so we need to use a preprocessor
- * macro to avoid endless duplication.
+ * macro to avoid endless duplication. If the desc is NULL it is an
+ * optional GPIO and calls should just bail out.
  */
 #define VALIDATE_DESC(desc) do { \
-	if (!desc || !desc->gdev) { \
+	if (!desc) \
+		return 0; \
+	if (!desc->gdev) { \
 		pr_warn("%s: invalid GPIO\n", __func__); \
 		return -EINVAL; \
 	} \
@@ -1381,7 +1384,9 @@ done:
 	} } while (0)
=20
 #define VALIDATE_DESC_VOID(desc) do { \
-	if (!desc || !desc->gdev) { \
+	if (!desc) \
+		return; \
+	if (!desc->gdev) { \
 		pr_warn("%s: invalid GPIO\n", __func__); \
 		return; \
 	} \
--=20
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
