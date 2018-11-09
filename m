From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Fri, 9 Nov 2018 08:21:57 -0700
Message-ID: <20181109152157.GA5970@flashbox>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox>
 <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
 <20181025210456.GA14792@flashbox>
 <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
 <20181101000338.GA32577@flashbox>
 <CACRpkdYDgV8RWifqzu-MQxD-ZR87UeyQkxXuwB-yuXoUb0Mtbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYDgV8RWifqzu-MQxD-ZR87UeyQkxXuwB-yuXoUb0Mtbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 09, 2018 at 10:29:02AM +0100, Linus Walleij wrote:
> On Thu, Nov 1, 2018 at 1:03 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > [Me]
> > > A slightly lesser evil variant is to add a few PIN_CONFIG_CUSTOM_1
> > > PIN_CONFIG_CUSTOM_2 etc at the end of the enum and just
> > > #define MY_CONFIG PIN_CONFIG_CUSTOM_1
> > > in all drivers that use these.
> > >
> >
> > Some drivers actually just define their pin config params like:
> >
> > #define VAR (PIN_CONFIG_END + 1)
> >
> > In fact, more drivers do that than not. I will go ahead and draft some
> > patches tonight and send them out tonight to see what driver authors
> > think.
> 
> This seems to work. Is your kernel compile working without
> warnings after this round of patches?
> 

Yes, there are no more enum-conversion warnings and the tree shows there
are no more enums that use PIN_CONFIG_END.

> Thanks for driving this BTW.
> 

Thank you for being patient and forcing me to come up with a solution
that works for you!

Nathan

> Yours,
> Linus Walleij
