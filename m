From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] gpio: lpc18xx: convert GPIO_LPC18XX from bool to tristate
Date: Sun, 5 Jun 2016 14:23:43 -0400
Message-ID: <1465151023-23340-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:48975 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751509AbcFESX7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2016 14:23:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Joachim Eastwood <manabian@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

 config GPIO_LPC18XX
       bool "NXP LPC18XX/43XX GPIO support"

...meaning that it currently is not being built as a module by anyone.

When targeting orphaned modular code in non-modular drivers, this
came up.  Joachim indicated that the driver was actually meant to
be tristate but ended up bool by accident.  So here we make it
tristate instead of removing the modular code that was essentially
orphaned.

Cc: Joachim Eastwood <manabian@gmail.com>
Acked-by: Joachim Eastwood <manabian@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 92443817b1ae..03aaa2a1f431 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -249,7 +249,7 @@ config GPIO_LOONGSON
 	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
 
 config GPIO_LPC18XX
-	bool "NXP LPC18XX/43XX GPIO support"
+	tristate "NXP LPC18XX/43XX GPIO support"
 	default y if ARCH_LPC18XX
 	depends on OF_GPIO && (ARCH_LPC18XX || COMPILE_TEST)
 	help
-- 
2.8.0

