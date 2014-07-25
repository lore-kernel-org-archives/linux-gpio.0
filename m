From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] gpiolib: Provide and export gpiod_export_name
Date: Fri, 25 Jul 2014 07:09:59 -0700
Message-ID: <53D26537.9000203@roeck-us.net>
References: <1406139132-5404-1-git-send-email-linux@roeck-us.net> <CAAVeFuKsJpSYo2DMyTdYE2J5Cu_ZD=b9o-=S0DLDccyNmwniNg@mail.gmail.com> <53D0A7E4.1040707@aksignal.cz> <53D0A983.9000900@roeck-us.net> <53D20B6E.9010808@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:59144 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752279AbaGYOKA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jul 2014 10:10:00 -0400
In-Reply-To: <53D20B6E.9010808@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jiri.prchal@aksignal.cz, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>

On 07/25/2014 12:46 AM, Ji=C5=99=C3=AD Prchal wrote:
> What about this modification? If is defined label, use it prioritlly,=
 at second use name in chip description.
>
> @@ -842,7 +842,9 @@ int gpiod_export(struct gpio_desc *desc, bool dir=
ection_may_change)
>       spin_unlock_irqrestore(&gpio_lock, flags);
>
>       offset =3D gpio_chip_hwgpio(desc);
> -    if (desc->chip->names && desc->chip->names[offset])
> +    if (desc->label)
> +        ioname =3D desc->label;
> +    else if (desc->chip->names && desc->chip->names[offset])
>           ioname =3D desc->chip->names[offset];
>

Label is not unique. It is, for example, used by the sysfs export funct=
ion,
and all pins exported from user space have the same label. The first
pin exported through sysfs would be named "sysfs", the second export
would fail.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
