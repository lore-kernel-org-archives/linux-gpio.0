From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/5] gpio: pca953x: coding style fixes
Date: Wed, 07 Sep 2016 14:17:26 +0300
Message-ID: <1473247046.11323.37.camel@linux.intel.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
         <1473240297-19881-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:19391 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750798AbcIGLRy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 07:17:54 -0400
In-Reply-To: <1473240297-19881-2-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
> pca953x_gpio_set_multiple() has some coding style issues that make it
> harder to read. Tweak the code a bit.
> 

I would suggest to make this a last patch in the series. Rationale is
that you might have changed same lines by functional changes and the
first patch in such cases just makes a noise. More important, easier way
to back port if anyone is interested in that.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
