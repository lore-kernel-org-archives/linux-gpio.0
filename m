From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 33/54] ARM: sa1100/simpad: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:36:12 +0100
Message-ID: <1450794972-27141-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33753 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683AbbLVOgS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:36:18 -0500
Received: by mail-lb0-f175.google.com with SMTP id sv6so25322926lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:36:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, arm@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/arm/mach-sa1100/simpad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sa1100/simpad.c b/arch/arm/mach-sa1100/simpad.c
index 41e476e571d7..d8965c682d2f 100644
--- a/arch/arm/mach-sa1100/simpad.c
+++ b/arch/arm/mach-sa1100/simpad.c
@@ -98,8 +98,8 @@ static void cs3_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int cs3_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	if (offset > 15)
-		return simpad_get_cs3_ro() & (1 << (offset - 16));
-	return simpad_get_cs3_shadow() & (1 << offset);
+		return !!(simpad_get_cs3_ro() & (1 << (offset - 16)));
+	return !!(simpad_get_cs3_shadow() & (1 << offset));
 };
 
 static int cs3_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-- 
2.4.3

