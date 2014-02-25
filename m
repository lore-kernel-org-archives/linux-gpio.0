From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] gpio: Mark xtensa gpio driver as BROKEN
Date: Mon, 24 Feb 2014 20:05:48 -0800
Message-ID: <1393301148-5167-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:54606 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbaBYEGE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 23:06:04 -0500
Received: by mail-pa0-f43.google.com with SMTP id rd3so7500110pab.16
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 20:06:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chris Zankel <chris@zankel.net>, linux-xtensa@linux-xtensa.org, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Guenter Roeck <linux@roeck-us.net>

xtensa:allmodconfig build fails with

drivers/gpio/gpio-xtensa.c: Assembler messages:
drivers/gpio/gpio-xtensa.c:87: Error: unknown opcode or format name 'read_impwire'
drivers/gpio/gpio-xtensa.c:110: Error: unknown opcode or format name 'rur.expstate'
drivers/gpio/gpio-xtensa.c:124: Error: unknown opcode or format name 'wrmsk_expstate'

Tests with various compiler versions was unsuccessful, suggesting that the
assembler instructions may only be available with some unspecified xtensa
variant. Until that is resolved, mark the driver as broken to enable test
builds.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I know this is likely controversial, but it seems to be better than letting
builds fail. And maybe it causes a real fix to be submitted.

 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 903f24d..0b5a0a1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -306,6 +306,7 @@ config GPIO_XILINX
 
 config GPIO_XTENSA
 	bool "Xtensa GPIO32 support"
+	depends on BROKEN
 	depends on XTENSA
 	depends on HAVE_XTENSA_GPIO32
 	depends on !SMP
-- 
1.7.9.7

