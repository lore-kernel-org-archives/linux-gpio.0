From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH fixes v3] pinctrl: Really force states during suspend/resume
Date: Tue, 14 Mar 2017 11:16:36 +0100
Message-ID: <CACRpkdb-_oTuRyGWtH9Rb2g2w_J9VM=m3mXK94OYbCXy+E0XLw@mail.gmail.com>
References: <20170301183257.6554-1-f.fainelli@gmail.com> <CAHp75VdWVq3E3qrgtvvJK=A4yxK+yM_q3ZJd1hNnFBTj-H4Mxw@mail.gmail.com>
 <304fb86d-0862-992b-4563-61151b37d060@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <304fb86d-0862-992b-4563-61151b37d060@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2017 at 11:19 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> So actually, I have been thinking about this some more, and while this
> definitively fixes my original problem with pinctrl-single, I just had
> to make another driver (sdhci-brcmstb.c) pinctrl aware. And then again,
> same thing, it has got just one "default" state, so when we call
> pinctrl_select_state() during driver resume, nothing happens.
>
> So, with that in mind, it seems to me like we may actually just want to
> remove the p->state == state statement entirely, even though that's an
> optimization....
>
> ... or, what we could do is, expose a version of pinctrl_force_default
> that takes a struct pinctrl reference instead of a struct pinctrl_dev
> reference and named differently of course.
>
> Thoughts?

The root problem that the patch is trying to solve is that the hardware
loose state when going to sleep, without the pin control core
being informed about this, correct?

And that is why the state is then "forced" with this patch, when
setting default state: the core think we are already in "default"
state, and thus the hack force it to be written down to the hardware
again.

But it is IMO just papering over the real bug: that the core does
not know that the state is lost.

What I think is the proper solution is to add a callback to switch
the state in the core.

The most obvious would be to use the API as many already do:
define "sleep" states in the core, and switch to these before
going to sleep. If CONFIG_PM is available simply by calling
pinctrl_pm_select_sleep_state() in the driver suspend() callback.

I think this is the most intuitive and clean solution.

Alternatively we would add a function to set the pinctrl handle to
an "unknown" state, so that when we resume, the pinctrl core at
least knows that we are not in "default" state anymore, so that
"default" is applied.

So then we would add:

/**
 * pinctrl_set_unknown_state() - tell the pinctrl core that we lost the state
 */
void pinctrl_set_unknown_state(struct device *dev) {
   struct dev_pin_info *pins = dev->pins;

   if (!pins)
        return 0;

   pins->p->state = NULL;
}

I imagine this would give the right results on the suspend path.

Yours,
Linus Walleij
