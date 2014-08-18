From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Mon, 18 Aug 2014 11:54:56 -0700
Message-ID: <ba183934-971e-47b1-997e-b9634e8bc27a@BN1BFFO11FD002.protection.gbl>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
 <1408355696-9998-2-git-send-email-lars@metafoo.de>
 <CAAVeFu+DnWGjsu0t+e5zEkNDG2O5dXs-BHX=BX4RgcpHvTg7=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2lp0244.outbound.protection.outlook.com ([207.46.163.244]:8679
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751705AbaHRSzM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 18 Aug 2014 14:55:12 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFu+DnWGjsu0t+e5zEkNDG2O5dXs-BHX=BX4RgcpHvTg7=w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, 2014-08-18 at 09:28AM -0700, Alexandre Courbot wrote:
> On Mon, Aug 18, 2014 at 2:54 AM, Lars-Peter Clausen <lars@metafoo.de>=
 wrote:
> > When looking up the IRQ the bank offset needs to be taken into acco=
unt.
> > Otherwise interrupts for banks other than bank 0 get incorrectly re=
ported as
> > interrupts for bank 0.
> >
> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> > ---
> > Changes since v1:
> >         * Use lookup table instead of switch-case.
> > ---
> >  drivers/gpio/gpio-zynq.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> Yep, you saved 16 lines compared to the first version of this patch. =
:)
>=20
> I assume overflows over this array cannot happen (otherwise a quick
> check against ARRAY_SIZE(zynq_gpio_bank_offset) would do the trick),
> if so:
I think that overflow is impossible since we are in a for-loop that run=
s
from 0..(ZYNQ_GPIO_MAX_BANK - 1).

>=20
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

=46or the series:
Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	Thanks,
	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
