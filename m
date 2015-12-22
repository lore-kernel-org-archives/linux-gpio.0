From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 04/54] gpio: ich: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:11:33 +0100
Message-ID: <1450793493-21995-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34138 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041AbbLVOLi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:11:38 -0500
Received: by mail-lb0-f173.google.com with SMTP id pv2so45780254lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:11:37 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Aaron Sierra <asierra@xes-inc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Aaron Sierra <asierra@xes-inc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ich.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 8623d12e23c1..68e525a3cea3 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -236,9 +236,9 @@ static int ich6_gpio_get(struct gpio_chip *chip, unsigned nr)
 
 		spin_unlock_irqrestore(&ichx_priv.lock, flags);
 
-		return (data >> 16) & (1 << nr) ? 1 : 0;
+		return !!((data >> 16) & (1 << nr));
 	} else {
-		return ichx_gpio_get(chip, nr);
+		return !!ichx_gpio_get(chip, nr);
 	}
 }
 
-- 
2.4.3

