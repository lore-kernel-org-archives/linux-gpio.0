From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Tue, 31 May 2016 13:59:42 +0200
Message-ID: <CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
	<1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
	<20160427160034.GA20392@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33858 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861AbcEaL7o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 07:59:44 -0400
Received: by mail-oi0-f47.google.com with SMTP id e72so20366654oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 04:59:43 -0700 (PDT)
In-Reply-To: <20160427160034.GA20392@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Wed, Apr 27, 2016 at 6:00 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Tue, Apr 26, 2016 at 10:54:26AM +0200, Linus Walleij wrote:
>> The gpio-hammer is used from userspace as an example of how
>> to retrieve a GPIO handle for one or several GPIO lines and
>> hammer the outputs from low to high and back again. It will
>> pulse the selected lines once per second for a specified
>> number of times or indefinitely if no loop count is
>> supplied.
>>
>> Example output:
>> $ gpio-hammer -n gpiochip0 -o5 -o6 -o7
>> Hammer lines [5, 6, 7] on gpiochip0, initial states: [1, 1, 1]
>> [-] [5: 0, 6: 0, 7: 0]
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Tested-by: Michael Welling <mwelling@ieee.org>

Thanks! :)

> Below is the output from my target.

You can now get rid of all the "unnamed" in the first column
by supplying the line/rail names in gpio-line-names = "A", "B" ...;
in the GPIO controller node in the device tree for the platform,
if it uses device tree too boot.

> You will notice that a kernel warning is
> spewed out if I use the mcp23s08.
> The processor GPIOs work fine as verified by blinking LEDs.
>
> root@som3517-som200:~# ./lsgpio
> GPIO chip: gpiochip4, "mcp23s08", 8 GPIO lines
>         line  0: unnamed unused
>         line  1: unnamed unused
>         line  2: unnamed unused
>         line  3: unnamed unused
>         line  4: unnamed unused
>         line  5: unnamed unused
>         line  6: unnamed unused
>         line  7: unnamed unused

> root@som3517-som200:~# ./gpio-hammer -n gpiochip4 -o0
> [  187.511606] ------------[ cut here ]------------
> [  187.516949] WARNING: CPU: 0 PID: 830 at /home/michael/projects/linux/linux-git/drivers/gpio/gpiolib.c:1907 gpiod_get_value+0x60/0xa4

Ah that's right, I have to use gpiod_get_value_cansleep(). Will
fix that.

Yours,
Linus Walleij
