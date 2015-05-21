From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH][RFC] gpiolib: rename gpiod_set_array to gpiod_set_array_value
Date: Thu, 21 May 2015 09:26:12 +0900
Message-ID: <CAAVeFuJoX046=yN9kzEF33A-h5Y4dEtk9P-Dbv=FrxsesWxvaw@mail.gmail.com>
References: <5305088.q3JD5pGOgN@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:38135 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753571AbbEUA0d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2015 20:26:33 -0400
Received: by igcau1 with SMTP id au1so52972935igc.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2015 17:26:32 -0700 (PDT)
In-Reply-To: <5305088.q3JD5pGOgN@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Wed, May 13, 2015 at 6:04 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> There have been concerns that the function names gpiod_set_array() and
> gpiod_get_array() might be confusing to users. One might expect
> gpiod_get_array() to return array values, while it is actually the array
> counterpart of gpiod_get(). To be consistent with the single descriptor API
> we could rename gpiod_set_array() to gpiod_set_array_value(). This makes
> some function names a bit lengthy: gpiod_set_raw_array_value_cansleep().

It makes the naming consistent, which is a better thing (and some of
these names were already long anyway).

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
