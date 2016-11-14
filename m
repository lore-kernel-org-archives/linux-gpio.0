From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/2] pinctrl: bcm2835: Fix ints for GPIOs 28-31 & 46-53
Date: Mon, 14 Nov 2016 10:24:03 -0800
Message-ID: <877f85vs1o.fsf@eliezer.anholt.net>
References: <1479126206-20482-1-git-send-email-linus.walleij@linaro.org> <427a3d44-16aa-258c-8722-48d9c7ffb593@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <427a3d44-16aa-258c-8722-48d9c7ffb593@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-gpio@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Linus,
>
> Am 14.11.2016 um 13:23 schrieb Linus Walleij:
>> From: Phil Elwell <phil@raspberrypi.org>
>>
>> Contrary to the documentation, the BCM2835 GPIO controller actually
>> has four interrupt lines - one each for the three IRQ groups and one
>> common. Confusingly, the GPIO interrupt groups don't correspond
>> directly with the GPIO control banks. Instead, GPIOs 0-27 generate IRQ
>> GPIO0, 28-45 IRQ GPIO1 and 46-53 IRQ GPIO2.
>>
>> Awkwardly, the GPIOs for IRQ GPIO1 straddle two 32-entry GPIO banks,
>> so split out a function to process the interrupts for a single GPIO
>> bank.
>>
>> Cc: Stefan Wahren <stefan.wahren@i2se.com>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: Stephen Warren <swarren@wwwdotorg.org>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> I want to apply this to cater for my GPIOLIB_IRQCHIP
>> refactorings.
>> ---
>>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 51 ++++++++++++++++++++++++++---------
>>  1 file changed, 39 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> index b2dd278f18b1..1d8fc104e26b 100644
>> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>>
> ...
>> @@ -1076,6 +1102,7 @@ static struct platform_driver bcm2835_pinctrl_driver = {
>>  	.remove = bcm2835_pinctrl_remove,
>>  	.driver = {
>>  		.name = MODULE_NAME,
>> +		.owner = THIS_MODULE,
>
> this is unnecessary. Please remove it.
>
> Thanks for submitting these patches

With that dropped,

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYKgFDAAoJELXWKTbR/J7oFmYQALI6hwQX4dtYwNwSy6n6iK1j
883Xp+Olitmbu6WzIeYEW97Ezu/EJGfgVNXlmPqQs0vIQqEOu2FpWKOvFlXbnDeh
JFXccFpvxpiq++QI6NnIrZqFEX2ValqwFkm/j2XNzOEUXzoYqjZOZL8Cr3xOnBAh
U1bLPEDb4z7UEDOLabyeyEHnZwo1p1UCFz7E8PEHTdKDeQkOZVeU3+YfG6zlTFKi
RdWz1fnN5sY4bKAOzV47YDBIgwWysvRUx9nrvuNajpADF1kvXV8X0+f/d7bYOwv9
E4E/LcEAb4uBiUw3Pj/x2351BXR95Aw1+kL7bbylLyTkTPr5qRUZalAuT1xyWsHF
gQk1LzifCPlY/dNuGnTGp1Ag1+vFXq3j3xKzfVxP1K0VRi3MzVdm/wGlDl+OsSKr
Zh3XrjIHohUCuNfx4M8ATg+T1GE98afdW1qfgDSrFnEdUXQLqeTYm+qOXVAWp4vJ
v5BJzKZdEsxECsyhx1UAemRwtXJspiYauBqLPBA/I7gtuKP1vwZbJeMO7gU8moP3
zIJYXqh4CNZrlKkyrYURdnd+qpQgP7INuxIgNGDhJUBd6OyDdPHN6l6MwGxeusMt
gVf1Kki17kk1drTk/HbTVgXFVevLZqNh3ZV8muskY8b0n6h8t7XQxfR6fpPUR692
cMEihBhupi5kw4a8hWo0
=NERs
-----END PGP SIGNATURE-----
--=-=-=--
