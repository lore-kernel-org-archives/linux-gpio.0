From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 34/63] gpio: msic: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:33 +0100
Message-ID: <1456492778-21711-15-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:53834 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753978AbcBZNTx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:53 -0500
In-Reply-To: <1456492778-21711-1-git-send-email-alexanders83@web.de>
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
index 7654258068ea..1b6d1844a058 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -850,7 +850,7 @@ config GPIO_LP3943
 
 config GPIO_MSIC
 	bool "Intel MSIC mixed signal gpio support"
-	depends on MFD_INTEL_MSIC
+	depends on MFD_INTEL_MSIC || COMPILE_TEST
 	help
 	  Enable support for GPIO on intel MSIC controllers found in
 	  intel MID devices
-- 
2.7.2

