From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Fri, 16 May 2014 18:34:18 +0200
Message-ID: <CACRpkdY7MH-omV_Zr9GV9bBASx6-VGi8YKvN4SvG9LKpKv3RMQ@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
	<CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
	<CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
	<CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:54484 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751592AbaEPQeS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 12:34:18 -0400
Received: by mail-oa0-f43.google.com with SMTP id l6so3299809oag.30
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 09:34:18 -0700 (PDT)
In-Reply-To: <CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

On Wed, May 14, 2014 at 9:47 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, May 13, 2014 at 11:48 AM, Linus Walleij

>> The basic rule is that the kernel shall handle hardware, and I just
>> get the feeling you are doing some userspace driver that should be
>> in the kernel instead.
>
> But what do you suggest to use for a system, that has a connector with
> for example 8 I/Os made via i2c I/O expander?

Depends on what they want to do with them. The GPIO expander
itself is a GPIO driver, then if there are LEDs on it, then it should
use drivers/leds/leds-gpio.c, if it's handling keys it should use
drivers/input/keyboard/gpio_keys.c (or the polled variant if the expander
does not support IRQs) etc.

> The system just provides
> a general Linux BSP, so that the customer is then responsible for the
> final software. The customer is not a kernel hacker and it is very
> simple to program via sysfs especially, when you have a wrapper
> library,

Trying to simplify the act of driving hardware is the opposite of
empowering users. They should be able to get to the guts
of what they actually want to do. If they can do such advanced stuff
as electronics and sysfs manipulation I think kernel drivers are
not much harder.

> Is it planned to provide a GPIO interface via IOCTLs for userspace or
> something like this?

That is atleast better than using sysfs, but we need someone to drive
that to make it happen.

Yours,
Linus Walleij
