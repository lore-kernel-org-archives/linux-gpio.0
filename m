From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/5] gpio: pca953x: code refactoring
Date: Mon,  5 Sep 2016 16:31:30 +0200
Message-ID: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35718 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753763AbcIEObn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 10:31:43 -0400
Received: by mail-wm0-f44.google.com with SMTP id w2so124949234wmd.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 07:31:42 -0700 (PDT)
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

Bartosz Golaszewski (5):
  gpio: pca953x: coding style fixes
  gpio: pca953x: code shrink
  gpio: pca953x: refactor pca953x_write_regs()
  gpio: pca953x: remove an unused variable
  gpio: pca953x: refactor pca953x_read_regs()

 drivers/gpio/gpio-pca953x.c | 270 ++++++++++++++++++++++----------------------
 1 file changed, 136 insertions(+), 134 deletions(-)

-- 
2.7.4

