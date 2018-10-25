From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Thu, 25 Oct 2018 14:04:56 -0700
Message-ID: <20181025210456.GA14792@flashbox>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox>
 <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 25, 2018 at 09:23:09AM -0700, Nick Desaulniers wrote:
> On Tue, Sep 25, 2018 at 9:15 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, Sep 25, 2018 at 12:58:16PM +0200, Linus Walleij wrote:
> > > On Tue, Sep 25, 2018 at 8:19 AM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > >
> > > > Clang warns when one enumerated type is implicitly converted to another,
> > > > which happens several times in the pinctrl drivers for a few reasons:
> > > >
> > > > * The PCONFDUMP macro, which sets the param member in pin_config_item.
> > > > * The pinconf_generic_params structure, which is used by drivers to
> > > >   configure their bindings, which has a param member like pin_config_item.
> > > > * The pinconf_to_config_packed, which takes either the generic enum
> > > >   pin_config_param or a specialized one.
> > > >
> > > > Drivers are allowed to extend this enumerated type because of the gap
> > > > betweem PIN_CONFIG_END and PIN_CONFIG_MAX. Make it clear to Clang that
> > > > this is allowed by changing param's type in all of these instances to
> > > > int so no conversion needs to happen.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/138
> > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > >
> > > I'm not superhappy about this because that enum is great for readability,
> > > even if the static syntax checker is unhappy.
> > >
> > > If we can't have an enum here I would argue that we can just as well
> > > remove the enum altogether and just use #define for the config
> > > parameters, would you agree?
> > >
> > > Yours,
> > > Linus Walleij
> >
> > Hi Linus,
> >
> > I see no reason to get rid of the enums. All this patch should do is
> > silence Clang's warnings because there is no other way to tell it that
> > this construct is okay except for changing the parameter/member type to
> > int (so no conversion needs to happen) or an explicit cast, which will
> > result in more noise in my opinion since this warning happens at least
> > 10-15 times in the pinctrl drivers. There's no fundamental change to
> > how the enums are used.
> >
> > See these other commits for similar fixes:
> >
> > 3eb95feac113 ("mm/zsmalloc.c: change stat type parameter to int")
> > 04fecbf51b3c ("mm: memcontrol: use int for event/state parameter in several functions")
> >
> > Cheers!
> > Nathan
> 
> That or all of the call sites should have explicit casts to the base enum.
> 

I don't know why I never replied to this...

In my opinion, there are enough of these warnings to warrant changing
the type of param globally (arm64 allyesconfig):

drivers/pinctrl/bcm/pinctrl-bcm2835.c:707:40: warning: implicit conversion from enumeration type 'enum bcm2835_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/sprd/pinctrl-sprd.c:845:19: warning: implicit conversion from enumeration type 'enum sprd_pinconf_params' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/sprd/pinctrl-sprd.c:846:22: warning: implicit conversion from enumeration type 'enum sprd_pinconf_params' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/sprd/pinctrl-sprd.c:851:12: warning: implicit conversion from enumeration type 'enum sprd_pinconf_params' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/sprd/pinctrl-sprd.c:852:12: warning: implicit conversion from enumeration type 'enum sprd_pinconf_params' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:56:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:59:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:62:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:65:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:68:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-max77620.c:71:12: warning: implicit conversion from enumeration type 'enum max77620_pinconf_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-lpc18xx.c:643:29: warning: implicit conversion from enumeration type 'enum lpc18xx_pin_config_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/pinctrl/pinctrl-lpc18xx.c:648:12: warning: implicit conversion from enumeration type 'enum lpc18xx_pin_config_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/rtc/rtc-omap.c:574:21: warning: implicit conversion from enumeration type 'enum rtc_pin_config_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]
drivers/rtc/rtc-omap.c:579:12: warning: implicit conversion from enumeration type 'enum rtc_pin_config_param' to different enumeration type 'enum pin_config_param' [-Wenum-conversion]

The construct of extending pin_config_param with another enumerated type
is something that could be added in new drivers so there would be upkeep
of adding explicit casts if that happens, at least until something like
0day can add support for Clang so driver authors get alerted of these
warnings. Even that doesn't sound like a particularly welcoming model
to me.

Linus, did you have any other objections to this patch given my
reasoning in these past couple of emails or would you like me to try
adding explicit casts to all of these call sites? For example, changing
pinctrl-sprd.c would look something like the diff below (I personally
think this looks kind of ugly but I'm willing to do whatever the
maintainer is comfortable with in order to fix these warnings).

Let me know what you think,
Nathan

======================================================================================

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 4537b5453996..9c82ba4dceff 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -842,14 +842,14 @@ static const struct pinconf_ops sprd_pinconf_ops = {
 };
 
 static const struct pinconf_generic_params sprd_dt_params[] = {
-       {"sprd,control", SPRD_PIN_CONFIG_CONTROL, 0},
-       {"sprd,sleep-mode", SPRD_PIN_CONFIG_SLEEP_MODE, 0},
+       {"sprd,control", (enum pin_config_param)SPRD_PIN_CONFIG_CONTROL, 0},
+       {"sprd,sleep-mode", (enum pin_config_param)SPRD_PIN_CONFIG_SLEEP_MODE, 0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item sprd_conf_items[] = {
-       PCONFDUMP(SPRD_PIN_CONFIG_CONTROL, "global control", NULL, true),
-       PCONFDUMP(SPRD_PIN_CONFIG_SLEEP_MODE, "sleep mode", NULL, true),
+       PCONFDUMP((enum pin_config_param)SPRD_PIN_CONFIG_CONTROL, "global control", NULL, true),
+       PCONFDUMP((enum pin_config_param)SPRD_PIN_CONFIG_SLEEP_MODE, "sleep mode", NULL, true),
 };
 #endif
 
> -- 
> Thanks,
> ~Nick Desaulniers
