From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 042/182] gpio: mpc8xxx: use gpiochip data pointer
Date: Mon, 14 Dec 2015 10:25:50 +0100
Message-ID: <CACRpkdbUuAZqnvzdfGpLTQc+mnvXeKbNrYT71JJw37FBD5uCMQ@mail.gmail.com>
References: <1449667117-31740-1-git-send-email-linus.walleij@linaro.org>
	<20151209191956.GW5072@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36831 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932093AbbLNJZu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 04:25:50 -0500
Received: by obcno2 with SMTP id no2so7978242obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 01:25:50 -0800 (PST)
In-Reply-To: <20151209191956.GW5072@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Alexander Stein <alexander.stein@systec-electronic.com>

On Wed, Dec 9, 2015 at 8:19 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Dec 09, 2015 at 02:18:37PM +0100, Linus Walleij wrote:
>> This makes the driver use the data pointer added to the gpio_chip
>> to store a pointer to the state container instead of relying on
>> container_of().
>
> I wonder why your patch is an improvement. I imagine that container_o=
f
> is cheaper in instructions and memory/cache accesses.

This is described in patch 000/182.

I'm sorry I couldn't put everyone on direct CC for that, but the mailin=
g lists
complain if I have too many recipients, so damned if I do, damned if I =
don't :(
http://marc.info/?l=3Dlinux-gpio&m=3D144966662402660&w=3D2

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
