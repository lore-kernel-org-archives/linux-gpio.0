From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into request/release resources methods
Date: Thu, 26 Feb 2015 21:59:08 +0800
Message-ID: <AE6E30D8-7E58-4D18-A8F3-B903F5D85498@jcrosoft.com>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com> <54EF2052.6030909@atmel.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54EF2052.6030909@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas FERRE <nicolas.ferre@atmel.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: linux-gpio@vger.kernel.org


> On Feb 26, 2015, at 9:32 PM, Nicolas Ferre <nicolas.ferre@atmel.com> =
wrote:
>=20
> Le 08/02/2015 19:23, Boris Brezillon a =E9crit :
>> The gpiochip_lock_as_irq call can fail and return an error, while th=
e
>> irq_startup is not expected to fail (returns an unsigned int which i=
s not
>> checked by irq core code).
>>=20
>> irq_request/release_resources functions have been created to address=
 this
>> problem.
>>=20
>> Move gpiochip_lock/unlock_as_irq calls into
>> irq_request/release_resources functions to prevent using a gpio as a=
n irq
>> if the gpiochip_lock_as_irq call failed.
>>=20
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>=20
> If it can speed up things:
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>=20
> Linus,
> can we schedule this fix during the 4.0-rc phase?

As I said I=92ll test after CNY which finish this week for us

as we only re-open the office Monday

Best Regards,
J.
>=20
> Bye,
>=20
>> ---
>> drivers/pinctrl/pinctrl-at91.c | 17 +++++++----------
>> 1 file changed, 7 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctr=
l-at91.c
>> index f4cd0b9..a481406 100644
>> --- a/drivers/pinctrl/pinctrl-at91.c
>> +++ b/drivers/pinctrl/pinctrl-at91.c
>> @@ -1477,28 +1477,25 @@ static void gpio_irq_ack(struct irq_data *d)
>> 	/* the interrupt is already cleared before by reading ISR */
>> }
>>=20
>> -static unsigned int gpio_irq_startup(struct irq_data *d)
>> +static int gpio_irq_request_res(struct irq_data *d)
>> {
>> 	struct at91_gpio_chip *at91_gpio =3D irq_data_get_irq_chip_data(d);
>> 	unsigned	pin =3D d->hwirq;
>> 	int ret;
>>=20
>> 	ret =3D gpiochip_lock_as_irq(&at91_gpio->chip, pin);
>> -	if (ret) {
>> +	if (ret)
>> 		dev_err(at91_gpio->chip.dev, "unable to lock pind %lu IRQ\n",
>> 			d->hwirq);
>> -		return ret;
>> -	}
>> -	gpio_irq_unmask(d);
>> -	return 0;
>> +
>> +	return ret;
>> }
>>=20
>> -static void gpio_irq_shutdown(struct irq_data *d)
>> +static void gpio_irq_release_res(struct irq_data *d)
>> {
>> 	struct at91_gpio_chip *at91_gpio =3D irq_data_get_irq_chip_data(d);
>> 	unsigned	pin =3D d->hwirq;
>>=20
>> -	gpio_irq_mask(d);
>> 	gpiochip_unlock_as_irq(&at91_gpio->chip, pin);
>> }
>>=20
>> @@ -1577,8 +1574,8 @@ void at91_pinctrl_gpio_resume(void)
>> static struct irq_chip gpio_irqchip =3D {
>> 	.name		=3D "GPIO",
>> 	.irq_ack	=3D gpio_irq_ack,
>> -	.irq_startup	=3D gpio_irq_startup,
>> -	.irq_shutdown	=3D gpio_irq_shutdown,
>> +	.irq_request_resources =3D gpio_irq_request_res,
>> +	.irq_release_resources =3D gpio_irq_release_res,
>> 	.irq_disable	=3D gpio_irq_mask,
>> 	.irq_mask	=3D gpio_irq_mask,
>> 	.irq_unmask	=3D gpio_irq_unmask,
>>=20
>=20
>=20
> --=20
> Nicolas Ferre
