From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpiolib: Add GPIO initialization
Date: Sun, 29 Nov 2015 22:32:34 +0100
Message-ID: <CACRpkdb=kqzJ7ZYJk0Hb2pA7ktoTK4U+1Ui83QgYuvqB6HT1XA@mail.gmail.com>
References: <1447754878-21099-1-git-send-email-mpa@pengutronix.de>
	<1447754878-21099-3-git-send-email-mpa@pengutronix.de>
	<33694835.x5uTstGuv8@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33120 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752450AbbK2Vce (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Nov 2015 16:32:34 -0500
Received: by oixx65 with SMTP id x65so84964152oix.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 13:32:34 -0800 (PST)
In-Reply-To: <33694835.x5uTstGuv8@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Nov 17, 2015 at 11:21 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

>> +int gpiod_initialize(struct gpio_desc *desc, unsigned long lflags,
>> +                  enum gpiod_flags dflags)
>> +{
>> +     int status;
>> +
>
> Sorry, this is missing a gpiod_parse_flags(). Will fix this and resend tomorrow.

I haven't seen a new version, am I looking in the wrong places?

Yours,
Linus Walleij
