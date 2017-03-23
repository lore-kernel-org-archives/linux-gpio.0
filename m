From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] gpio: pca953x: Sort headers alphabetically
Date: Thu, 23 Mar 2017 15:10:31 +0200
Message-ID: <1490274631.19767.190.camel@linux.intel.com>
References: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
         <20170322141113.34396-2-andriy.shevchenko@linux.intel.com>
         <CACRpkdaaG4tdOaGq2+mpvTUhd2JOTT48dwTjo1uf=2Fzx7ypLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:62154 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753440AbdCWNOO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 09:14:14 -0400
In-Reply-To: <CACRpkdaaG4tdOaGq2+mpvTUhd2JOTT48dwTjo1uf=2Fzx7ypLw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Thu, 2017-03-23 at 10:42 +0100, Linus Walleij wrote:
> On Wed, Mar 22, 2017 at 3:11 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > For sake of better maintenance sort the headers by alphabetical
> > order.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied.
> 
> Unrelated:
> 
> >  #include <linux/gpio.h>
> >  #include <linux/gpio/consumer.h>
> 
> #include <linux/gpio/driver.h> should normally be all that is needed.

Noted for the future, thanks!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
