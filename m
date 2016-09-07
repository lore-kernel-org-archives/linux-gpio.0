From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/5] gpio: pca953x: code refactoring
Date: Wed, 07 Sep 2016 14:36:59 +0300
Message-ID: <1473248219.11323.41.camel@linux.intel.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:50081 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752418AbcIGLjL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 07:39:11 -0400
In-Reply-To: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
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
> 
> Tested with pca9534 and pca9535 chips.

Looks good to me overall, but please address my comments first.

> 
> v1 -> v2:
> - constified the offset structures in patch 2/5
> 
> Bartosz Golaszewski (5):
>   gpio: pca953x: coding style fixes
>   gpio: pca953x: code shrink
>   gpio: pca953x: refactor pca953x_write_regs()
>   gpio: pca953x: remove an unused variable
>   gpio: pca953x: refactor pca953x_read_regs()
> 
>  drivers/gpio/gpio-pca953x.c | 270 ++++++++++++++++++++++-------------
> ---------
>  1 file changed, 136 insertions(+), 134 deletions(-)
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
