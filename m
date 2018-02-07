From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: mcp23s08: spi: Add HW address to gpio_chip.label
Date: Wed, 7 Feb 2018 14:44:19 +0100
Message-ID: <CACRpkdYwQB_6YNpQPc_rhpx=D=_xh-kWnQ+-pXX6ef_LmgYqiA@mail.gmail.com>
References: <cover.1516997103.git.jan.kundrat@cesnet.cz> <03c5ea4d98804e4ea6b0927e5bf103106e438142.1516997103.git.jan.kundrat@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:52782 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754082AbeBGNoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 08:44:20 -0500
Received: by mail-it0-f65.google.com with SMTP id o13so2311457ito.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 05:44:20 -0800 (PST)
In-Reply-To: <03c5ea4d98804e4ea6b0927e5bf103106e438142.1516997103.git.jan.kundrat@cesnet.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc: linux-gpio@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

On Fri, Jan 26, 2018 at 8:16 PM, Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> w=
rote:

> When several devices are sharing one hardware SPI CS, there is no visual
> clue in `lsgpio` or in /sys/kernel/debug/gpio about which one is which
> one. Stuff depends on the enumeration order, and therefore lower chip
> addresses always go first, but that's just an implementation detail.
> This change includes the device-specific address in the debug output:
>
>   gpiochip4: GPIOs 464-479, parent: spi/spi1.1, mcp23s17.2, can sleep:
>   gpiochip3: GPIOs 480-495, parent: spi/spi1.1, mcp23s17.1, can sleep:
>
> Signed-off-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

Patch applied.

Yours,
Linus Walleij
