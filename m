From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIO: Fix checkpatch.pl issues
Date: Wed, 10 Jun 2015 11:17:10 +0900
Message-ID: <CAAVeFu+wXS=qGRn_qTU4AD0LQ8DUZp=EMgSYw20infejXHAejA@mail.gmail.com>
References: <20150608190305.GA11525@eve.soton.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35055 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587AbbFJCRe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2015 22:17:34 -0400
Received: by obbgp2 with SMTP id gp2so25332878obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2015 19:17:31 -0700 (PDT)
In-Reply-To: <20150608190305.GA11525@eve.soton.ac.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Lockyer <thisisdaniellockyer@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 9, 2015 at 4:03 AM, Daniel Lockyer
<thisisdaniellockyer@gmail.com> wrote:
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6bc612b..f2cab60 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1300,9 +1300,8 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
>                                 continue;
>                         }
>                         /* set outputs if the corresponding mask bit is set */
> -                       if (__test_and_clear_bit(i, mask)) {
> -                               chip->set(chip, i, test_bit(i, bits));
> -                       }
> +                       if (__test_and_clear_bit(i, mask))
> +                               chip->set(chip, i, test_bit(i, bits));}

That closing bracket at the end of the line does not look like it
should be here. Does gpiolib even compile after this?
