From: Nick Krause <xerofoiify@gmail.com>
Subject: [PATCH] drivers/gpio: Check return value to silence warning
Date: Thu,  7 Aug 2014 06:40:13 +0200
Message-ID: <1407386413-20111-1-git-send-email-xerofoiify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Check for return value to fix the following error

drivers/gpio/gpio-sch311x.c: In function 'sch311x_gpio_probe':
drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value of
'gpiochip_remove', declared with attribute warn_unused_result [-Wunused-result]

in the context we do not need to check but checking makes compiler happy.
With help from kernelnewbies.

Signed-off-by: Nick Krause <xerofoify@gmail.com>
---
 drivers/gpio/gpio-sch311x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index f942b80..af35e99 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -283,7 +283,7 @@ exit_err:
 	release_region(pdata->runtime_reg + GP1, 6);
 	/* release already registered chips */
 	for (--i; i >= 0; i--)
-		gpiochip_remove(&priv->blocks[i].chip);
+		WARN_ON(gpiochip_remove(&priv->blocks[i].chip));
 	return err;
 }
 
-- 
2.0.1
