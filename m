From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] gpio: zynq: Implement irq_(request|release)_resources
Date: Thu, 29 Oct 2015 09:47:06 -0700
Message-ID: <20151029164706.GQ6436@xsjsorenbubuntu>
References: <1445607381-7794-1-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkda4QKEJvwkwGLS7OLTP8Nxu5W05tzbcFXA_FPnBsFtKhw@mail.gmail.com>
 <562FA849.2070306@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0097.outbound.protection.outlook.com ([157.56.110.97]:64144
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751848AbbJ2QrR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 29 Oct 2015 12:47:17 -0400
Content-Disposition: inline
In-Reply-To: <562FA849.2070306@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, John Linn <linnj@xilinx.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Thomas Gleixner <tglx@linutronix.de>

On Tue, 2015-10-27 at 05:37PM +0100, Lars-Peter Clausen wrote:
> On 10/27/2015 04:53 PM, Linus Walleij wrote:
> > On Fri, Oct 23, 2015 at 3:36 PM, Soren Brinkmann
> > <soren.brinkmann@xilinx.com> wrote:
> >=20
> >> The driver uses runtime PM to leverage low power techniques. For
> >> use-cases using GPIO as interrupt the device needs to be in an
> >> appropriate state.
> >>
> >> Reported-by: John Linn <linnj@xilinx.com>
> >> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> >> Tested-by: John Linn <linnj@xilinx.com>
> >=20
> > As pointed out by Grygorii in
> > commit aca82d1cbb49af34b69ecd4571a0fe48ad9247c1:
> >=20
> >     The PM runtime API can't be used in atomic contex on -RT even i=
f
> >     it's configured as irqsafe. As result, below error report can
> >     be seen when PM runtime API called from IRQ chip's callbacks
> >     irq_startup/irq_shutdown/irq_set_type, because they are
> >     protected by RAW spinlock:
> > (...)
> >     The IRQ chip interface defines only two callbacks which are exe=
cuted in
> >     non-atomic contex - irq_bus_lock/irq_bus_sync_unlock, so lets m=
ove
> >     PM runtime calls there.
> >=20
> > I.e. these calls are atomic context and it's just luck that it work=
s
> > and this is fragile.
> >=20
> > Can you please check if you can move it to
> > irq_bus_lock()/irq_sync_unlock()
> > like Grygorii does?
>=20
> That only powers up the chip when the chip is accessed. For proper IR=
Q
> operation the chip needs to be powered up though as long as the IRQ i=
s
> enabled. request_irq() and free_irq() must always be called from slee=
pable
> context. The thing is just that request_resource/release_resource are=
 called
> from within a raw spinlock, which is necessary since otherwise you ca=
n't
> guarantee that they are only called once for shared interrupts.
>=20
> It might make sense to add a separate set of callbacks to the irq_chi=
p
> struct that are called from the sleepable sections of
> request_irq()/free_irq() which are meant for power management purpose=
s and
> which wont have the guarantee that they are only called once for shar=
ed IRQs
> (but are still balanced).

Let me try to summarize what I've heard so far:
 - reqres/relres are called from atomic context, hence must not sleep
 - pm_runtime API must not be used from atomic context, even when the
   implementation of the callbacks does not sleep
 - when overriding regres/relres, a driver must re-implement the defaul=
t
   behavior the core provides
 - bus lock/unlock is not sufficient for this case because it doesn't
   keep the device on as long as an IRQ is expected
 - a new pair of gpiochip ops might be helpful

Does that summarize the current situation correctly? If so, I'd tend to
agree with Lars that we might need another pair of callbacks in the
gpiochip struct.

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
