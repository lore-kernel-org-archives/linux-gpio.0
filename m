From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into request/release
 resources methods
Date: Tue, 10 Mar 2015 09:34:23 +0100
Message-ID: <54FEAC8F.1040206@atmel.com>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com> <CACRpkdazTt+_9m-iWEee2gJy4MQ+QNo3Rb2JY9hVSSXK2-dJRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdazTt+_9m-iWEee2gJy4MQ+QNo3Rb2JY9hVSSXK2-dJRw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: linux-gpio@vger.kernel.org

Le 09/03/2015 17:14, Linus Walleij a =C3=A9crit :
> On Sun, Feb 8, 2015 at 7:23 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>=20
>> The gpiochip_lock_as_irq call can fail and return an error, while th=
e
>> irq_startup is not expected to fail (returns an unsigned int which i=
s not
>> checked by irq core code).
>>
>> irq_request/release_resources functions have been created to address=
 this
>> problem.
>>
>> Move gpiochip_lock/unlock_as_irq calls into
>> irq_request/release_resources functions to prevent using a gpio as a=
n irq
>> if the gpiochip_lock_as_irq call failed.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>=20
> Patch applied with all the ACKs.

Hi Linus,

As suggested earlier, do you think it can be scheduled for the 4.0-rc
phase as a "fix"?

Bye,



> Happy new year J-C!
>=20
> Yours,
> Linus Walleij
>=20
>=20


--=20
Nicolas Ferre
