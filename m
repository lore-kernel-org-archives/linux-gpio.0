From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 3/3] gpio: zynq: Fix IRQ handlers
Date: Thu, 31 Jul 2014 09:19:30 -0700
Message-ID: <c9e713ff-b5fb-4a8a-9418-7d01a7383f96@BY2FFO11FD017.protection.gbl>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
 <1405677133-8706-3-git-send-email-lars@metafoo.de>
 <CACRpkdb7FPXr_ktYvHgXFCCuA06=UM7y1-x3+deU0WNDFsgKnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1lp0140.outbound.protection.outlook.com ([207.46.163.140]:28683
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751066AbaGaQTo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Jul 2014 12:19:44 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb7FPXr_ktYvHgXFCCuA06=UM7y1-x3+deU0WNDFsgKnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Harini Katakam <harinik@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, 2014-07-23 at 04:36PM +0200, Linus Walleij wrote:
> On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.de=
> wrote:
>=20
> > The Zynq GPIO interrupt handling code as two main issues:
> > 1) It does not support IRQF_ONESHOT interrupt since it uses handle_=
simple_irq()
> > for the interrupt handler. handle_simple_irq() does not do masking =
and unmasking
> > of the IRQ that is required for this chip to be able to support IRQ=
=46_ONESHOT
> > IRQs, causing the CPU to lock up in a interrupt storm if such a int=
errupt is
> > requested.
> > 2) Interrupts are acked after the primary interrupt handlers for al=
l asserted
> > interrupts in a bank have been called. For edge triggered interrupt=
 this is to
> > late and may cause a interrupt to be missed. For level triggered on=
eshot
> > interrupts this is to early and causes the interrupt handler to run=
 twice per
> > interrupt.
> >
> > This patch addresses the issue by updating the driver to use the co=
rrect IRQ
> > chip handler functions that are appropriate for this kind of IRQ co=
ntroller.
>=20
> This looks very thought-through. I will give Harini and Soren some da=
ys
> more to react before applying (unless patch 1/3 is required to apply =
this).

Took me a while, but I finally got to pulling the diffs from some
web-archive and applied them on the current linux-next. I didn't test
any of the new/fixed functionality, but it doesn't break any of my old
use-cases. So, I think this is all good.

=46or the whole series:
Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	Thanks,
	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
