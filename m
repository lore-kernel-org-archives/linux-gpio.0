From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH RESEND] gpio: ucb1400: Can be built as a module
Date: Fri, 13 Sep 2013 21:41:48 +0200
Message-ID: <20130913214148.317c8b20@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41513 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751907Ab3IMTl6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 13 Sep 2013 15:41:58 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

With the recent code cleanup from Marek Vasut, driver gpio-ucb1400 can
be built as a module, so change symbol GPIO_UCB1400 from bool to
tristate.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
I know the first attempt to merge this caused some trouble but that was
several months ago, I think it is about time now.

 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.12-rc0.orig/drivers/gpio/Kconfig	2013-09-13 20:03:47.685333351 +0200
+++ linux-3.12-rc0/drivers/gpio/Kconfig	2013-09-13 20:03:59.085333520 +0200
@@ -703,7 +703,7 @@ config GPIO_74X164
 comment "AC97 GPIO expanders:"
 
 config GPIO_UCB1400
-	bool "Philips UCB1400 GPIO"
+	tristate "Philips UCB1400 GPIO"
 	depends on UCB1400_CORE
 	help
 	  This enables support for the Philips UCB1400 GPIO pins.


-- 
Jean Delvare
Suse L3
