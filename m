From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 36/63] gpio: rc5t583: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:35 +0100
Message-ID: <1456492778-21711-17-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:60135 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753793AbcBZNT7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:59 -0500
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
index 14f619689f42..1a3268490bef 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -864,7 +864,7 @@ config GPIO_PALMAS
 
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
-	depends on MFD_RC5T583
+	depends on MFD_RC5T583 || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for the Ricoh RC5T583
 	  chip family.
-- 
2.7.2

