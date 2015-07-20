From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: Re: [PATCH 1/2] gpio: bgpio: Teach gpio-generic about the pinctrl subsystem
Date: Mon, 20 Jul 2015 10:54:47 +0200
Message-ID: <65FAD0E8-0E6C-4442-AD15-6C9BBAA5B71B@smart-africa.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com> <1434718697-31335-2-git-send-email-michael@smart-africa.com> <CACRpkda0Tk9SaO6dySBC3ONpH1nQb8imYkgYGA7dTO8em=Dr=g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:35506 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756611AbbGTIyx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 04:54:53 -0400
Received: by wibxm9 with SMTP id xm9so85635192wib.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2015 01:54:52 -0700 (PDT)
In-Reply-To: <CACRpkda0Tk9SaO6dySBC3ONpH1nQb8imYkgYGA7dTO8em=Dr=g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>


> On 20 Jul 2015, at 10:46 AM, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>=20
> On Fri, Jun 19, 2015 at 2:58 PM, Michael van der Westhuizen
> <michael@smart-africa.com> wrote:
>=20
>> The basic MMIO gpio driver is unaware of the pinctrl subsystem,
>> and this lack of pinctrl awareness extends to drivers using bgpio
>> unless the drivers handle pinctrl interaction by overriding the
>> request and free methods of gpiochip.
>>=20
>> Since pinctrl consumer interfaces are stubbed when pinctrl is not
>> enabled this implementation is very simple, and there is no
>> behaviour change when pinctrl is not enabled.
>>=20
>> Tested on picoXcell pc3x3 using gpio-dwapb.
>>=20
>> Signed-off-by: Michael van der Westhuizen <michael@smart-africa.com>
>=20
>> static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>> {
>>        if (gpio_pin < chip->ngpio)
>> -               return 0;
>> +               return pinctrl_request_gpio(chip->base + gpio_pin);
>>=20
>>        return -EINVAL;
>> }
>>=20
>> +static void bgpio_free(struct gpio_chip *chip, unsigned gpio_pin)
>> +{
>> +       if (gpio_pin < chip->ngpio)
>> +               pinctrl_free_gpio(chip->base + gpio_pin);
>> +}
>=20
> I found a problem with this patch unfortunately.
>=20
> If you have several MMIO controllers on the same system, some
> that use a backing pin controller and some that doesn't, this
> will not work, because all instances will call
> pinctrl_[request|free]_gpio() regardless if there is a pin
> controller behind it or not.
>=20
> Can you please augment the driver to handle this... I don't
> know the best way for boardfiles, but I guess (see
> drivers/gpio/gpio-pl061.c for exampe):
>=20
> - In struct bgpio_chip, introduce bool uses_pinctrl
>=20
> - Assume no backing pin controller so this will be false
>  by default (propbably no code needed)
>=20
> - Only call pinctrl_[request|free]_gpio if uses_pinctrl
>  is true
>=20
> - Explicitly set it to true for drivers that have backing pin
>  control (like Jonas' system) or pass that flag from
>  platform data.
>=20
> - A quirk like this for DT enabled systems:
>          if (of_property_read_bool(dev->of_node, "gpio-ranges"))
>                chip->uses_pinctrl =3D true;
>=20
> I need to move the BGPIO header to include/linux/gpio too=E2=80=A6

I will update the series.

Michael

>=20
> Yours,
> Linus Walleij

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
