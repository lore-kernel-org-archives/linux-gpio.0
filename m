From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Mon, 1 Oct 2018 23:20:21 +0200
Message-ID: <CACRpkdaN5G4ephY+6BPLRF+aUrO4-sPa+2erRYrwTGwPBwu8fw@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org> <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com> <CACRpkdawwrpEe6AAfdaxw6OMFXkCnq0gpznk1Up5p1=Wigx_2g@mail.gmail.com>
 <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: timur@kernel.org, jhugo@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 1, 2018 at 3:36 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> On Mon, Oct 1, 2018 at 1:54 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Sep 28, 2018 at 9:30 PM Ricardo Ribalda Delgado
> > <ricardo.ribalda@gmail.com> wrote:
> >
> > > How do we proceed from here? Can you fix your driver somehow to
> > > init the valid mask before enabling the gpio?
> >
> > Just include a hunk to the qcom driver reordering this call
> > at the same time. No need to make it separate patches,
> > it need to be tested together anyways.
> >
> > I guess just switch the order of these two:
> >
> >         ret = gpiochip_add_data(&pctrl->chip, pctrl);
> >         if (ret) {
> >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> >                 return ret;
> >         }
> >
> >         ret = msm_gpio_init_valid_mask(chip, pctrl);
> >         if (ret) {
> >                 dev_err(pctrl->dev, "Failed to setup irq valid bits\n");
> >                 gpiochip_remove(&pctrl->chip);
> >                 return ret;
> >         }
> >
>
> the problem is that valid_mask is not a long/integer, is a struct that
> needs to be malloced, and is malloc at gpiochip_add_data :(

I don't get it, but maybe I'm not smart enough.

gpiochip_add_data() doesn't allocate anything, it
just adds a already allocated (or static!) gpio_chip
to the gpiolib subsystem.

In fact I think it is wrong to set up the mask after
calling gpiolob_add_data(), because of exactly the
type of problem you're seeing.

Don't get confused by the &pctrl->chip
vs just chip variables, it's just some sloppiness.

Yours,
Linus Walleij
