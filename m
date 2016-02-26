From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 18/63] gpio: tb10x: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:27 +0100
Message-ID: <1456492692-21592-19-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:50846 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753971AbcBZNSX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:23 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Enable when compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 52cdd093e31b..9b98845d3b31 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -389,6 +389,7 @@ config GPIO_SYSCON
 
 config GPIO_TB10X
 	bool
+	default y if COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO
 
-- 
2.7.2

