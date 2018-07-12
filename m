From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] pinctrl: msm: Pass along set_wake failures
Date: Thu, 12 Jul 2018 09:30:30 -0700
Message-ID: <CAE=gft7RURCr0Lj8qO+i5EjwD25xkdqS+UB5RC_02-7FLdM1fg@mail.gmail.com>
References: <20180619234349.166190-1-evgreen@chromium.org> <20180709173022.GH2050@tuxbook-pro>
 <CAE=gft5+oOFv8y-XCtiQ8mc7gQ1FFSK0+bPk=mJu--ovLfDDJg@mail.gmail.com> <20180710203805.GA14825@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710203805.GA14825@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 10, 2018 at 1:38 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Tue, Jul 10 2018 at 12:53 -0600, Evan Green wrote:
> >On Mon, Jul 9, 2018 at 10:27 AM Bjorn Andersson
> ><bjorn.andersson@linaro.org> wrote:
> >>
> >> Sorry for not getting back to you in a timely manner Evan, I wanted to
> >> read up more on the details of how this is supposed to work. I still
> >> haven't done so, but here's my concern:
> >>
> >> When we power down the SoC we're no longer powering either the TLMM or
> >> the GIC, so the MPM or PDC is used to waking the system on some set of
> >> triggers. As such set_wake on an individual pin or irq should be routed
> >> to the MPM/PDC driver, which (in the PDC case) is implemented using
> >> hierarchical irq domains.
> >>
> >> As such I think that we shouldn't toggle the wake property of the
> >> summary pin at all; i.e. the patch should remove that call rather than
> >> propagating what I believe is a constant failure.
> >>
> >> Regards,
> >> Bjorn
> >
> >Hi Bjorn,
> >That's okay, I always feel bad pinging. Thanks for the thoughtful
> >response. Stephen and I are starting to think about how wake
> >interrupts should work with regard to the PDC, and we're at a place
> >where we're a bit unsure of the path forward.
> >
> >Our understanding is the downstream kernel had an interrupt hierarchy
> >of GIC > PDC > TLMM & everybody else. In the downstream world PDC
> >acted transparently, forwarding most requests directly onto the GIC,
> >but quietly handling wake interrupts as well. With the upstream PDC
> >driver, the #interrupt-cells got changed to 2, and it seemed like
> >folks didn't like the idea that PDC was acting transparently. Correct
> >me if I'm wrong there. So now we're sort of unsure about how to wire
> >in PDC. If we make everybody an interrupt child of PDC, then we lose
> >the ability to specify the third GIC parameter, and we're stuck
> >expressing interrupts with respect to PDC pins, which is an awkward
> >mental translation.
> Its an unfortunate side effect of the design. Drivers will have to
> request the PDC pin for wakeup IRQs.

Would they use the PDC pin to request their regular interrupt, and the
PDC would turn around and ask the GIC for them, and also enable the
wakeup interrupt? Or would devices have some sort of separate entry
for wakeup interrupts?

>
> >In this world, does TLMM need to do direct-connect
> >stuff to get wake-able GPIO interrupts working? It would kind of have
> >a foot in both worlds, with its summary interrupt as a GIC interrupt
> >but the wakeable ones as parented by PDC?
> >
> With GPIOs, I am trying to hack the TLMM driver to request a PDC pin,
> when the IRQ associated with the GPIO is requested as a wakeup
> interrupt. In that case, the TLMM driver would do the GPIO->PDC pin
> translation and request it. There is no hierarchy between TLMM and PDC.
>
> Will try a RFC patch in a week or two.

Thanks Lina. Looking forward to it. Please CC me.

>
> -- Lina
>
> >So anyway, with regard to this patch, I'm happy to create a second
> >spin that simply removes this function, but for me at least it brought
> >up some larger questions we've been wrestling with.

Bjorn, Linus,
If there's a spin of this you'd like to see, I'm happy to provide
that. If not, that's fine too.
-Evan
