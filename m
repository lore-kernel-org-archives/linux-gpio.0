From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 3 Nov 2015 15:51:44 +0530
Message-ID: <CAP245DXZ8fZgqo790s-_RqP1UU1-zvjRHiHus98RvO-Lzim-XQ@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
	<20151101024144.GF28319@sirena.org.uk>
	<2109736.Oi4ERkUO0L@adelgunde>
	<20151103085052.GN20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34478 "EHLO
	mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276AbbKCKVo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 05:21:44 -0500
Received: by iody8 with SMTP id y8so13768042iod.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 02:21:44 -0800 (PST)
In-Reply-To: <20151103085052.GN20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>

On Tue, Nov 3, 2015 at 2:20 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 03, 2015 at 08:39:13AM +0100, Markus Pargmann wrote:
>
>> I think we need real gpio userspace tools for such a chardev interface and not
>> only a library. On the one hand there are all the kernel/userspace developers
>> that just want to test stuff. On the other hand there are really a lot of
>> people that are using small embedded devices (e.g. beaglebone, raspberry pi,
>> ...) for really simple applications like using GPIOs to control something. I am
>> sure many of them are just using some really simple bash code to reach their
>> goals.
>
> There's already some work going on on producing tooling for the maker
> community which is currently working with the existing interfaces,
> attempting to abstract them for users to handle things like base board
> differences - I believe that's part of the motivation behind this work.

Here is an example[1] of the kind of workarounds needed to get a
consistent userspace programming interface by mapping SoC-specific
gpios to fixed gpio names on the expansion connector of a 96board.

Ideally, the kernel would allow us to do this through some DT properties.

Regards,
Amit

[1] https://github.com/96boards/96BoardsGPIO/blob/a17e58867ecfeba36d163580bc1839ffdbca8cca/lib/__gpio.h
