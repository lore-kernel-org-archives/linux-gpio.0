From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: generic: Avoid several implicit enum conversions
Date: Wed, 31 Oct 2018 14:33:24 +0100
Message-ID: <CACRpkda9LhdQybgci8gYs13L5pHWvDx43_Ftn5s+ERLLFPvLjQ@mail.gmail.com>
References: <20180925061855.19557-1-natechancellor@gmail.com>
 <CACRpkdadODxsuae7uhwcfBBMQ-eZ8bvnV71fhDCuudbJEbhhYA@mail.gmail.com>
 <20180925161459.GA15840@flashbox> <CAKwvOdkh0rqWcw4r7Y=Ki_MNJPoJNnvm3uGp4Q726PaESxZAnQ@mail.gmail.com>
 <20181025210456.GA14792@flashbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025210456.GA14792@flashbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 25, 2018 at 11:04 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> In my opinion, there are enough of these warnings to warrant changing
> the type of param globally (arm64 allyesconfig):

Yeah as it is from the compiler, sure we need to get rid of it.

> Linus, did you have any other objections to this patch given my
> reasoning in these past couple of emails or would you like me to try
> adding explicit casts to all of these call sites?

I would favor the model to:

1. Replace all occurences of enum pin_config_param with unsigned
   int.

2. Replace the whole definition of enum pin_config_param with
   #define PIN_CONFIG_BIAS_BUS_HOLD 0
   #define PIN_CONFIG_BIAS_DISABLE 1
   etc etc.

I think it is not a good idea to try to do both at the same time.

A slightly lesser evil variant is to add a few PIN_CONFIG_CUSTOM_1
PIN_CONFIG_CUSTOM_2 etc at the end of the enum and just
#define MY_CONFIG PIN_CONFIG_CUSTOM_1
in all drivers that use these.

Yours,
Linus Walleij
