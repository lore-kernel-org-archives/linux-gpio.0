From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: moxart: Allow compile test build
Date: Fri, 26 Feb 2016 16:00:50 +0800
Message-ID: <1456473650.24027.1.camel@ingics.com>
References: <1456473597.24027.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:34725 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753235AbcBZIAz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 03:00:55 -0500
Received: by mail-pf0-f182.google.com with SMTP id x65so48116910pfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 00:00:55 -0800 (PST)
In-Reply-To: <1456473597.24027.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

There is no build dependency for this driver, so enable COMPILE_TEST to get
better build coverage.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1118fef..f8d6035ea 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -280,7 +280,7 @@ config GPIO_MM_LANTIQ
 
 config GPIO_MOXART
 	bool "MOXART GPIO support"
-	depends on ARCH_MOXART
+	depends on ARCH_MOXART || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Select this option to enable GPIO driver for
-- 
2.1.4



