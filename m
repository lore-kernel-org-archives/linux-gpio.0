From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 05/63] gpio: ge: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:14 +0200
Message-ID: <1459877772-11289-6-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:51408 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751668AbcDERgs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:48 -0400
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
index 68f83d317c49..91dcb232fae6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -196,7 +196,7 @@ config GPIO_ETRAXFS
 
 config GPIO_GE_FPGA
 	bool "GE FPGA based GPIO"
-	depends on GE_FPGA
+	depends on GE_FPGA || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Support for common GPIO functionality provided on some GE Single Board
-- 
2.8.0

