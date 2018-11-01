From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Wed, 31 Oct 2018 17:03:38 -0700
Message-ID: <20181101000338.GA32577@flashbox>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox>
 <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
 <20181025210456.GA14792@flashbox>
 <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 31, 2018 at 02:33:24PM +0100, Linus Walleij wrote:
> On Thu, Oct 25, 2018 at 11:04 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> 
> > In my opinion, there are enough of these warnings to warrant changing
> > the type of param globally (arm64 allyesconfig):
> 
> Yeah as it is from the compiler, sure we need to get rid of it.
> 
> > Linus, did you have any other objections to this patch given my
> > reasoning in these past couple of emails or would you like me to try
> > adding explicit casts to all of these call sites?
> 
> I would favor the model to:
> 
> 1. Replace all occurences of enum pin_config_param with unsigned
>    int.
> 

Given that there are 57 files with this definition and some include it
multiple time, this doesn't seem super reasonable in my opinion.

> 2. Replace the whole definition of enum pin_config_param with
>    #define PIN_CONFIG_BIAS_BUS_HOLD 0
>    #define PIN_CONFIG_BIAS_DISABLE 1
>    etc etc.
> 
> I think it is not a good idea to try to do both at the same time.
> 
> A slightly lesser evil variant is to add a few PIN_CONFIG_CUSTOM_1
> PIN_CONFIG_CUSTOM_2 etc at the end of the enum and just
> #define MY_CONFIG PIN_CONFIG_CUSTOM_1
> in all drivers that use these.
> 

Some drivers actually just define their pin config params like:

#define VAR (PIN_CONFIG_END + 1)

In fact, more drivers do that than not. I will go ahead and draft some
patches tonight and send them out tonight to see what driver authors
think.

Example with drivers/pinctrl/sprd/pinctrl-sprd.c

================================================

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 4537b5453996..7d9a44bd0047 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -159,10 +159,8 @@ struct sprd_pinctrl {
        struct sprd_pinctrl_soc_info *info;
 };
 
-enum sprd_pinconf_params {
-       SPRD_PIN_CONFIG_CONTROL = PIN_CONFIG_END + 1,
-       SPRD_PIN_CONFIG_SLEEP_MODE = PIN_CONFIG_END + 2,
-};
+#define SPRD_PIN_CONFIG_CONTROL                (PIN_CONFIG_END + 1)
+#define SPRD_PIN_CONFIG_SLEEP_MODE     (PIN_CONFIG_END + 2)
 
 static int sprd_pinctrl_get_id_by_name(struct sprd_pinctrl *sprd_pctl,
                                       const char *name)

> Yours,
> Linus Walleij

Thank you for the reply and advice!
Nathan
