From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Add support for level triggered interrupts
Date: Thu, 31 Mar 2016 10:58:31 +0200
Message-ID: <5801670.ZsrEAbzXnC@ws-stein>
References: <1458752487-32767-1-git-send-email-alexander.stein@systec-electronic.com> <CACRpkdZKX28G_MvvNhGB7v0Mwsfhbq3gnkmNiCM9UzRsmdJCxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:43551 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752419AbcCaI6i convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Mar 2016 04:58:38 -0400
In-Reply-To: <CACRpkdZKX28G_MvvNhGB7v0Mwsfhbq3gnkmNiCM9UzRsmdJCxw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thursday 31 March 2016 10:41:24, Linus Walleij wrote:
> On Wed, Mar 23, 2016 at 6:01 PM, Alexander Stein
>=20
> <alexander.stein@systec-electronic.com> wrote:
> > The interrupt for the corresponding pin is configured to trigger wh=
en the
> > pin state changes compared to a preconfigured state (Bit set in INT=
CON).
> > This state is set by setting/clearing the bit in DEFVAL.
> > In the interrupt handler we need also to check if the bit in INTCON=
 is set
> > for level triggered interrupts.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.c=
om>
>=20
> Patch applied.
>=20
> I'm a bit concerned that you now support both edge and level trigged
> IRQs but this driver is using handle_simple_irq() in the
> gpiochip_irqchip_add() call. I guess it "just works" because
> the hardware will latch the edge IRQ and clear it when reading the
> status register.

=46rom the reference manual:
> The INTCAP register captures the GPIO port value at
> the time the interrupt occurred. The register is =E2=80=98read
> only=E2=80=99 and is updated only when an interrupt occurs. The
> register will remain unchanged until the interrupt is
> cleared via a read of INTCAP or GPIO.

So, i guess you're right. Although currently I don't know why=20
handle_simple_irq would not work if this would not be the case.

> I guess you have tested it with both edge and level IRQs?

Yep, I have buttons and a PCA9555 added to MCP23S17. Buttons are gpio-k=
eys, so=20
rising and falling edge interrupts and PCA9555 uses low level interrupt=
s.
See this excerpt from /proc/interrupts:

 79:          0          2  gpio-mcp23xxx   8 Edge      Digital In 0
 84:          0          4  gpio-mcp23xxx  13 Level     0-0024

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
