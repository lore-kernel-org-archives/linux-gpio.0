From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: Do not accept gpio chip additions before gpiolib
 initialization
Date: Wed, 30 Mar 2016 02:16:02 -0700
Message-ID: <56FB9952.1030503@roeck-us.net>
References: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
 <CAAVeFuJZuOWAeG7q=WaZj0f6ch9zmOHvBZReYDnqbFQLsP7G5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42723 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932510AbcC3JQH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2016 05:16:07 -0400
In-Reply-To: <CAAVeFuJZuOWAeG7q=WaZj0f6ch9zmOHvBZReYDnqbFQLsP7G5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 03/30/2016 01:37 AM, Alexandre Courbot wrote:
> On Wed, Mar 30, 2016 at 3:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
>> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
>> attempts to add a gpio chip prior to gpiolib initialization cause the
>> system to crash. Dump a warning to the console and return an error
>> if the situation is encountered.
>
> Mmm I see the problem but this could seriously delay the availability
> of some GPIOs that are useful for early system boot.
>
> I have not followed the GPIO device patches as closely as I should
> have, but shouldn't you be able to register a GPIO chip without
> immediately presenting it to user-space, for internal kernel needs? If
> gpiolib is not initialized, then device-related operations would be
> skipped, and gpiolib_dev_init() could then parse the list of
> registered chips and fix them up when it gets called.
>
> Again, I'm speaking without real knowledge here, but that pattern
> seems more resilent to me.
>
You are absolutely right, but my knowledge of gpiolib is not good enough
to make that change. See this as a band-gap; it is better than just crashing.

Guenter

