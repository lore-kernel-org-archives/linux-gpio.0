From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v1 2/2] gpio: ks8695: fix 'else should follow close brace '}''
Date: Sat, 20 Sep 2014 20:44:31 +0530
Message-ID: <1411226071-11625-2-git-send-email-varkab@cdac.in>
References: <1411226071-11625-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:32772 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbaITPOt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Sep 2014 11:14:49 -0400
Received: by mail-pa0-f53.google.com with SMTP id hz1so1922159pad.40
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2014 08:14:48 -0700 (PDT)
In-Reply-To: <1411226071-11625-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>


Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-ks8695.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index ba2d2f1..10c7377 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -276,17 +276,14 @@ static int ks8695_gpio_show(struct seq_file *s, void *unused)
 				case IOPC_TM_EDGE:
 					seq_printf(s, "(Edges)");	break;
 				}
-			}
-			else
+			} else
 				seq_printf(s, "GPIO\t");
-		}
-		else if (i <= KS8695_GPIO_5) {
+		} else if (i <= KS8695_GPIO_5) {
 			if (ctrl & enable[i])
 				seq_printf(s, "TOUT%i\t", i - KS8695_GPIO_4);
 			else
 				seq_printf(s, "GPIO\t");
-		}
-		else
+		} else
 			seq_printf(s, "GPIO\t");
 
 		seq_printf(s, "\t");
-- 
1.7.9.5

