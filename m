From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 156/182] input: adp5589-keys: use gpiochip data pointer
Date: Sun, 13 Dec 2015 22:00:00 +0100
Message-ID: <CACRpkdY10bVq_2dBdg+1=BkT-XjxHJ2uN=Wt2f=NJ-YgHWqoPg@mail.gmail.com>
References: <1449668710-5785-1-git-send-email-linus.walleij@linaro.org>
	<20151209234752.GB8146@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36399 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752409AbbLMVAC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 16:00:02 -0500
Received: by oian133 with SMTP id n133so4487548oia.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 13:00:01 -0800 (PST)
In-Reply-To: <20151209234752.GB8146@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Michael Hennerich <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Thu, Dec 10, 2015 at 12:47 AM, Michael Welling <mwelling@ieee.org> wrote:
> On Wed, Dec 09, 2015 at 02:45:10PM +0100, Linus Walleij wrote:
>> @@ -525,7 +525,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
>>
>>       mutex_init(&kpad->gpio_lock);
>>
>> -     error = gpiochip_add(&kpad->gc);
>> +     error = gpiochip_add_data(&kpad->gc, kpad);
>>       if (error) {
>>               dev_err(dev, "gpiochip_add failed, err: %d\n", error);
>
> Another dev_err referencing gpiochip_add instead of gpiochip_add_data.

I just went in and edited the commit. No other change so not resending,
OK?

First I thought this textstring thing was minor but now I'm fixing it up,
why not.

Yours,
Linus Walleij
