From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 0/5] gpio: pca953x: code refactoring
Date: Wed, 07 Sep 2016 17:00:37 +0300
Message-ID: <1473256837.11323.74.camel@linux.intel.com>
References: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-09-07 at 15:37 +0200, Bartosz Golaszewski wrote:
> I'm working on converting the pca953x driver to using regmap, but
> since
> it's not a trivial task I figured I'd post a couple refactoring
> patches
> I did so far for 4.9.
> 
> The first patch just fixes a couple coding style issues. The second
> removes a couple unnecessary switches. Last three refactor the
> read/write_regs functions to avoid if-elses by using function pointers
> to smaller, specialized routines.

Still few style comments, otherwise

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Tested with pca9534 and pca9535 chips.
> 
> v1 -> v2:
> - constified the offset structures in patch 2/5
> 
> v2 -> v3:
> - modified the order of the patches so that minor coding style fixes
>   no longer create noise for the later changes
> - moved the **_write_regs_16() assignments to where other variants
>   are assigned
> 
> Bartosz Golaszewski (5):
>   gpio: pca953x: code shrink
>   gpio: pca953x: refactor pca953x_write_regs()
>   gpio: pca953x: refactor pca953x_read_regs()
>   gpio: pca953x: remove an unused variable
>   gpio: pca953x: coding style fixes
> 
>  drivers/gpio/gpio-pca953x.c | 268 ++++++++++++++++++++++-------------
> ---------
>  1 file changed, 134 insertions(+), 134 deletions(-)
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
