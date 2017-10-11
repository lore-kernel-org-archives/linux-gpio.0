From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: adi2: Fix build problem
Date: Wed, 11 Oct 2017 12:00:57 +0200
Message-ID: <20171011100057.9051-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:47358 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752772AbdJKKBE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 06:01:04 -0400
Received: by mail-lf0-f48.google.com with SMTP id k40so1448408lfi.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 03:01:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Sonic Zhang <sonic.zhang@analog.com>

The build robot is complaining on Blackfin:

drivers/pinctrl/pinctrl-adi2.c: In function 'port_setup':
>> drivers/pinctrl/pinctrl-adi2.c:221:21: error: dereferencing
   pointer to incomplete type 'struct gpio_port_t'
      writew(readw(&regs->port_fer) & ~BIT(offset),
                        ^~
drivers/pinctrl/pinctrl-adi2.c: In function 'adi_gpio_ack_irq':
>> drivers/pinctrl/pinctrl-adi2.c:266:18: error: dereferencing
pointer to incomplete type 'struct bfin_pint_regs'
      if (readl(&regs->invert_set) & pintbit)
                     ^~
It seems the driver need to include <asm/gpio.h> and <asm/irq.h>
to compile.

Cc: Steven Miao <realmz6@gmail.com>
Cc: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Sonic: tell me if you know what is going on. This driver *IS*
       in use, right?
---
 drivers/pinctrl/pinctrl-adi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index 56aa181084ac..eb9ac0853008 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -23,6 +23,8 @@
 #include <linux/syscore_ops.h>
 #include <linux/gpio.h>
 #include <asm/portmux.h>
+#include <asm/gpio.h>
+#include <asm/irq.h>
 #include "pinctrl-adi2.h"
 #include "core.h"
 
-- 
2.13.5

