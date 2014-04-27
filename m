From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 02:00:46 +0200
Message-ID: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:48774 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752608AbaD0ABC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Apr 2014 20:01:02 -0400
Received: by mail-wg0-f51.google.com with SMTP id z12so3833204wgg.22
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2014 17:01:01 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, inux-omap@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Hello Linus and Alexandre,

While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
split refactoring I wrote this trivial semantic patch that replaces a
manual bit shift by using the BIT macro from <linux/bitops.h>

    @hasbitops@
    @@

    #include <linux/bitops.h>

    @depends on hasbitops@
    expression E;
    @@

    - 1 << E
    + BIT(E)

    @depends on hasbitops@
    expression E;
    @@

    - BIT((E))
    + BIT(E)

When applying to the drivers/gpio subdirectory I got
the following clean up patches for some GPIO drivers.

Javier Martinez Canillas (4):
  gpio: em: use BIT() macro instead manually shifting bits
  gpio: kempld: use BIT() macro instead manually shifting bits
  gpio: omap: use BIT() macro instead manually shifting bits
  gpio: pl061: use BIT() macro instead manually shifting bits

 drivers/gpio/gpio-em.c     |  2 +-
 drivers/gpio/gpio-kempld.c |  2 +-
 drivers/gpio/gpio-omap.c   | 50 +++++++++++++++++++++++-----------------------
 drivers/gpio/gpio-pl061.c  | 26 ++++++++++++------------
 4 files changed, 40 insertions(+), 40 deletions(-)

I've only tested the changes on a OMAP3 board but the changes are very
straightforward and that's the advantage of using coccinelle after all.

Best regards,
Javier

-- 
1.9.1

