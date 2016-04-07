From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] gpio: document open drain/source behaviour
Date: Thu, 7 Apr 2016 09:52:49 +0200
Message-ID: <DCEF7592-98F7-4F55-AB91-74B514444E85@goldelico.com>
References: <1459868162-9736-1-git-send-email-linus.walleij@linaro.org> <CAMuHMdUvtd+EdwJjW3wLYeMxLDZWRfvUSustxEAUjP-Rvjf3JQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:20743 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751964AbcDGHxC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2016 03:53:02 -0400
In-Reply-To: <CAMuHMdUvtd+EdwJjW3wLYeMxLDZWRfvUSustxEAUjP-Rvjf3JQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Hennerich <michael.hennerich@analog.com>, Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi,

> Am 07.04.2016 um 09:34 schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> 
> Hi Linus,
> 
> On Tue, Apr 5, 2016 at 4:56 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> This has been a totally undocumented feature for years so add some
>> generic concepts and documentation about open drain/source, include
>> some facts on how we now support for hardware.
>> 
>> Cc: Michael Hennerich <michael.hennerich@analog.com>
>> Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
>> Cc: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I saw this appear in gpio/for-next, so let's review it ;-)
> 
>> --- a/Documentation/gpio/driver.txt
>> +++ b/Documentation/gpio/driver.txt
>> @@ -68,6 +68,74 @@ control callbacks) if it is expected to call GPIO APIs from atomic context
>> on -RT (inside hard IRQ handlers and similar contexts). Normally this should
>> not be required.
>> 
>> +
>> +GPIOs with open drain/source support
>> +------------------------------------
>> +
>> +Open drain (CMOS) or open collector (TTL) is traditionally a way to achieve
>> +wire-OR on an I/O line, for example a GPIO line, using a single transistor.

IMHO wired-or is not the standard use case of open-drain GPIOs (under control of a CPU inside a SoC).

They are more used for level shifting. A push-pull driver has a definitive "high level" voltage
while open drains can drive different voltages, e.g. for controlling LEDs or pulling down inputs of
chips with different I/O voltage (as long as they don't burn the SoC).

>> +This means the line is not actively driven high, instead you provide the
>> +drain/collector as output, so when the transistor is not open, it will present
>> +a high-impedance (tristate) to the external rail. This means it will not
>> +conflict with other similarly wired I/O lines on the rail, and when accompanied
>> +with a pull-up resistor, this will tend to high level unless one of the
>> +transistors on the rail actively pull it down.
> 
> pulls

Sometimes they are used for gpio bitbang i2c (which is of course a wired-or connection/bus).

> 
> 
>> +Modern electronics very seldom has this kind of single-transistor output

Modern? Very seldom?

It is still common for peripheral chips and I don't see any trend which justifies "modern" (implying vs. "ancient").

Here, we mainly have a special case that gpios come with an additional transistor and
we want to turn it off because the hardware doesn't want to see it.

If a chip or pin would not be programmable and "general purpose" and needs to be single-ended
that additional transistor would simply not be included in the silicon chip.

>> +stage. Instead they usually have a CMOS "totempole" with one N-MOS and one

same for "usually" which implies a rationale that does not exist. I.e. chip design decisions
are not based on some "common use" but on "need for this specific case".

> 
> totem-pole
> 
>> +P-MOS transistor where one of them drive the line high and one of them drive
> 
> drives ... drives
> 
>> +the line low. This is called a push-pull-output. The "totempole" looks like so,
> 
> push-pull output (consistency with below) ... totem pole
> 
>> +and shold be familiar to anyone working with electronics:
> 
> should
> 
>> +Hardware that supports open drain or open source or both, can implement a
>> +special callback in the gpio_chip: .set_single_ended() that takes an enum flag
>> +telling whether to configure the line as open drain, open source or push-pull.
>> +This will happen i response to the GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag
> 
> in
> 
>> +set in the machine file, or coming from other hardware descriptions.
>> +
>> +If this state can not be configured in hardware, i.e. if the GPIO hardware does
>> +not support open drain/open source in hardware, the GPIO library will instead
>> +use a trick: when a line is set as output, if the line is flagged as open
>> +drain, and the output value is negative, it will be driven low as usual. But
>> +if the output value is set to positive, it will instead *NOT* be driven high,
>> +instead it will be switched to input, as input mode is high impedance, thus
>> +achieveing a "open drain emulation" of sorts: electrically the behaviour will
> 
> achieving an
> 
>> +be identical, with the exception of possible hardware glitches when switching
>> +the mode of the line.
> 
> Gr{oetje,eeting}s,
> 
>                        Geert

Hope this helps.

BR,
NIkolaus