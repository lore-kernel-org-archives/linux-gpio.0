From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 112/182] pinctrl: samsung: use gpiochip data pointer
Date: Mon, 14 Dec 2015 14:55:30 +0100
Message-ID: <CACRpkdYCqKXjnaA2C0ynF8x3mFUyo6bV9ViZJD8haHNG1wpS4A@mail.gmail.com>
References: <1449667992-3104-1-git-send-email-linus.walleij@linaro.org>
	<CA+Ln22HrFVwtMDRg4wC10EwESf+PixDa4-3eKsqnD4ELEGqSXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:36573 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456AbbLNNzb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 08:55:31 -0500
Received: by obcno2 with SMTP id no2so12393690obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 05:55:31 -0800 (PST)
In-Reply-To: <CA+Ln22HrFVwtMDRg4wC10EwESf+PixDa4-3eKsqnD4ELEGqSXQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Fri, Dec 11, 2015 at 7:14 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Linus,
>
> 2015-12-09 22:33 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
>> This makes the driver use the data pointer added to the gpio_chip
>> to store a pointer to the state container instead of relying on
>> container_of().
>
> I always thought container_of() was preferred because of higher type
> safety than void *data pointers. Is there any reason for mandating the
> (IMHO worse) new method of accessing data, even though the one
> currently used seems to be still valid?

This is explained in patch 000/182:
http://marc.info/?l=linux-gpio&m=144966662402660&w=2

In the generic GPIO case it gets really really messy with
container_of(container_of(x)) in every driver, making the code
so hard to read that it becomes a pain to maintain and do the
right thing, trumping any type safety.

Unless someone has a real performance issue I think this is
the way to go.

Yours,
Linus Walleij
