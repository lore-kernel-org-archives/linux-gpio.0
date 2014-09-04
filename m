From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/3] gpio: zynq: Fixed broken wakeup implementation
Date: Thu, 4 Sep 2014 09:45:36 -0700
Message-ID: <00af0950-9750-4c5c-97ee-76893823c29d@BN1BFFO11FD020.protection.gbl>
References: <1409335127-26712-1-git-send-email-soren.brinkmann@xilinx.com>
 <1409335127-26712-3-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkdbb0oeA0b5SSLtR6U7jv8asCeEJdHEsDAg7_tH+GHc5RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2lp0203.outbound.protection.outlook.com ([207.46.163.203]:32187
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753987AbaIDQqA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 4 Sep 2014 12:46:00 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbb0oeA0b5SSLtR6U7jv8asCeEJdHEsDAg7_tH+GHc5RQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harinik@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ezra Savard <ezras@xilinx.com>, Ezra Savard <ezra.savard@xilinx.com>

On Thu, 2014-09-04 at 06:27PM +0200, Linus Walleij wrote:
> On Fri, Aug 29, 2014 at 7:58 PM, Soren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
>=20
> > From: Ezra Savard <ezra.savard@xilinx.com>
> >
> > Use of unmask/mask in set_wake was an incorrect implementation. The=
 new
> > implementation correctly sets wakeup for the gpio chip's IRQ so the=
 gpio chip
> > will not sleep while wakeup-enabled gpio are in use.
> >
> > Signed-off-by: Ezra Savard <ezra.savard@xilinx.com>
> > Reviewed-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>=20
> Patch applied.
>=20
> However the problems seems quite generic.
>=20
> Do you see this kind of error in other GPIO drivers?
>=20
> IRQchip semantics always make me nervous.

Our implementation was just completely flawed. It did work with our
limited tests using the sysfs interface. But once we started with the
gpio_keys things fell apart. The set_wake did mask/unmask IRQs, which
is clearly the job of the respective mask/unmask function of a gpiochip=
=2E
After we found that, we looked at a few other drivers and designed this
following gpio-mxs.
So, the core part was to do the right thing in set_wake. Once that was
done, the runtime PM callbacks needed some realignment to determine
whether GPIO is a wakeup device or not.

So, this was really just a gpio-zynq problem, not really generic.

Thanks for applying. I'll post the gpiolib-sysfs patch on its own in a
separate submission.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
