From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: ts4800: Fixup flags argument for bgpio_init
Date: Fri, 12 Feb 2016 12:16:30 +0800
Message-ID: <1455250590.9777.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:33012 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbcBLEQg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 23:16:36 -0500
Received: by mail-pf0-f180.google.com with SMTP id q63so40753573pfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 20:16:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER is 0.
Fixup the trivial typo.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Julien,
I don't have this h/w, can you review and test if this patch works.
Thanks,
Axel

 drivers/gpio/gpio-ts4800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index c4908a4..c244c31 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -49,7 +49,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
 			    base_addr + OUTPUT_REG_OFFSET, NULL,
 			    base_addr + DIRECTION_REG_OFFSET, NULL,
-			    BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+			    BGPIOF_BIG_ENDIAN | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 	if (retval) {
 		dev_err(&pdev->dev, "bgpio_init failed\n");
 		return retval;
-- 
2.1.4



