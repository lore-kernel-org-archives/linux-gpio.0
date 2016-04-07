From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: document open drain/source behaviour
Date: Thu, 7 Apr 2016 09:34:32 +0200
Message-ID: <CAMuHMdUvtd+EdwJjW3wLYeMxLDZWRfvUSustxEAUjP-Rvjf3JQ@mail.gmail.com>
References: <1459868162-9736-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:33795 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175AbcDGHed (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2016 03:34:33 -0400
Received: by mail-ig0-f194.google.com with SMTP id qu10so10910342igc.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Apr 2016 00:34:33 -0700 (PDT)
In-Reply-To: <1459868162-9736-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Hennerich <michael.hennerich@analog.com>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

Hi Linus,

On Tue, Apr 5, 2016 at 4:56 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This has been a totally undocumented feature for years so add some
> generic concepts and documentation about open drain/source, include
> some facts on how we now support for hardware.
>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I saw this appear in gpio/for-next, so let's review it ;-)

> --- a/Documentation/gpio/driver.txt
> +++ b/Documentation/gpio/driver.txt
> @@ -68,6 +68,74 @@ control callbacks) if it is expected to call GPIO APIs from atomic context
>  on -RT (inside hard IRQ handlers and similar contexts). Normally this should
>  not be required.
>
> +
> +GPIOs with open drain/source support
> +------------------------------------
> +
> +Open drain (CMOS) or open collector (TTL) is traditionally a way to achieve
> +wire-OR on an I/O line, for example a GPIO line, using a single transistor.
> +This means the line is not actively driven high, instead you provide the
> +drain/collector as output, so when the transistor is not open, it will present
> +a high-impedance (tristate) to the external rail. This means it will not
> +conflict with other similarly wired I/O lines on the rail, and when accompanied
> +with a pull-up resistor, this will tend to high level unless one of the
> +transistors on the rail actively pull it down.

pulls

> +Modern electronics very seldom has this kind of single-transistor output
> +stage. Instead they usually have a CMOS "totempole" with one N-MOS and one

totem-pole

> +P-MOS transistor where one of them drive the line high and one of them drive

drives ... drives

> +the line low. This is called a push-pull-output. The "totempole" looks like so,

push-pull output (consistency with below) ... totem pole

> +and shold be familiar to anyone working with electronics:

should

> +Hardware that supports open drain or open source or both, can implement a
> +special callback in the gpio_chip: .set_single_ended() that takes an enum flag
> +telling whether to configure the line as open drain, open source or push-pull.
> +This will happen i response to the GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag

in

> +set in the machine file, or coming from other hardware descriptions.
> +
> +If this state can not be configured in hardware, i.e. if the GPIO hardware does
> +not support open drain/open source in hardware, the GPIO library will instead
> +use a trick: when a line is set as output, if the line is flagged as open
> +drain, and the output value is negative, it will be driven low as usual. But
> +if the output value is set to positive, it will instead *NOT* be driven high,
> +instead it will be switched to input, as input mode is high impedance, thus
> +achieveing a "open drain emulation" of sorts: electrically the behaviour will

achieving an

> +be identical, with the exception of possible hardware glitches when switching
> +the mode of the line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
