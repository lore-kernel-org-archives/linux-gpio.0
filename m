From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 0/5] gpio: pca953x: code refactoring
Date: Fri,  9 Sep 2016 11:17:33 +0200
Message-ID: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37333 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752330AbcIIJRr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 05:17:47 -0400
Received: by mail-wm0-f50.google.com with SMTP id w12so21525878wmf.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2016 02:17:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

I'm working on converting the pca953x driver to using regmap, but since
it's not a trivial task I figured I'd post a couple refactoring patches
I did so far for 4.9.

The first patch just fixes a couple coding style issues. The second
removes a couple unnecessary switches. Last three refactor the
read/write_regs functions to avoid if-elses by using function pointers
to smaller, specialized routines.

Tested with pca9534 and pca9535 chips.

v1 -> v2:
- constified the offset structures in patch 2/5

v2 -> v3:
- modified the order of the patches so that minor coding style fixes
  no longer create noise for the later changes
- moved the **_write_regs_16() assignments to where other variants
  are assigned

v3 -> v4:
- minor style fixes

v4 -> v5:
- added a patch making the register offset names consistent
- bunch of style changes in patch 5/6
- renamed the structure containing the register offsets

v5 -> v6:
- dropped patch 6/6 - the names reflect the ones in the datasheet
- rebased on top of gpio/devel

NOTE: the devel branch doesn't compile due to:

  CC      drivers/gpio/gpiolib.o
drivers/gpio/gpiolib.c: In function '_gpiochip_irqchip_add':
drivers/gpio/gpiolib.c:1622:62: error: macro "WARN_ON" passed 3 arguments, but takes just 1
       "%s: Ignoring %d default trigger\n", of_node->full_name))
                                                              ^
drivers/gpio/gpiolib.c:1621:6: error: 'WARN_ON' undeclared (first use in this function)
  if (WARN_ON(of_node && type != IRQ_TYPE_NONE,
      ^
drivers/gpio/gpiolib.c:1621:6: note: each undeclared identifier is reported only once for each function it appears in

This is due to an incorrect use of WARN_ON() (should have been
WARN() in this case). Fixed in a separate patch.

Bartosz Golaszewski (5):
  gpio: pca953x: code shrink
  gpio: pca953x: refactor pca953x_write_regs()
  gpio: pca953x: refactor pca953x_read_regs()
  gpio: pca953x: remove an unused variable
  gpio: pca953x: coding style fixes

 drivers/gpio/gpio-pca953x.c | 285 ++++++++++++++++++++++----------------------
 1 file changed, 144 insertions(+), 141 deletions(-)

-- 
2.7.4

