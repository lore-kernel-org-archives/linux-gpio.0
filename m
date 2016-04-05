From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 55/63] gpio: intel-mid: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:36 +0200
Message-ID: <1459877980-31872-16-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:52770 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758755AbcDERjx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:53 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2007c1c76d12..9fea3db47d77 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1012,7 +1012,7 @@ config GPIO_BT8XX
 
 config GPIO_INTEL_MID
 	bool "Intel Mid GPIO support"
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Intel Mid GPIO.
-- 
2.8.0

