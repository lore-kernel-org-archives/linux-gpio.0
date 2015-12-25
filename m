From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] gpio-ucb1400: Delete an unnecessary variable initialisation
 in ucb1400_gpio_probe()
Date: Fri, 25 Dec 2015 19:49:11 +0100
Message-ID: <567D8FA7.2070701@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:63468 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753410AbbLYStT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 25 Dec 2015 13:49:19 -0500
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Dec 2015 19:36:20 +0100

The variable "err" will eventually be set to an appropriate value
from a call of the gpiochip_add() function.
Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-ucb1400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d502825..c963517 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -46,7 +46,7 @@ static void ucb1400_gpio_set(struct gpio_chip *gc, unsigned off, int val)
 static int ucb1400_gpio_probe(struct platform_device *dev)
 {
 	struct ucb1400_gpio *ucb = dev_get_platdata(&dev->dev);
-	int err = 0;
+	int err;
 
 	if (!(ucb && ucb->gpio_offset)) {
 		err = -EINVAL;
-- 
2.6.3

