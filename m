From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 06/63] gpio: iop: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:15 +0200
Message-ID: <1459877772-11289-7-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:62777 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750946AbcDERgt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:49 -0400
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
index 91dcb232fae6..b7cb5a5d7153 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -236,7 +236,7 @@ config GPIO_ICH
 
 config GPIO_IOP
 	tristate "Intel IOP GPIO"
-	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X)
+	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X) || COMPILE_TEST
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  IOP32X or IOP33X.
-- 
2.8.0

