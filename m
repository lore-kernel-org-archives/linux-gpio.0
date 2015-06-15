From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Remove double "base" in comment
Date: Mon, 15 Jun 2015 13:31:33 +0200
Message-ID: <1434367893-30361-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:37887 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753183AbbFOLbf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2015 07:31:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps this can still be fixed in commit af6c235d1a5c1129 ("gpio:
discourage passing base to gpio_chip")?
---
 include/linux/gpio/driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index cc7ec129b329efb9..c8393cd4d44f2d87 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -45,7 +45,7 @@ struct seq_file;
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
- *	base offset of GPIO chips is deprecated. Please pass -1 as base to
+ *	offset of GPIO chips is deprecated. Please pass -1 as base to
  *	let gpiolib select the chip base in all possible cases. We want to
  *	get rid of the static GPIO number space in the long run.
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
-- 
1.9.1

