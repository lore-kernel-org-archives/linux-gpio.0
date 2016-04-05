From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 31/63] gpio: msic: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:01 +0200
Message-ID: <1459877949-29889-12-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:54349 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759463AbcDERj2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:28 -0400
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
index de9b8802e295..4b27bd4ae41c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -860,7 +860,7 @@ config GPIO_LP3943
 
 config GPIO_MSIC
 	bool "Intel MSIC mixed signal gpio support"
-	depends on MFD_INTEL_MSIC
+	depends on MFD_INTEL_MSIC || COMPILE_TEST
 	help
 	  Enable support for GPIO on intel MSIC controllers found in
 	  intel MID devices
-- 
2.8.0

