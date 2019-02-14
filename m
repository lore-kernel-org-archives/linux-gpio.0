From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: APUv2/v3 board support V2
Date: Thu, 14 Feb 2019 04:17:07 +0200
Message-ID: <CAHp75VeZSrxoxd298eFiJj-N_MRsCXa2GEAXry5jCUi6twt_Xg@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550091448-28578-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 13, 2019 at 10:57 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Hi folks,
>
>
> this is version 2 of my APUv2/APUv3 series. Heavily reworked,
> hope I've now addressed all issues of the last one.

Thanks!
It looks indeed better.

I dunno how you created this message, I hope you used --cover-letter
parameter to git-format-patch.
Just don't forget to add -v<N>, where <N> is version.

Also makes sense to do --thread to put proper references to emails.

> Major changes are:
>  * using gpiod_lookup_table instead of hardcoded gpio numbers
>  * moved the PCHs gpio register definitions to the gpio drivers'
>    header (but keeping the actual assignments in the board driver,
>    as they're board speficic)
>  * moved IO resource definition from board to gpio driver
>    (the FCHs mmio base address could be changed, but nobody
>    seems to ever do it)
>  * added gpio line names
>  * moved the gpio driver's pdata definitions to::
>    include/linux/platform_data/gpio/gpio-amd-fch.h
>  * reduced some code redundancies and various cleanups
>
> Possibly debatable:
>  * does is the assigned key code fit well ? (KEY_SETUP seemed the
>    best candidate to me, but I'm open to suggestions)
>  * should the pch gpio become a sub-device of some toplevel PCH
>    device ? (which then could also maintain the base address, etc)
>
> Note: the keyboard device needs separate patch for gpiod_lookup_table
> support in gpio-keys-polled driver. I'll sent it separately.
>
>
> --mtx
>
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287



-- 
With Best Regards,
Andy Shevchenko
