From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: pisosr: Don't use magic numbers
Date: Tue, 16 Feb 2016 17:00:06 +0100
Message-ID: <CACRpkdZtHHUAGFTKErTqVy+R-0TAdY9i9ckUwnPAdQ0rK2D8BQ@mail.gmail.com>
References: <1455527640-10446-1-git-send-email-alexander.stein@systec-electronic.com>
	<CACRpkda2LXaPFHdqkonNwnRwv_YhTN3AoOsH-wTRoBZ+-J9shg@mail.gmail.com>
	<1799444.UXy1g4WTOV@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33032 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753193AbcBPQA2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 11:00:28 -0500
Received: by mail-ob0-f181.google.com with SMTP id jq7so80626501obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 08:00:28 -0800 (PST)
In-Reply-To: <1799444.UXy1g4WTOV@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 16, 2016 at 4:35 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Well, having a callback get_direction returning a bool would seem really strange.

Well maybe an enum would be better. Patches accepted.

> Actually the comments on gpiod_get_direction explicitly state GPIOF_DIR_IN and GPIOF_DIR_OUT
> as return values which aren't used in that function itself, they come from the callback.

Yeah so it is the gpiolib core that need to make sure the right value is
propagated back to the API, not the driver. It exploits the fact that
driver return a suiting 0/1 that happen to correspond to that.

> Also other
> dirvers like e.g. gpio-ich return (in ichx_gpio_get_direction) GPIOF_DIR_IN or GPIOF_DIR_OUT.

Two wrong doesn't make one right. Patch gpio-ich to return 0/1 if
you like, or even better: add a direction enum to <linux/gpio/driver.h>
and start patching the callback and drivers to use that.

Overall this is a thing that "just works" mostly, but I have had
many problems with the driver and consumer API being mixed
up (mostly by everyone using <linux/gpio.h> and I don't want
to encourage that mess.

Drivers should use <linux/gpio/driver.h> and nothing else.
Consumers should use <linus/gpio/consumer.h> and nothing else.

The latter require that they switch to GPIO descriptors though.
I think.

Yours,
Linus Walleij
