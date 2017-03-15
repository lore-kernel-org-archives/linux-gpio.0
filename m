From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] fix pinctrl setup for i.IMX6
Date: Wed, 15 Mar 2017 09:26:39 -0700
Message-ID: <20170315162639.GK20572@atomide.com>
References: <d217e26e-9b5c-7b01-67e2-017293ca1407@nextfour.com>
 <CACRpkdZ6=1U6cDdPr64aDFDizHfzzAPOeNKwQy5Z0nRpB=jLjw@mail.gmail.com>
 <20170314145527.q53qh7yzm2x4zksf@t450s.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170314145527.q53qh7yzm2x4zksf@t450s.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Linus Walleij <linus.walleij@linaro.org>, Mika =?utf-8?B?UGVudHRpbMOk?= <mika.penttila@nextfour.com>, Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Gary Bisson <gary.bisson@boundarydevices.com> [170314 07:57]:
> Hi Linus,
> 
> On Tue, Mar 14, 2017 at 03:47:58PM +0100, Linus Walleij wrote:
> > On Tue, Feb 28, 2017 at 7:00 AM, Mika Penttilä
> > <mika.penttila@nextfour.com> wrote:
> > 
> > > Recent pulls for mainline pre 4.11 introduced pinctrl setup changes and moved pinctrl-imx to
> > > use generic helpers.
> > >
> > > Net effect was that hog group could not be resolved. I made it work for myself
> > > with a two stage setup with create and start separated, and dt probe in between them.
> > >
> > >
> > > Signed-off-by: Mika Penttilä <mika.penttila@nextfour.com>
> > 
> > Sorry for including the whole mail body, some people may have missed the
> > mail. Notably the i.MX maintainers.
> > 
> > Your patch reminds me of the pinctrl_register() vs pinctrl_register_and_init()
> > introduced by Tony Lindgren, can you look into this in commit
> > 950b0d91dc108f54bccca5a2f75bb46f2df63d29
> > "pinctrl: core: Fix regression caused by delayed work for hogs"?
> > 
> > Does switching pinctrl_register_and_init() back to pinctrl_register()
> > solve your problem?
> > 
> > Gary: have you seen any problem like this?
> 
> Yes, Mika brought it up as soon as the first 4.11-rc appeared and indeed
> this issue can be reproduced on any i.MX6 platform.
> 
> Then Tony offered a patch but you haven't replied to him yet:
> https://lkml.org/lkml/2017/2/28/140

I think as a regression fix for the -rc series, we should use Mika's
patch with the following tweaks:

1. Instead of adding yet another devm_pinctrl_register_and_init(),
   let's just make devm_pinctrl_register_and_init() not call start
   automatically. If people prefer to use Mika's naming for it
   with nostart, I have no problem with that. But let's then rename
   the current devm_pinctrl_register_and_init() so we are not stuck
   with another interface with issues.

2. Update the four drivers using devm_pinctrl_register_and_init()
   to also call start separately.

Mika, care to update your patch for that?

Regards,

Tony
