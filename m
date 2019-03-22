From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
Date: Fri, 22 Mar 2019 16:50:20 -0700
Message-ID: <155329862018.20095.14024385652448015564@swboyd.mtv.corp.google.com>
References: <20190315200759.139479-1-swboyd@chromium.org> <alpine.DEB.2.21.1903211007310.1777@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1903211007310.1777@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-gpio@vger.kernel.org

Quoting Thomas Gleixner (2019-03-21 02:26:26)
> On Fri, 15 Mar 2019, Stephen Boyd wrote:
>=20
> > This function returns an error if a child interrupt controller calls
> > irq_chip_set_wake_parent() but that parent interrupt controller has the
> > IRQCHIP_SKIP_SET_WAKE flag. Let's return 0 for success instead because
> > there isn't anything to do.
> >=20
> > There's also the possibility that a parent indicates that we should skip
> > it, but the grandparent has an .irq_set_wake callback. Let's iterate
> > through the parent chain as long as the IRQCHIP_SKIP_SET_WAKE flag isn't
> > set so we can find the first parent that needs to handle the wake
> > configuration. This fixes a problem on my Qualcomm sdm845 device where
> > I'm trying to enable wake on an irq from the gpio controller that's a
> > child of the qcom pdc interrupt controller. The qcom pdc interrupt
> > controller has the IRQCHIP_SKIP_SET_WAKE flag set, and so does the
> > grandparent (ARM GIC), causing this function to return a failure because
> > the parent controller doesn't have the .irq_set_wake callback set.
>=20
> It took me some time to distangle that changelog.... and I don't think th=
at
> this is the right thing to do.

Yes, your diagram would be a useful addition to the commit text.

>=20
> set_irq_wake_real() returns 0 when the topmost chip has SKIP_SET_WAKE set.

Just to confirm, the topmost chip would be chip B or chip C below?

>=20
> So let's assume we have the following chains:
>=20
>   chip A -> chip B=20
>=20
>   chip A -> chip B -> chip C
>=20
> chip A has SKIP_SET_WAKE not set
> chip B has SKIP_SET_WAKE set
> chip C has SKIP_SET_WAKE not set and invokes irq_chip_set_wake_parent()
>=20
> Now assume we have interrupt X connected to chip B and interrupt Y
> connected to chip C.
>=20
> If irq_set_wake() is called for interrupt X, then the function returns
> without trying to invoke the set_wake() callback of chip A.

It's not clear to me that having SKIP_SET_WAKE set means "completely
ignore set wake for irqs from this domain" vs. "skip setting wake here
because the .irq_set_wake() is intentionally omitted for this chip".
Reading Santosh's reasoning in commit 60f96b41f71d ("genirq: Add
IRQCHIP_SKIP_SET_WAKE flag") just further confuses me because it sounds
like the latter.

>=20
> If irq_set_wake() is called for interrupt Y, irq_chip_set_wake_parent() is
> invoked from chip C which then skips chip B, but tries to invoke the
> callback on chip A.
>=20
> That's inconsistent and changes the existing behaviour. So IMO, the right
> thing to do is to return 0 from irq_chip_set_wake_parent() when the parent
> has SKIP_SET_WAKE set and not to try to follow the whole chain. That shou=
ld
> fix your problem nicely w/o changing behaviour.

Ok. I understand that with hierarchical chips you want it to be explicit
in the code that a parent chip needs to be called or not. This works for
me, and it's actually how I had originally solved this problem. Will you
merge your patch or do you want me to resend it with some updated commit
text?
