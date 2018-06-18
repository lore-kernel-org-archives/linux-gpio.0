From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/3] pinctrl: msm: Really mask level interrupts to prevent
 latching
Date: Mon, 18 Jun 2018 16:28:45 -0700
Message-ID: <152936452512.16708.5405608343995548468@swboyd.mtv.corp.google.com>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-2-swboyd@chromium.org>
 <CAD=FV=WvsY_=Ko2QXvzmHOuy4O5Rh6+sRWZZOuSXyGC829ANag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WvsY_=Ko2QXvzmHOuy4O5Rh6+sRWZZOuSXyGC829ANag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Doug Anderson (2018-06-18 15:43:06)
> =

> On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> =

> > +        */
> > +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> > +               val &=3D ~BIT(g->intr_raw_status_bit);
> > +               writel(val, pctrl->regs + g->intr_cfg_reg);
> =

> Do you know if it's important to do a 2nd write here, or could this be
> combined with the next writel()?

I haven't tried combining the writes. It felt safer to keep them split
up so that both bits don't toggle at the same time, but I don't know if
it actually matters.

> =

> > +       }
> > +
> >         val &=3D ~BIT(g->intr_enable_bit);
> >         writel(val, pctrl->regs + g->intr_cfg_reg);
> >
> > @@ -647,6 +660,10 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
> >         raw_spin_lock_irqsave(&pctrl->lock, flags);
> >
> >         val =3D readl(pctrl->regs + g->intr_cfg_reg);
> > +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> > +               val |=3D BIT(g->intr_raw_status_bit);
> > +               writel(val, pctrl->regs + g->intr_cfg_reg);
> =

> Same question about whether this could be combined with the next
> writel().  ...although I could imagine that the answer might be
> different for mask and unmask.

We probably need someone from qcom side to determine if these can be
combined. I can give it a try and see if anything goes wrong but my
confidence level will only be anecdotal. It's worth a shot.

> =

> ...if it can be combined, you can totally get rid of the "if" test and
> always "OR" in the bit, right?

Yes.
