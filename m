From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
Date: Tue, 26 Mar 2019 09:58:54 -0700
Message-ID: <155361953432.20095.14563397546308928190@swboyd.mtv.corp.google.com>
References: <20190325181026.247796-1-swboyd@chromium.org> <f53f4556-72f1-051b-0dbe-f1789521233e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f53f4556-72f1-051b-0dbe-f1789521233e@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Marc Zyngier (2019-03-26 04:11:56)
> Hi Stephen,
>=20
> On 25/03/2019 18:10, Stephen Boyd wrote:
> > This function returns an error if a child irqchip calls
> > irq_chip_set_wake_parent() but its parent irqchip has the
> > IRQCHIP_SKIP_SET_WAKE flag set. Let's return 0 for success here instead
> > because there isn't anything to do.
> >=20
> > This keeps the behavior consistent with how set_irq_wake_real() is
> > implemented. That function returns 0 when the irqchip has the
> > IRQCHIP_SKIP_SET_WAKE flag set. It doesn't attempt to walk the chain of
> > parents and set irq wake on any chips that don't have the flag set
> > either. If the intent is to call the .irq_set_wake() callback of the
> > parent irqchip, then we expect irqchip implementations to omit the
> > IRQCHIP_SKIP_SET_WAKE flag and implement an .irq_set_wake() function
> > that calls irq_chip_set_wake_parent().
> >=20
> > This fixes a problem on my Qualcomm sdm845 device where I can't set wake
> > on any GPIO interrupts after I apply work in progress wakeup irq patches
> > to the GPIO driver. The chain of chips looks like this:
> >=20
> >  ARM GIC (skip) -> QCOM PDC (skip) -> QCOM GPIO
>=20
> nit: the parenting chain is actually built the other way around (we
> don't express the 'child' relationship). This doesn't change anything to
> the patch, but would make the reasoning a but easier to understand.

I take it you want the sentence below to say 'parent' instead of 'child'
then?

>=20
> >=20
> > The GPIO controller is a child of the QCOM PDC irqchip which is a child
> > of the ARM GIC irqchip. The QCOM PDC irqchip has the
> > IRQCHIP_SKIP_SET_WAKE flag set, and so does the grandparent ARM GIC.
> >=20
> > The GPIO driver doesn't know if the parent needs to set wake or not, so
> > it unconditionally calls irq_chip_set_wake_parent() causing this
> > function to return a failure because the parent irqchip (PDC) doesn't
> > have the .irq_set_wake() callback set. Returning 0 instead makes
> > everything work and irqs from the GPIO controller can be configured for
> > wakeup.
> >=20
> > Cc: Lina Iyer <ilina@codeaurora.org>
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>=20
> Fixes: 08b55e2a9208e ("genirq: Add irqchip_set_wake_parent")
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
>=20

I'm happy to resend with the commit text clarified more and the above
tags added.
