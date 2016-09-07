From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/5] gpio: pca953x: code refactoring
Date: Wed,  7 Sep 2016 15:37:47 +0200
Message-ID: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

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

Bartosz Golaszewski (5):
  gpio: pca953x: code shrink
  gpio: pca953x: refactor pca953x_write_regs()
  gpio: pca953x: refactor pca953x_read_regs()
  gpio: pca953x: remove an unused variable
  gpio: pca953x: coding style fixes

 drivers/gpio/gpio-pca953x.c | 268 ++++++++++++++++++++++----------------------
 1 file changed, 134 insertions(+), 134 deletions(-)

-- 
2.7.4
