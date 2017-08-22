From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: twl6040: remove unneeded forward declaration
Date: Wed, 23 Aug 2017 02:33:55 +0900
Message-ID: <1503423235-4240-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:30851 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751586AbdHVReV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 13:34:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

There is no reference to twl6040gpo_chip before its definition.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-twl6040.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b780314cdfc9..dadeacf43e0c 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -32,8 +32,6 @@
 
 #include <linux/mfd/twl6040.h>
 
-static struct gpio_chip twl6040gpo_chip;
-
 static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct twl6040 *twl6040 = dev_get_drvdata(chip->parent->parent);
-- 
2.7.4

