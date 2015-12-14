From: Martyn Welch <martyn@welchs.me.uk>
Subject: Re: [PATCH 172/182] staging: vme: use gpiochip data pointer
Date: Mon, 14 Dec 2015 21:51:59 +0000
Message-ID: <566F39FF.5030503@welchs.me.uk>
References: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
 <566A7405.9080302@welchs.me.uk>
 <CACRpkdbXvabyuWAt3dVZB5UCC8Z_OuxeB8opapq4kvWp6Y6mtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36202 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932273AbbLNVwC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 16:52:02 -0500
Received: by mail-wm0-f45.google.com with SMTP id n186so138699459wmn.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 13:52:01 -0800 (PST)
In-Reply-To: <CACRpkdbXvabyuWAt3dVZB5UCC8Z_OuxeB8opapq4kvWp6Y6mtw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>



On 14/12/15 14:14, Linus Walleij wrote:
> On Fri, Dec 11, 2015 at 7:58 AM, Martyn Welch <martyn@welchs.me.uk> wrote:
>> On 09/12/15 13:50, Linus Walleij wrote:
>>> This makes the driver use the data pointer added to the gpio_chip
>>> to store a pointer to the state container instead of relying on
>>> container_of().
>>>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Martyn Welch <martyn@welchs.me.uk>
>>> Cc: Manohar Vanga <manohar.vanga@gmail.com>
>>> Cc: devel@driverdev.osuosl.org
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Signed-of-by: Martyn Welch <martyn@welchs.me.uk>
> Signed-off is for the delivery path so I assume you meant
> Acked-by and I added that.

Yeah, no problem.

Martyn
> Yours,
> Linus Walleij

