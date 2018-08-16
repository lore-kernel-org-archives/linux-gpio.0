From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 1/3] pinctrl: msm: Really mask level interrupts to prevent
 latching
Date: Thu, 16 Aug 2018 11:19:37 -0700
Message-ID: <153444357718.28926.1637234742079120461@swboyd.mtv.corp.google.com>
References: <20180725222900.33231-1-swboyd@chromium.org>
 <20180725222900.33231-2-swboyd@chromium.org>
 <CAD=FV=V8ujNN-jxOm6a_OthyQFGucbv0-1Du3BjScVPKPz-Tsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=V8ujNN-jxOm6a_OthyQFGucbv0-1Du3BjScVPKPz-Tsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Doug Anderson (2018-08-13 16:53:42)
> Hi,
> =

> On Wed, Jul 25, 2018 at 3:28 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/=
pinctrl-msm.c
> > index 2155a30c282b..3970dc599092 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -634,6 +634,19 @@ static void msm_gpio_irq_mask(struct irq_data *d)
> >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> >         val =3D readl(pctrl->regs + g->intr_cfg_reg);
> > +       /*
> > +        * Leaving the RAW_STATUS_EN bit enabled causes level interrupt=
s that
> > +        * are still asserted to re-latch after we ack them. Clear the =
raw
> > +        * status enable bit too so the interrupt can't even latch into=
 the
> > +        * hardware while it's masked, but only do this for level inter=
rupts
> > +        * because edge interrupts have a problem with the raw status b=
it
> > +        * toggling and causing spurious interrupts.
> =

> This whole "spurious interrupts" explanation still seems dodgy.  Have
> you experienced it yourself, or is this looking through some previous
> commits? =


There's a similar comment in the code already from the initial commit.
See msm_gpio_irq_set_type() and this really old commit from downstream
kernels[1]. I haven't seen a problem with this myself, but I believe
there have been problems with the mask/unmask causing an interrupt to
latch into the hardware just because we change the raw status enable
bit. For level type interrupts this isn't a problem because the level is
'present' when we mask it so toggling raw status can't cause a spurious
level to be seen.

For edge types I don't believe this is a problem we need to solve. We
may mask the edge because it just keeps coming during IRQ processing and
then when we ack the line while it's masked it will be cleared out of
the status register and only relatch when the edge comes back. It only
becomes a spurious irq if we toggle this raw status bit, but we don't
ever need to do that for edge type interrupts because we always want the
edge to latch into the hardware after we ack it (even if it's masked).
So the irq status for edge types should always be forwarded to the
status register and it should always latch into the status register, but
when the irq is physically masked we don't want the CPU to be
interrupted when that happens, we just want to remember it happened to
make sure we replay the interrupt later on unmask.

> As per my comments in v1, I'd still rather the comment state
> the reason as: it's important to _not_ lose edge interrupts when
> masked.

Ok! Let me try to rewrite this comment with the reasoning for level and
edge types.

> =

> =

> > +        */
> > +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> > +               val &=3D ~BIT(g->intr_raw_status_bit);
> > +               writel(val, pctrl->regs + g->intr_cfg_reg);
> > +       }
> =

> In v1 you claimed you were going to combine this with the next write
> (you said you'd combine things in both mask and unmask).  ...is there
> a reason why you didn't?  As per my comments in v1 I believe it's
> safer from a correctness point of view to combine them.
> =


Hmm I seem to have mis-copied the patch from one directory to another.
I'll resend with both combined because I tested that.

[1] https://source.codeaurora.org/quic/la/kernel/msm/commit/?h=3Dmsm-3.4&id=
=3Dea45a49ee524cfafe136c0ac67623e64e614ba27
