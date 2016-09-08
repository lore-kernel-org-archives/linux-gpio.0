From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 6/6] gpio: pca953x: make the define names consistent
Date: Thu, 08 Sep 2016 15:29:30 +0300
Message-ID: <1473337770.11323.95.camel@linux.intel.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
         <1473331702-26711-7-git-send-email-bgolaszewski@baylibre.com>
         <1473337655.11323.94.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473337655.11323.94.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 2016-09-08 at 15:27 +0300, Andy Shevchenko wrote:
> On Thu, 2016-09-08 at 12:48 +0200, Bartosz Golaszewski wrote:
> > 
> > The register offset defines for the pca953x and pca957x expander
> > families should have the same names to better reflect their similar
> > purposes.
> 

And one more question. If it is done in datasheet as is used currently
in the driver I would leave it to be aligned with official
documentation.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
