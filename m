From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 40/54] mips: txx9: iocled: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:41:44 +0100
Message-ID: <1450795304-27576-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35919 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696AbbLVOls (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:41:48 -0500
Received: by mail-lf0-f50.google.com with SMTP id z124so125704737lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:41:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
MIPS folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/mips/txx9/generic/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 9d9962ab7d25..2fd350f31f4b 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -689,7 +689,7 @@ static int txx9_iocled_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct txx9_iocled_data *data =
 		container_of(chip, struct txx9_iocled_data, chip);
-	return data->cur_val & (1 << offset);
+	return !!(data->cur_val & (1 << offset));
 }
 
 static void txx9_iocled_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.4.3

