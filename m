From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 172/182] staging: vme: use gpiochip data pointer
Date: Mon, 14 Dec 2015 15:14:04 +0100
Message-ID: <CACRpkdbXvabyuWAt3dVZB5UCC8Z_OuxeB8opapq4kvWp6Y6mtw@mail.gmail.com>
References: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
	<566A7405.9080302@welchs.me.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35572 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786AbbLNOOF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 09:14:05 -0500
Received: by oiai186 with SMTP id i186so24286860oia.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 06:14:04 -0800 (PST)
In-Reply-To: <566A7405.9080302@welchs.me.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn@welchs.me.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

On Fri, Dec 11, 2015 at 7:58 AM, Martyn Welch <martyn@welchs.me.uk> wrote:
> On 09/12/15 13:50, Linus Walleij wrote:
>>
>> This makes the driver use the data pointer added to the gpio_chip
>> to store a pointer to the state container instead of relying on
>> container_of().
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Martyn Welch <martyn@welchs.me.uk>
>> Cc: Manohar Vanga <manohar.vanga@gmail.com>
>> Cc: devel@driverdev.osuosl.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
>
> Signed-of-by: Martyn Welch <martyn@welchs.me.uk>

Signed-off is for the delivery path so I assume you meant
Acked-by and I added that.

Yours,
Linus Walleij
