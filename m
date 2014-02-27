From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Thu, 27 Feb 2014 11:32:30 +0200
Message-ID: <530F062E.9030202@ti.com>
References: <1392471277-16981-1-git-send-email-shc_work@mail.ru>	<CACRpkdbfWhWj6CYJB96L3GS7HCuyL9DaBS5Lxgh424SYRHzp7A@mail.gmail.com>	<530B6669.9080602@ti.com> <CACRpkdbgr5_i2XCCeTDUw3SVsEJ4Q3BjHh++0BSSYSzkxPa8iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:40157 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbaB0Jck (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 27 Feb 2014 04:32:40 -0500
In-Reply-To: <CACRpkdbgr5_i2XCCeTDUw3SVsEJ4Q3BjHh++0BSSYSzkxPa8iA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Roger Quadros <rogerq@ti.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On 02/27/2014 11:24 AM, Linus Walleij wrote:
> On Mon, Feb 24, 2014 at 4:34 PM, Roger Quadros <rogerq@ti.com> wrote:
>> On 02/24/2014 04:25 PM, Linus Walleij wrote:
>>> On Sat, Feb 15, 2014 at 2:34 PM, Alexander Shiyan <shc_work@mail.ru=
> wrote:
>>>
>>>> -       status =3D twl_i2c_write_u8(TWL4030_MODULE_LED, cached_led=
en,
>>>> -                                 TWL4030_LED_LEDEN_REG);
>>>> +
>>>> +       twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
>>>> +                        TWL4030_LED_LEDEN_REG);
>>>
>>> Isn't the right fix to actually *check* this status instead?
>>>
>>> TI dudes?
>>
>> Yes we should check for error. But the only action we can take is ma=
ybe print an error message
>> as all the users of this function return void. e.g. twl_set().
>>
>> It seems the set() hook of struct gpio_chip also doesn't expect any =
return value. Wondering if that should change.
>=20
> I think in this case simply printing an error and bailing out is
> just fine, people will be able to debug from there.

=46WIW: if a write to twl4030 fails we are anyways in a big trouble. Th=
is is the
PMIC in the system, so it is likely that we do not even boot in such ca=
se.

--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
