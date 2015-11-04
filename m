From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] gpio: change member .dev to .parent
Date: Wed, 04 Nov 2015 14:26:25 +0100
Message-ID: <563A0781.7050504@samsung.com>
References: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64897 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965306AbbKDN03 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 08:26:29 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXA002A2LC3VD50@mailout2.w1.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 04 Nov 2015 13:26:27 +0000 (GMT)
In-reply-to: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <zajec5@gmail.com>, Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Alek Du <alek.du@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>

On 11/04/2015 10:31 AM, Linus Walleij wrote:
> The name .dev in a struct is normally reserved for a struct device
> that is let us say a superclass to the thing described by the struct.
> struct gpio_chip stands out by confusingly using a struct device *dev
> to point to the parent device (such as a platform_device) that
> represents the hardware. As we want to give gpio_chip:s real devices,
> this is not working. We need to rename this member to parent.
>
> This was done by two coccinelle scripts, I guess it is possible to
> combine them into one, but I don't know such stuff. They look like
> this:
>
> @@
> struct gpio_chip *var;
> @@
> -var->dev
> +var->parent
>
> and:
>
> @@
> struct gpio_chip var;
> @@
> -var.dev
> +var.parent
>
> This patch hits all over the place, but I *strongly* prefer this
> solution to any piecemal approaches that just exercise patch
> mechanics all over the place. It mainly hits drivers/gpio and
> drivers/pinctrl which is my own backyard anyway.
>
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
[...]

=46or drivers/leds:

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

--=20
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
