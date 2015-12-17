From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Thu, 17 Dec 2015 10:09:05 +0100
Message-ID: <CACRpkdauunHxQ9caSkJUPw6nn_B6R1u7Ve__4szneh-FKbS3NQ@mail.gmail.com>
References: <20151216140456.GA20121@panicking>
	<56717A1F.7020105@mentor.com>
	<20151216152511.GB20121@panicking>
	<5671B45D.1030407@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34245 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbbLQJJH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 04:09:07 -0500
Received: by mail-oi0-f44.google.com with SMTP id o124so39350536oia.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 01:09:06 -0800 (PST)
In-Reply-To: <5671B45D.1030407@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

On Wed, Dec 16, 2015 at 7:58 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> Later on Bjorn's commit e20538b82 ("gpio: Propagate errors from
> chip->get()") (dated Aug 28, 2015) changed the return type from bool =
to int,
> so you get the error now.

Right.

> I believe the right decision will be to fix all currently broken gpio=
chip
> .get() functions, most probably returning a negative error was done o=
n
> purpose, Linus, please confirm.

On (A): yes the right thing to do is to fix all broken .get() functions=
=2E
Help appreciated.

Yes, that is described in a response in the mail chain: we once believe=
d
that get/set would not return negative so I was about to actually make
them bool. I was thinking it's just a register write or something.
gpiolib was once invented for that simple usecase.

But then we realized that e.g. a GPIO expander can fail an I2C
transaction for whatever reason (hardware failure for example) and
we need to handle that, so Bj=C3=B6rn's fix is the right one and we nee=
d
to fix the drivers.

I'm sorry for not realizing the scope of the problem :(

>         chip =3D desc->chip;
>         offset =3D gpio_chip_hwgpio(desc);
> -       value =3D chip->get ? chip->get(chip, offset) : false;
> +       value =3D chip->get ? chip->get(chip, offset) : -EIO;
> +       value =3D value < 0 ? value : !!value;
>
> ^^^ this !! is a naive attempt to imitate backward compatible behavio=
ur,
> however it is broken, because if some !0 value is returned, then it m=
ight
> happen that (value < 0) branch is selected.

Hm. But we still need to propagate errors.

Maybe we should patch this back to not propagate errors for the
v4.4-rcS and then revert that and do the real fix, proofreading all
vulnerable drivers for v4.5, what do you say?

(I'll send a patch.)

> Linus, I missed any relative discussion on the mailing list, what is =
the
> final decision, can _gpiod_get_raw_value() return errors or not?

What do you think about my proposal to revert to the old behaviour
for v4.4 and we'll go over all drivers and provide a deeper fix in v4.5=
?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
