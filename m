From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/6] gpio: pca953x: code refactoring
Date: Thu,  8 Sep 2016 12:48:16 +0200
Message-ID: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:38666 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941305AbcIHKs2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 06:48:28 -0400
Received: by mail-wm0-f44.google.com with SMTP id 1so81027183wmz.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2016 03:48:27 -0700 (PDT)
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

Bartosz Golaszewski (6):
  gpio: pca953x: code shrink
  gpio: pca953x: refactor pca953x_write_regs()
  gpio: pca953x: refactor pca953x_read_regs()
  gpio: pca953x: remove an unused variable
  gpio: pca953x: coding style fixes
  gpio: pca953x: make the define names consistent

 drivers/gpio/gpio-pca953x.c | 284 ++++++++++++++++++++++----------------------
 1 file changed, 143 insertions(+), 141 deletions(-)

-- 
2.7.4

