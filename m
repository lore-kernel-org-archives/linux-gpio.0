From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/2] gpio: clps711x: Enable driver compilation with COMPILE_TEST
Date: Tue, 24 Dec 2013 18:08:54 +0400
Message-ID: <1387894134-11007-2-git-send-email-shc_work@mail.ru>
References: <1387894134-11007-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback3.mail.ru ([94.100.176.58]:51606 "EHLO
	fallback3.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751970Ab3LXOLx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2013 09:11:53 -0500
Received: from smtp39.i.mail.ru (smtp39.i.mail.ru [94.100.177.99])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id 8C3AF1064840B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2013 18:09:18 +0400 (MSK)
In-Reply-To: <1387894134-11007-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

This helps increasing build testing coverage.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98bc397..5416f5b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -110,7 +110,7 @@ comment "Memory mapped GPIO drivers:"
 
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
-	depends on ARCH_CLPS711X
+	depends on ARCH_CLPS711X || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say yes here to support GPIO on CLPS711X SoCs.
-- 
1.8.3.2

