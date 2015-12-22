From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 32/54] ARM: scoop: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:35:47 +0100
Message-ID: <1450794947-27040-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36209 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683AbbLVOfy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:35:54 -0500
Received: by mail-lb0-f182.google.com with SMTP id oh2so32094856lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:35:54 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, arm@kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: arm@kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/arm/common/scoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index 45f4c21e393c..e0df333202b8 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -84,7 +84,7 @@ static int scoop_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct scoop_dev *sdev = container_of(chip, struct scoop_dev, gpio);
 
 	/* XXX: I'm unsure, but it seems so */
-	return ioread16(sdev->base + SCOOP_GPRR) & (1 << (offset + 1));
+	return !!(ioread16(sdev->base + SCOOP_GPRR) & (1 << (offset + 1)));
 }
 
 static int scoop_gpio_direction_input(struct gpio_chip *chip,
-- 
2.4.3

