From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: APUv2/v3 board support V3
Date: Wed, 20 Feb 2019 10:58:29 +0100
Message-ID: <CACRpkdbSU1R0ZXyPfDrcnd0CYw+mjnPk4pVgbBnWZt-ibdfYaA@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net>
 <1550181897-2596-1-git-send-email-info@metux.net> <CAHp75VfgzGQ7O-AjwQ1R=OZTiRwxRx_q9Yo1MOVjko7D-Wz14w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfgzGQ7O-AjwQ1R=OZTiRwxRx_q9Yo1MOVjko7D-Wz14w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 15, 2019 at 7:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Feb 15, 2019 at 12:05 AM Enrico Weigelt, metux IT consult

> Linus, this one looks good enough, though some style minors can be addressed:
> - redundant parens (and actually I prefer to see x = readl(); x |=
> ...; writel(); in three lines)
> - useless blank lines
> - style of parameters where one per line (it's not needed in this drivers)
>
> In any case, FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

OK Enrico can you include Andy's Review tag when you respin, fix
the spinlock issue I pointed out and send out as v4 and I'll apply
it.

Yours,
Linus Walleij
