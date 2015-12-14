From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 112/182] pinctrl: samsung: use gpiochip data pointer
Date: Mon, 14 Dec 2015 23:00:07 +0900
Message-ID: <CA+Ln22F-AVJjJ_PA6gJ0299uvqeKMNUCuhQPnviJd=J8KGEhzQ@mail.gmail.com>
References: <1449667992-3104-1-git-send-email-linus.walleij@linaro.org>
	<CA+Ln22HrFVwtMDRg4wC10EwESf+PixDa4-3eKsqnD4ELEGqSXQ@mail.gmail.com>
	<CACRpkdYCqKXjnaA2C0ynF8x3mFUyo6bV9ViZJD8haHNG1wpS4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:32934 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932588AbbLNOAH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 09:00:07 -0500
Received: by qkck189 with SMTP id k189so99577084qkc.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 06:00:07 -0800 (PST)
In-Reply-To: <CACRpkdYCqKXjnaA2C0ynF8x3mFUyo6bV9ViZJD8haHNG1wpS4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

2015-12-14 22:55 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Dec 11, 2015 at 7:14 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Linus,
>>
>> 2015-12-09 22:33 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
>>> This makes the driver use the data pointer added to the gpio_chip
>>> to store a pointer to the state container instead of relying on
>>> container_of().
>>
>> I always thought container_of() was preferred because of higher type
>> safety than void *data pointers. Is there any reason for mandating the
>> (IMHO worse) new method of accessing data, even though the one
>> currently used seems to be still valid?
>
> This is explained in patch 000/182:
> http://marc.info/?l=linux-gpio&m=144966662402660&w=2

Okay, fair enough.

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
