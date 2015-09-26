From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] gpio: max730x: eliminate double free
Date: Sat, 26 Sep 2015 22:18:20 +0200
Message-ID: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The function __max730x_remove is called from the remove functions of
drivers/gpio/gpio-max7300.c and drivers/gpio/gpio-max7301.c.  In both
cases, the probe function allocates ts using devm_kzalloc.  Explicitly
freeing such a value with kfree will cause a double free.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpio/gpio-max730x.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index 18ab89e..0f57d2d 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -236,7 +236,6 @@ int __max730x_remove(struct device *dev)
 	ts->write(dev, 0x04, 0x00);
 	gpiochip_remove(&ts->chip);
 	mutex_destroy(&ts->lock);
-	kfree(ts);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__max730x_remove);

