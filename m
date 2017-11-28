From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH] gpio: it87: fix mojibake in module metadata
Date: Tue, 28 Nov 2017 04:21:49 +0100
Message-ID: <20171128032149.9951-1-kilobyte@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:50445 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbdK1DYW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 22:24:22 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>, linux-gpio@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

It had twice-encoded Unicode.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/gpio/gpio-it87.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index d43d0a2cc4c5..efb46edff81f 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -414,6 +414,6 @@ static void __exit it87_gpio_exit(void)
 module_init(it87_gpio_init);
 module_exit(it87_gpio_exit);
 
-MODULE_AUTHOR("Diego Elio PettenÃ² <flameeyes@flameeyes.eu>");
+MODULE_AUTHOR("Diego Elio Pettenò <flameeyes@flameeyes.eu>");
 MODULE_DESCRIPTION("GPIO interface for IT87xx Super I/O chips");
 MODULE_LICENSE("GPL");
-- 
2.15.0

