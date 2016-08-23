From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] gpio: Remove superfluous include of io-mapping.h
Date: Tue, 23 Aug 2016 21:32:03 +0100
Message-ID: <20160823203203.14134-1-chris@chris-wilson.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The io-mapping.h include arose from the need to workaround an arch/um
compile failure:

   drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_probe':
>> drivers/gpio/gpio-mpc8xxx.c:373:2: error: implicit declaration of
>> function 'iounmap' [-Werror=implicit-function-declaration]
     iounmap(mpc8xxx_gc->regs);
     ^~~~~~~

from commit 296ad4acb8ef ("gpio: remove deps on
ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") but io-mapping.h doesn't provide
iounmap so the problem persisted and eventually (will be) silenced by
making OF_GPIO depend on !NO_IOMEM (i.e. disabling building under
arch/um). My desire to remove the unneed include to io-mapping is to
simplify verification of changes to io-mapping.h

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 75e7b3919ea7..a28feb3edf33 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/io.h>
-#include <linux/io-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.9.3
