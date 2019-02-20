From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Wed, 20 Feb 2019 10:37:46 +0100
Message-ID: <CACRpkdYgZ1jh-kvHuwY5gFKDc9kMY23MSN0+G9SX7xbmSBBS+Q@mail.gmail.com>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
 <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com> <55cfbefe-5ff7-9f8d-4507-a5a2f9c78d13@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55cfbefe-5ff7-9f8d-4507-a5a2f9c78d13@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 10:56 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 08.02.19 15:25, Linus Walleij wrote:
>
> >> +config GPIO_AMD_FCH
> >> +       tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
> >> +       select GPIO_GENERIC
> >
> > You are selecting GPIO_GENERIC, is this necessary? I thought
> > X86 was already selecting this.
>
> Doesn't look so - at least haven't found anything where it's
> automatically selected on x86. OTOH, that wouldn't make much
> sense to me  - I somewhat doubt that x86 can't run w/o that.

Sorry my bad. You should select this if you use it, but are you
using the GPIO MMIO abstractions?
The hallmark of those implementations are that they
call bgpio_init() and this driver does not, and it seems
with the funny layout of the registers it can't even use
it anyway.

> IMHO, dependencies should always be direct - indirect ones could
> suddenly change in subtle ways.

Agreed.

> >> +       priv->gc.owner                  = THIS_MODULE;
> >> +       priv->gc.parent                 = &pdev->dev;
> >> +       priv->gc.label                  = dev_name(&pdev->dev);
> >> +       priv->gc.base                   = priv->pdata->gpio_base;
> >
> > No please, use priv->gc.base = -1;
>
> Could I also leave that field untouched (IOW: =0) ?

No unfortunately not, because 0 is a valid GPIO base.

Yours,
Linus Walleij
