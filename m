From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v1 1/2] gpio: ks8695: fix switch case indentation
Date: Sat, 20 Sep 2014 20:44:30 +0530
Message-ID: <1411226071-11625-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34738 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbaITPOp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Sep 2014 11:14:45 -0400
Received: by mail-pd0-f179.google.com with SMTP id ft15so1738844pdb.10
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2014 08:14:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>


Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-ks8695.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index 464a83d..ba2d2f1 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -265,16 +265,16 @@ static int ks8695_gpio_show(struct seq_file *s, void *unused)
 				seq_printf(s, "EXT%i ", i);
 
 				switch ((ctrl & intmask[i]) >> (4 * i)) {
-					case IOPC_TM_LOW:
-						seq_printf(s, "(Low)");		break;
-					case IOPC_TM_HIGH:
-						seq_printf(s, "(High)");	break;
-					case IOPC_TM_RISING:
-						seq_printf(s, "(Rising)");	break;
-					case IOPC_TM_FALLING:
-						seq_printf(s, "(Falling)");	break;
-					case IOPC_TM_EDGE:
-						seq_printf(s, "(Edges)");	break;
+				case IOPC_TM_LOW:
+					seq_printf(s, "(Low)");		break;
+				case IOPC_TM_HIGH:
+					seq_printf(s, "(High)");	break;
+				case IOPC_TM_RISING:
+					seq_printf(s, "(Rising)");	break;
+				case IOPC_TM_FALLING:
+					seq_printf(s, "(Falling)");	break;
+				case IOPC_TM_EDGE:
+					seq_printf(s, "(Edges)");	break;
 				}
 			}
 			else
-- 
1.7.9.5

