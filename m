From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
Date: Mon, 14 Apr 2014 15:30:41 +0800
Message-ID: <1397460641.23515.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:41605 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbaDNHas (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Apr 2014 03:30:48 -0400
Received: by mail-ve0-f169.google.com with SMTP id pa12so7130377veb.14
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2014 00:30:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Juergen Beisert <jbe@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

>From f52622585aeb4cf785c78548e440993a1e9625b1 Mon Sep 17 00:00:00 2001
From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 14 Apr 2014 15:20:15 +0800
Subject: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()

The memory for ts is allocated by devm_kzalloc now, so the kfree is not
required.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
I think this change is missed in:
commit c3fe2bf4916 gpio: max7300: use devm_kzalloc()
commit 4cb06cd58c2 gpio: max7301: use devm_kzalloc()

 drivers/gpio/gpio-max730x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index 8672755..0814584 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -237,10 +237,9 @@ int __max730x_remove(struct device *dev)
 	ts->write(dev, 0x04, 0x00);
 
 	ret = gpiochip_remove(&ts->chip);
-	if (!ret) {
+	if (!ret)
 		mutex_destroy(&ts->lock);
-		kfree(ts);
-	} else
+	else
 		dev_err(dev, "Failed to remove GPIO controller: %d\n", ret);
 
 	return ret;
-- 
1.8.3.2



