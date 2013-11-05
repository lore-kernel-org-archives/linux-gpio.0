From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] ALSA: atmel: remove dependency on <mach/gpio.h>
Date: Tue,  5 Nov 2013 10:29:49 +0100
Message-ID: <1383643789-14269-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:62045 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab3KEJaH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 04:30:07 -0500
Received: by mail-wi0-f169.google.com with SMTP id cb5so3058111wib.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2013 01:30:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

This include is completely unused since the AT91 sound driver
actually uses gpiolib properly.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ALSA SoC folks: please apply this as a fix if you wish, else
I'd like an ACK so I can merge it in front of the dependent
patches in the next (v3.14) merge cycle.
---
 sound/atmel/ac97c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index ae63d22c0f88..c5f0ddd729b3 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -34,7 +34,6 @@
 #include <linux/dw_dmac.h>
 
 #include <mach/cpu.h>
-#include <mach/gpio.h>
 
 #ifdef CONFIG_ARCH_AT91
 #include <mach/hardware.h>
-- 
1.8.3.1

