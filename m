From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] fix pinctrl setup for i.IMX6
Date: Thu, 16 Mar 2017 12:28:11 +0100
Message-ID: <CACRpkdZNe3s4ipc_Dbbm0Pr-Bz0-a_oOkGCgECsbp75dFSZOgw@mail.gmail.com>
References: <d217e26e-9b5c-7b01-67e2-017293ca1407@nextfour.com>
 <CACRpkdZ6=1U6cDdPr64aDFDizHfzzAPOeNKwQy5Z0nRpB=jLjw@mail.gmail.com>
 <20170314145527.q53qh7yzm2x4zksf@t450s.lan> <20170315162639.GK20572@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170315162639.GK20572@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2017 at 5:26 PM, Tony Lindgren <tony@atomide.com> wrote:

> I think as a regression fix for the -rc series, we should use Mika's
> patch with the following tweaks:
>
> 1. Instead of adding yet another devm_pinctrl_register_and_init(),
>    let's just make devm_pinctrl_register_and_init() not call start
>    automatically. If people prefer to use Mika's naming for it
>    with nostart, I have no problem with that. But let's then rename
>    the current devm_pinctrl_register_and_init() so we are not stuck
>    with another interface with issues.
>
> 2. Update the four drivers using devm_pinctrl_register_and_init()
>    to also call start separately.
>
> Mika, care to update your patch for that?

OK sounds reasonable waiting for a revised patch from Mika.

Yours,
Linus Walleij
