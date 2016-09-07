From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/5] gpio: pca953x: code refactoring
Date: Wed,  7 Sep 2016 11:24:52 +0200
Message-ID: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35436 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757226AbcIGJZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 05:25:03 -0400
Received: by mail-wm0-f43.google.com with SMTP id i204so75603248wma.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 02:25:03 -0700 (PDT)
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

