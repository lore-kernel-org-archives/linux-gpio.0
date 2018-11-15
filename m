From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: fix legacy non pinctrl aware builds again
Date: Thu, 15 Nov 2018 23:49:07 +0100
Message-ID: <CACRpkdbJ6AoF=Y0XzrMrfg_oFX_DhdhQ_hafbtacD8N=g1uXRA@mail.gmail.com>
References: <20181115171638.5704-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115171638.5704-1-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 15, 2018 at 6:16 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> As pointed out by Gregor, spitz keyboard matrix is broken, with or
> without CONFIG_PINCTRL set, quoting :
> "The gpio matrix keypard on the Zaurus C3x00 (see spitz.c) does not work
> properly. Noticeable are that rshift+c does nothing where as lshift+c
> creates C.  Opposite it is for rshift+a vs lshift+a, here only rshift
> works. This affects a few other combinations using the rshift or lshift
> buttons."
>
> As a matter of fact, as for platform_data based builds CONFIG_PINCTRL=n
> is required for now (as opposed for devicetree builds where it should be
> set), this means gpio driver should change the direction, which is what
> was attempted by commit c4e5ffb6f224 ("gpio: pxa: fix legacy non pinctrl
> aware builds").
>
> Unfortunately, the input case was inverted, and the direction change was
> never done. This wasn't seen up until now because the initial platform
> setup (MFP) was setting this direction. Yet in Gregory's case, the
> matrix-keypad driver changes back and forth the direction dynamically,
> and this is why he's the first to report it.
>
> Fixes: c4e5ffb6f224 ("gpio: pxa: fix legacy non pinctrl aware builds")
> Tested-by: Greg <greguu@null.net>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied for fixes.

Yours,
Linus Walleij
