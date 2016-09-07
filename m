From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/5] gpio: pca953x: remove an unused variable
Date: Wed, 07 Sep 2016 15:17:46 +0300
Message-ID: <1473250666.11323.62.camel@linux.intel.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
         <1473240297-19881-5-git-send-email-bgolaszewski@baylibre.com>
         <1473248188.11323.40.camel@linux.intel.com>
         <CAMpxmJULK+ayGU5RfkNJ8nOB6axBYknObCT-q94YuQD9abBC0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJULK+ayGU5RfkNJ8nOB6axBYknObCT-q94YuQD9abBC0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-09-07 at 13:40 +0200, Bartosz Golaszewski wrote:
> 2016-09-07 13:36 GMT+02:00 Andy Shevchenko <andriy.shevchenko@linux.in
> tel.com>:
> > 
> > On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
> > > 
> > > The chip_type variable in struct pca953x_chip is no longer
> > > required.
> > > 
> > > Remove it.
> > 
> > Would it be patch 4 in the series?
> 
> Hi Andy,
> 
> I'm afraid I don't understand the question. Could you elaborate?

Same as for patch 1. This is not critical to have it before 5.
So, after rearrangement it would be 4th followed by 5th (aka patch 1 in
current series).

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
