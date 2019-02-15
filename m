From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: APUv2/v3 board support V3
Date: Fri, 15 Feb 2019 20:16:00 +0200
Message-ID: <CAHp75VfgzGQ7O-AjwQ1R=OZTiRwxRx_q9Yo1MOVjko7D-Wz14w@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net> <1550181897-2596-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550181897-2596-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 15, 2019 at 12:05 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Hi folks,
>
>

Thanks for an update.

Linus, this one looks good enough, though some style minors can be addressed:
- redundant parens (and actually I prefer to see x = readl(); x |=
...; writel(); in three lines)
- useless blank lines
- style of parameters where one per line (it's not needed in this drivers)

In any case, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> this is version 3 of my APUv2/APUv3 series.
>
> change in V3:
>
>  * gpio driver
>    * drop unncessary gpio id checks
>    * cleanup amd_fch_gpio_set()
>    * move iores outside probe()
>    * shorter NULL checks and correct error in probe()
>  * apu board driver
>    * drop unneeded init.h
>    * drop unnecessary comments
>    * clean up logging
>    * dont need to depend on KEYBOARD_GPIO
>
>
> --mtx



-- 
With Best Regards,
Andy Shevchenko
