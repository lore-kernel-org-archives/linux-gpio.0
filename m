From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH fixes v3] pinctrl: Really force states during
 suspend/resume
Date: Tue, 14 Mar 2017 19:18:22 -0700
Message-ID: <18ca4418-8b62-a1c9-1282-0c468f2aefb2@gmail.com>
References: <20170301183257.6554-1-f.fainelli@gmail.com>
 <CAHp75VdWVq3E3qrgtvvJK=A4yxK+yM_q3ZJd1hNnFBTj-H4Mxw@mail.gmail.com>
 <304fb86d-0862-992b-4563-61151b37d060@gmail.com>
 <CACRpkdb-_oTuRyGWtH9Rb2g2w_J9VM=m3mXK94OYbCXy+E0XLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:36367 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751037AbdCOCSZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 22:18:25 -0400
In-Reply-To: <CACRpkdb-_oTuRyGWtH9Rb2g2w_J9VM=m3mXK94OYbCXy+E0XLw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>

On 03/14/2017 03:16 AM, Linus Walleij wrote:
> On Thu, Mar 2, 2017 at 11:19 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> So actually, I have been thinking about this some more, and while this
>> definitively fixes my original problem with pinctrl-single, I just had
>> to make another driver (sdhci-brcmstb.c) pinctrl aware. And then again,
>> same thing, it has got just one "default" state, so when we call
>> pinctrl_select_state() during driver resume, nothing happens.
>>
>> So, with that in mind, it seems to me like we may actually just want to
>> remove the p->state == state statement entirely, even though that's an
>> optimization....
>>
>> ... or, what we could do is, expose a version of pinctrl_force_default
>> that takes a struct pinctrl reference instead of a struct pinctrl_dev
>> reference and named differently of course.
>>
>> Thoughts?
> 
> The root problem that the patch is trying to solve is that the hardware
> loose state when going to sleep, without the pin control core
> being informed about this, correct?

That is exactly what is happening.

> 
> And that is why the state is then "forced" with this patch, when
> setting default state: the core think we are already in "default"
> state, and thus the hack force it to be written down to the hardware
> again.

Correct.

> 
> But it is IMO just papering over the real bug: that the core does
> not know that the state is lost.

Yes, agree with that statement.

> 
> What I think is the proper solution is to add a callback to switch
> the state in the core.
> 
> The most obvious would be to use the API as many already do:
> define "sleep" states in the core, and switch to these before
> going to sleep. If CONFIG_PM is available simply by calling
> pinctrl_pm_select_sleep_state() in the driver suspend() callback.

Well, the difficulty for our platforms is that S2 does not make the HW
lose pin states, only S3 does and drivers should be agnostic of S2 vs. S3.

There is not really a "sleep" and "default" state defined for these
platforms just the "default" state. I initially even considered adding a
fake "sleep" state just to satisfy the state transition condition, but
that does not accurately represent the HW.

> 
> I think this is the most intuitive and clean solution.
> 
> Alternatively we would add a function to set the pinctrl handle to
> an "unknown" state, so that when we resume, the pinctrl core at
> least knows that we are not in "default" state anymore, so that
> "default" is applied.

And such a function would be called during driver suspend? Would not we
still end-up with the drivers having to know about the fact that there
is a) only one pin state defined, and b) these pins potentially lose
their states in some deep sleep mode?

> 
> So then we would add:
> 
> /**
>  * pinctrl_set_unknown_state() - tell the pinctrl core that we lost the state
>  */
> void pinctrl_set_unknown_state(struct device *dev) {
>    struct dev_pin_info *pins = dev->pins;
> 
>    if (!pins)
>         return 0;
> 
>    pins->p->state = NULL;
> }
> 
> I imagine this would give the right results on the suspend path.

Humm, why not, but I am not clear how I would call that nor under which
conditions from both the pinctrl-single driver and another one that we
use (sdhci-brcmstb.c for instance, but it could be any pinctrl consumer
really)?

Thanks!

> 
> Yours,
> Linus Walleij
> 


-- 
Florian

