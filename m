From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] gpio: add DT bindings for existing consumer flags
Date: Fri, 25 Sep 2015 08:09:15 +0200
Message-ID: <EBC28AC7-9506-4445-861E-9E751467BE03@goldelico.com>
References: <1443132555-8244-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:31893 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755146AbbIYGJ3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 02:09:29 -0400
In-Reply-To: <1443132555-8244-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>


Am 25.09.2015 um 00:09 schrieb Linus Walleij <linus.walleij@linaro.org>=
:

> It is customary for GPIO controllers to support open drain/collector
> and open source/emitter configurations. Add standard GPIO line flags
> to account for this and augment the documentation to say that these
> are the most generic bindings.
>=20
> Several people approached me to add new flags to the lines, and this
> makes sense, but let's first bind up the most common cases before we
> start to add exotic stuff.
>=20
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Documentation/devicetree/bindings/gpio/gpio.txt | 15 +++++++++++++--
> include/dt-bindings/gpio/gpio.h                 |  2 ++
> 2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio.txt
> index 5788d5cf1252..7b1c8bc24e2d 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -52,9 +52,13 @@ only uses one.
>=20
> gpio-specifier may encode: bank, pin position inside the bank,
> whether pin is open-drain and whether pin is logically inverted.
> +
> Exact meaning of each specifier cell is controller specific, and must
> -be documented in the device tree binding for the device. Use the mac=
ros
> -defined in include/dt-bindings/gpio/gpio.h whenever possible:
> +be documented in the device tree binding for the device.
> +
> +Most controllers are however specifying a generic flag bitfield
> +in the last cell, so for these, use the macros defined in
> +include/dt-bindings/gpio/gpio.h whenever possible:
>=20
> Example of a node using GPIOs:
>=20
> @@ -65,6 +69,13 @@ Example of a node using GPIOs:
> GPIO_ACTIVE_HIGH is 0, so in this example gpio-specifier is "18 0" an=
d encodes
> GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-co=
ntroller.
>=20
> +Optional standard bitfield specifiers for the last cell:
> +
> +- Bit 0: 0 means active high, 1 means active low
> +- Bit 1: 1 means open drain/open collector, see:
> +           https://en.wikipedia.org/wiki/Open_collector
> +- Bit 2: 1 means open source/open emitter
> +
> 1.1) GPIO specifier best practices
> ----------------------------------
>=20
> diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gp=
io/gpio.h
> index e6b1e0a808ae..f5ed02e81bf7 100644
> --- a/include/dt-bindings/gpio/gpio.h
> +++ b/include/dt-bindings/gpio/gpio.h
> @@ -11,5 +11,7 @@
>=20
> #define GPIO_ACTIVE_HIGH 0
> #define GPIO_ACTIVE_LOW 1
> +#define GPIO_OPEN_DRAIN 2
> +#define GPIO_OPEN_SOURCE 4

this would allow to specify open drain and source
in parallel (6) - which would mean a completely floating
output=85 Is this intended?

Some hardware may also have open_collector
or open_emitter - which is logically the same.

So I have tried to find a common term covering all
these cases. It appears to be =93single-ended=94
https://en.wikipedia.org/wiki/Single-ended_triode
as opposite to =93push-pull" outputs (and =93tri-state").

So I would suggest:

#define GPIO_PUSH_PULL 0
#define GPIO_SINGLE_ENDED 2

and the distinction with pull-down (open drain/collector)
and pull-up (open source/emitter) to be combined with
ACTIVE_HIGH/LOW:

#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED  | GPIO_ACTIVE_LOW)
#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED  | GPIO_ACTIVE_HIGH)


>=20
> #endif
> --=20
> 2.4.3
>=20

BR,
Nikolaus Schaller

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
