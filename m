From: Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: [PATCH] gpiolib: Fix uninitialized variable warning
Date: Wed, 23 Dec 2015 14:46:17 -0700
Message-ID: <1450907177-31529-1-git-send-email-ross.zwisler@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:60664 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932483AbbLWVqc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 16:46:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: Ross Zwisler <ross.zwisler@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Commit ef7c7553039b ("gpiolib: improve overlap check of range of gpio")
introduced the following compiler warning:

drivers/gpio/gpiolib.c: In function =E2=80=98gpiochip_add=E2=80=99:
drivers/gpio/gpiolib.c:193:20: warning: =E2=80=98iterator=E2=80=99 may =
be used uninitialized in this function [-Wmaybe-uninitialized]
  struct gpio_chip *iterator;
                    ^

=46ix this by initializing 'iterator' to NULL.

Signed-off-by: Ross Zwisler <ross.zwisler@linux.intel.com>
---

This was found in next-20151223.

---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d72ac1f..abdcd6c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -190,7 +190,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
 	struct list_head *pos;
-	struct gpio_chip *iterator;
+	struct gpio_chip *iterator =3D NULL;
 	struct gpio_chip *previous =3D NULL;
=20
 	if (list_empty(&gpio_chips)) {
--=20
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
