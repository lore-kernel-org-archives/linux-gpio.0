From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Wed, 29 Apr 2015 18:34:58 +0300
Message-ID: <1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52591 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753570AbbD2Pfi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 11:35:38 -0400
In-Reply-To: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

This reverts commit 25b35da7f4cce82271859f1b6eabd9f3bd41a2bb.

The original change is a fast workaround in GPIO generic driver,
which is properly fixed by Alexandre's 23600969ff centralized handling
of return values from GPIO chip drivers.

To avoid a redundant check and copy/paste confusion, it is better to
revert the change done in a particular driver.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/gpio/gpio-generic.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index b92a690..3f90be8 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -139,7 +139,7 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
 
-	return !!(bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio));
+	return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);
 }
 
 static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-- 
1.7.10.4

