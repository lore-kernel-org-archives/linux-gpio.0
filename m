From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Fri, 9 Nov 2018 10:29:02 +0100
Message-ID: <CACRpkdYDgV8RWifqzu-MQxD-ZR87UeyQkxXuwB-yuXoUb0Mtbw@mail.gmail.com>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox> <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
 <20181025210456.GA14792@flashbox> <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
 <20181101000338.GA32577@flashbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101000338.GA32577@flashbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 1, 2018 at 1:03 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> [Me]
> > A slightly lesser evil variant is to add a few PIN_CONFIG_CUSTOM_1
> > PIN_CONFIG_CUSTOM_2 etc at the end of the enum and just
> > #define MY_CONFIG PIN_CONFIG_CUSTOM_1
> > in all drivers that use these.
> >
>
> Some drivers actually just define their pin config params like:
>
> #define VAR (PIN_CONFIG_END + 1)
>
> In fact, more drivers do that than not. I will go ahead and draft some
> patches tonight and send them out tonight to see what driver authors
> think.

This seems to work. Is your kernel compile working without
warnings after this round of patches?

Thanks for driving this BTW.

Yours,
Linus Walleij
