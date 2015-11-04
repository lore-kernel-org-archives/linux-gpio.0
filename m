From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH] gpio: change member .dev to .parent
Date: Wed, 4 Nov 2015 10:54:48 +0100
Message-ID: <20151104095448.GA20076@samfundet.no>
References: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:45024 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754672AbbKDJzB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 04:55:01 -0500
Content-Disposition: inline
In-Reply-To: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Alek Du <alek.du@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>

Around Wed 04 Nov 2015 10:31:15 +0100 or thereabout, Linus Walleij wrot=
e:
> The name .dev in a struct is normally reserved for a struct device
> that is let us say a superclass to the thing described by the struct.
> struct gpio_chip stands out by confusingly using a struct device *dev
> to point to the parent device (such as a platform_device) that
> represents the hardware. As we want to give gpio_chip:s real devices,
> this is not working. We need to rename this member to parent.
>=20
> This was done by two coccinelle scripts, I guess it is possible to
> combine them into one, but I don't know such stuff. They look like
> this:
>=20
> @@
> struct gpio_chip *var;
> @@
> -var->dev
> +var->parent
>=20
> and:
>=20
> @@
> struct gpio_chip var;
> @@
> -var.dev
> +var.parent
>=20
> This patch hits all over the place, but I *strongly* prefer this
> solution to any piecemal approaches that just exercise patch
> mechanics all over the place. It mainly hits drivers/gpio and
> drivers/pinctrl which is my own backyard anyway.
>=20
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Alek Du <alek.du@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Other subsystem maintainers: please ACK this. I want to merge this
> big patch in the beginning of -rc1. I can create an immutable branch
> or tag if you think it will cause you problems, so you can pull it
> in.
> ---
>  arch/avr32/mach-at32ap/pio.c                  |  2 +-

=46or the tiny AVR32 bits

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

<snipp everything else>

--=20
Best regards, Hans-Christian Egtvedt
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
