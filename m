From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] [BUGFIX] gpio: reject invalid gpio before getting
 gpio_desc
Date: Mon, 31 Jul 2017 09:54:07 +0900
Message-ID: <20170731095407.3179cd776a16901f7317f71a@kernel.org>
References: <150131523385.6834.16274817727659878191.stgit@devbox>
        <CAHp75Ve6h-rb+zz15mRB_1sDiLXxppKWfu2W9sVsnsL5ZUvucQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751646AbdGaAyL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 Jul 2017 20:54:11 -0400
In-Reply-To: <CAHp75Ve6h-rb+zz15mRB_1sDiLXxppKWfu2W9sVsnsL5ZUvucQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>

On Sun, 30 Jul 2017 19:21:36 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sat, Jul 29, 2017 at 11:00 AM, Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > Check user-given gpio number and reject it before
> > calling gpio_to_desc() because gpio_to_desc() is
> > for kernel driver and it expects given gpio number
> > is valid (means 0 to 511).
> 
> > If given number is invalid, gpio_to_desc() calls
> > WARN() and dump registers and stack for debug.
> > This means user can easily kick WARN() just by
> > writing invalid gpio number (e.g. 512) to
> > /sys/class/gpio/export.
> 
> > This bug has been introduced by commit 0e9a5edf5d01
> > ("gpio: fix deferred probe detection for legacy API")
> 
> Why so narrow paraghraps? We don't do two column articles :-)

OK, I'll remove this, since Fixes explain that.

> 
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > Fixes: commit 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
> 
> If you use git tools directly, like
> 
> % git commit -s --amend
> 
> you will immediately notice that your SoB line is supposed to be the last one.

I'll move SoB line to the bottom.

> 
> Besides above, word "commit" is not needed in Fixes: tag IIRC.

Ah, OK, I'll remove "commit" from Fixes.

> 
> 
> > --- a/drivers/gpio/gpiolib-sysfs.c
> > +++ b/drivers/gpio/gpiolib-sysfs.c
> > @@ -2,6 +2,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/device.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/gpio.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/interrupt.h>
> 
> > @@ -443,14 +444,16 @@ static ssize_t export_store(struct class *class,
> 
> > -       struct gpio_desc        *desc;
> > +       struct gpio_desc        *desc = NULL;
> 
> > -       desc = gpio_to_desc(gpio);
> > +       if (gpio_is_valid(gpio))
> > +               desc = gpio_to_desc(gpio);
> 
> Twice repeatition is a candidate for a helper, like:
> 
> static inline struct gpio_desc *gpio_to_valid_desc(int gpio)
> {
>  return gpio_is_valid(gpio) ? gpio_to_desc(gpio) : NULL;
> }

OK, I'll add the helper.

Thanks,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
