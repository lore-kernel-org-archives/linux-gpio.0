From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 26/63] gpio: da9055: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:56 +0200
Message-ID: <1459877949-29889-7-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:60072 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757920AbcDERj0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:26 -0400
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
index 4d06fdbfc438..4f582231d0e0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -811,7 +811,7 @@ config GPIO_DA9052
 
 config GPIO_DA9055
 	tristate "Dialog Semiconductor DA9055 GPIO"
-	depends on MFD_DA9055
+	depends on MFD_DA9055 || COMPILE_TEST
 	help
 	  Say yes here to enable the GPIO driver for the DA9055 chip.
 
-- 
2.8.0

