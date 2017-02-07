From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Tue, 7 Feb 2017 11:18:52 +0200
Message-ID: <CAHp75VcgGQQXMh-7YLvE0qwmoLsZio=RuXusquw+YgRKO7CEkw@mail.gmail.com>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
 <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com> <CAFHUOYxqXNn7R7mQjwPb5fOv=3FA_yu7DVO+A86MEFzE6RQN-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34653 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752142AbdBGJSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 04:18:54 -0500
In-Reply-To: <CAFHUOYxqXNn7R7mQjwPb5fOv=3FA_yu7DVO+A86MEFzE6RQN-Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Weike Chen <alvin.chen@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>

On Tue, Feb 7, 2017 at 1:49 AM, Hoan Tran <hotran@apm.com> wrote:
>> I wonder what is at addresses 0x08, 0x14, 0x20, 0x2c, 0x44?
>
> They are unused registers.
>  - 0x8, 0x14, 0x20, 0x2c are port data source registers.
>  - 0x44 is the raw interrupt status register.
>
>> Anything interesting we should know about? I bet they are not just
>> dead address space.

Sometimes they are (for example Synopsys DW DMA has few holes in address space).

>> Is there a public datasheet for this thing that I can look at?
>
> I don't know if they public this datasheet. You can register and
> download from here
> https://www.synopsys.com/dw/ipdir.php?c=DW_apb_gpio

Intel Quark x1000 SoC specification, which is public, at least sheds a
light on 0x44 (from above list). It has description of other used
registers (regarding to only one portA).

http://www.intel.me/content/www/xr/ar/embedded/products/quark/quark-x1000-datasheet.html

-- 
With Best Regards,
Andy Shevchenko
