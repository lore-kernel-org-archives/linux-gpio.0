From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 135/182] MIPS: alchemy: switch to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:39:02 +0100
Message-ID: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:35532 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINjI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:39:08 -0500
Received: by lbpu9 with SMTP id u9so29942145lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:39:07 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org

We're planning to remove the gpiochip_add() function to swith
to gpiochip_add_data() with NULL for data argument.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ralf: please ACK this so I can take it through the GPIO tree.
BTW: would be nice if the MIPS GPIO drivers could move down
to drivers/gpio in the long run.
---
 arch/mips/alchemy/common/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index f9bc4f520440..e2606f8eb2fa 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -160,14 +160,14 @@ static int __init alchemy_gpiochip_init(void)
 
 	switch (alchemy_get_cputype()) {
 	case ALCHEMY_CPU_AU1000:
-		ret = gpiochip_add(&alchemy_gpio_chip[0]);
+		ret = gpiochip_add_data(&alchemy_gpio_chip[0], NULL);
 		break;
 	case ALCHEMY_CPU_AU1500...ALCHEMY_CPU_AU1200:
-		ret = gpiochip_add(&alchemy_gpio_chip[0]);
-		ret |= gpiochip_add(&alchemy_gpio_chip[1]);
+		ret = gpiochip_add_data(&alchemy_gpio_chip[0], NULL);
+		ret |= gpiochip_add_data(&alchemy_gpio_chip[1], NULL);
 		break;
 	case ALCHEMY_CPU_AU1300:
-		ret = gpiochip_add(&au1300_gpiochip);
+		ret = gpiochip_add_data(&au1300_gpiochip, NULL);
 		break;
 	}
 	return ret;
-- 
2.4.3

