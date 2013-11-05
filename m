From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM/serial: at91: specify RTS in DT using gpio
Date: Tue, 5 Nov 2013 17:18:16 +0100
Message-ID: <20131105161816.GN6051@lunn.ch>
References: <1383654959-18112-1-git-send-email-linus.walleij@linaro.org>
 <1383665383-5606-1-git-send-email-nicolas.ferre@atmel.com>
 <A7887CC8-A1F9-4A05-B7F5-4F69FD942F22@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:48518 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754250Ab3KEQXa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Nov 2013 11:23:30 -0500
Content-Disposition: inline
In-Reply-To: <A7887CC8-A1F9-4A05-B7F5-4F69FD942F22@jcrosoft.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas FERRE <nicolas.ferre@atmel.com>, "<gregkh@linuxfoundation.org> KH" <gregkh@linuxfoundation.org>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, Alex Courbot <acourbot@nvidia.com>, "<linux-arm-kernel@lists.infradead.org> mailing list" <linux-arm-kernel@lists.infradead.org>

On Tue, Nov 05, 2013 at 11:59:38PM +0800, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:
>=20
> On Nov 5, 2013, at 11:29 PM, Nicolas Ferre <nicolas.ferre@atmel.com> =
wrote:
>=20
> > Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> > ---
> > Documentation/devicetree/bindings/serial/atmel-usart.txt |  3 +++
> > drivers/tty/serial/atmel_serial.c                        | 13 +++++=
+++++---
> > 2 files changed, 13 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/atmel-usart.t=
xt b/Documentation/devicetree/bindings/serial/atmel-usart.txt
> > index 2191dcb..3adc61c 100644
> > --- a/Documentation/devicetree/bindings/serial/atmel-usart.txt
> > +++ b/Documentation/devicetree/bindings/serial/atmel-usart.txt
> > @@ -10,6 +10,8 @@ Required properties:
> > Optional properties:
> > - atmel,use-dma-rx: use of PDC or DMA for receiving data
> > - atmel,use-dma-tx: use of PDC or DMA for transmitting data
> > +- rts-gpios: specify a GPIO for RTS line. It will use specified PI=
O instead of the peripheral
> > +  function pin for the USART RTS feature. If unsure, don't specify=
 this property.
> > - add dma bindings for dma transfer:
> > 	- dmas: DMA specifier, consisting of a phandle to DMA controller n=
ode,
> > 		memory peripheral interface and USART DMA channel ID, FIFO config=
uration.
> > @@ -28,6 +30,7 @@ Example:
> > 		interrupts =3D <7>;
> > 		atmel,use-dma-rx;
> > 		atmel,use-dma-tx;
> > +		rts-gpios =3D <&pioD 15 0>;
> > 	};
>=20
> gpios means 2 gpio=20
>=20
> I=E2=80=99ll rts-gpio as we can only use one anyway

Hi Jean

Have you read Documentation/devicetree/bindings/gpio/gpio.txt ?

It says:

GPIO properties should be named "[<name>-]gpios". Exact meaning of
each gpios property must be documented in the device tree binding for
each device.

There is also an example of a node with a single gpio using the
property name gpios. So plural is correct, even if there is only one
gpio.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
