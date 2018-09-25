From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Tue, 25 Sep 2018 09:14:59 -0700
Message-ID: <20180925161459.GA15840@flashbox>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ndesaulniers@google.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 25, 2018 at 12:58:16PM +0200, Linus Walleij wrote:
> On Tue, Sep 25, 2018 at 8:19 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> 
> > Clang warns when one enumerated type is implicitly converted to another,
> > which happens several times in the pinctrl drivers for a few reasons:
> >
> > * The PCONFDUMP macro, which sets the param member in pin_config_item.
> > * The pinconf_generic_params structure, which is used by drivers to
> >   configure their bindings, which has a param member like pin_config_item.
> > * The pinconf_to_config_packed, which takes either the generic enum
> >   pin_config_param or a specialized one.
> >
> > Drivers are allowed to extend this enumerated type because of the gap
> > betweem PIN_CONFIG_END and PIN_CONFIG_MAX. Make it clear to Clang that
> > this is allowed by changing param's type in all of these instances to
> > int so no conversion needs to happen.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/138
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> I'm not superhappy about this because that enum is great for readability,
> even if the static syntax checker is unhappy.
> 
> If we can't have an enum here I would argue that we can just as well
> remove the enum altogether and just use #define for the config
> parameters, would you agree?
> 
> Yours,
> Linus Walleij

Hi Linus,

I see no reason to get rid of the enums. All this patch should do is
silence Clang's warnings because there is no other way to tell it that
this construct is okay except for changing the parameter/member type to
int (so no conversion needs to happen) or an explicit cast, which will
result in more noise in my opinion since this warning happens at least
10-15 times in the pinctrl drivers. There's no fundamental change to
how the enums are used.

See these other commits for similar fixes:

3eb95feac113 ("mm/zsmalloc.c: change stat type parameter to int")
04fecbf51b3c ("mm: memcontrol: use int for event/state parameter in several functions")

Cheers!
Nathan
