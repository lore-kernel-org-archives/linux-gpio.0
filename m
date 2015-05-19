From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 2/3] irqchip: GIC: Add support for
 irq_{get,set}_irqchip_state
Date: Tue, 19 May 2015 11:01:31 +0100
Message-ID: <20150519110131.522f9c16@arm.com>
References: <1426676484-21812-1-git-send-email-marc.zyngier@arm.com>
	<1426676484-21812-3-git-send-email-marc.zyngier@arm.com>
	<CAL85gmBrkonMcKdUVGmYx6zT3wSe-e2jPhnL_+Tkf3s4jsAiWg@mail.gmail.com>
	<CACRpkdYffHJEzksc5mg7JZdwTzShGaQofAmbmn65=_V3ot04Rg@mail.gmail.com>
	<CAL85gmC4ovR99wQQYoKs=oo24So80jZ_guxDDFhi-1MXXj0uSw@mail.gmail.com>
	<CACRpkdZkBLrhFpZiYk4fiM3ND+UwnVJhNKs=+rL5iZY4fS7zCg@mail.gmail.com>
	<CAL85gmD=12u87vDAc601T=ZOgcS-jDo_=LaC5gRAZUHgp_iTbA@mail.gmail.com>
	<CACRpkdYV1MzjW6ZMvmOhqi0qhXeeQnC62--7WBY=_hZBT8cvXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:34143 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755344AbbESKBx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 19 May 2015 06:01:53 -0400
In-Reply-To: <CACRpkdYV1MzjW6ZMvmOhqi0qhXeeQnC62--7WBY=_hZBT8cvXg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Feng Kan <fkan@apm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Phong Vo <pvo@apm.com>, Tin Huynh <tnhuynh@apm.com>, Y Vo <yvo@apm.com>, Thomas Gleixner <tglx@linutronix.de>, Toan Le <toanle@apm.com>, Bjorn Andersson <bjorn@kryo.se>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, 19 May 2015 09:40:21 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Thu, May 14, 2015 at 10:14 PM, Feng Kan <fkan@apm.com> wrote:
> > On Thu, May 14, 2015 at 3:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> >> But surely the GPIO block has its own status register, so are
> >> you saying that this register is unreliable?
> >
> > When the GPIO is used as interrupt, the gpio block does not report the
> > status anymore. Which leaves us stuck with SPISR.
> >>
> >> I can think of a few reasons, like transient IRQs etc but
> >> what is actually causing this?
> >
> > I won't say the obvious.
> 
> Yeah I see your problem now :(
> 
> I think it's better to fix the access functions so that you can
> cross-call to the GIC driver to get the SPISR flag out though.
> Let's see what Marc says.
> 
> >> Which GPIO driver is this? Is it upstream?
> >
> > Yes, it is upstream. It is the xgene slimpro gpio driver. I am starting to
> > think that we ought to switch to use some gpio poll driver rather than
> > using gpio-key.
> 
> There is both gpio_keys_polled and IRQ-driven gpio_keys so yeah
> that's possible. But honestly I think it's better to deal with this
> problem for real because IRQ is more efficient.
> 
> So the way I perceive it this is the real problem:
> 
> +static int gic_irq_get_irqchip_state(struct irq_data *d,
> +                                     enum irqchip_irq_state which, bool *val)
> +{
> +       switch (which) {
> (...)
> +       case IRQCHIP_STATE_ACTIVE:
> +               *val = gic_peek_irq(d, GIC_DIST_ACTIVE_SET);
> +               break; case: read
> from 0xd04 (SPISR) instead, because that makes more
> sense to me, or am I wrong at it?
> 
> +       case IRQCHIP_STATE_LINE_LEVEL:
> +               *val = gic_peek_irq(d, GIC_DIST_SPISR);
> +               break;
> 
> And then put a define into <linux/irqchip/arm-gic.h> for
> GIC_DIST_SPISR.

What worries me here is that the PENDING state should already give you
the right level of information (this is what the GIC-400 TRM says). The
only reason why SPISR exists is that software can write to the PENDING
register, while SPISR is RO.

If reading the pending state doesn't work, then I'd like to know
exactly *why*. Only then we can add support for LINE_LEVEL using SPISR
(which has to be GIC-400 specific, as it is not architected).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
