From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [GIT PULL] ARM: mvebu: drivers for v4.9 (#1)
Date: Tue, 20 Sep 2016 09:09:29 +0200
Message-ID: <87wpi76o9i.fsf@free-electrons.com>
References: <87a8fabikx.fsf@free-electrons.com> <4134529.ol6KhRYAQp@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:56043 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752132AbcITHJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2016 03:09:32 -0400
In-Reply-To: <4134529.ol6KhRYAQp@wuerfel> (Arnd Bergmann's message of "Tue, 20
        Sep 2016 00:16:41 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org

Hi Arnd,
 
 On mar., sept. 20 2016, Arnd Bergmann <arnd@arndb.de> wrote:

> On Wednesday, September 14, 2016 5:35:10 PM CEST Gregory CLEMENT wrote:
>> mvebu drivers for 4.9 (part 1)
>> 
>> - Add pinctrl and clk support for the Orion5x SoC mv88f5181 variant
>> 
>> ----------------------------------------------------------------
>> Jamie Lentin (2):
>>       clk: mvebu: Add clk support for the orion5x SoC mv88f5181
>>       pinctrl: mvebu: orion5x: Generalise mv88f5181l support for 88f5181
>> 
>>  .../devicetree/bindings/clock/mvebu-core-clock.txt |  1 +
>>  .../bindings/pinctrl/marvell,orion-pinctrl.txt     |  4 +-
>>  drivers/clk/mvebu/orion.c                          | 70 ++++++++++++++++++++++
>>  drivers/pinctrl/mvebu/pinctrl-orion.c              | 23 +++----
>>  4 files changed, 86 insertions(+), 12 deletions(-)
>
> I see this touches pinctrl and clk drivers, but none of the maintainers are
> on Cc for this pull request, nor have they provided an Ack for the patches
> according to your git log.
>
> Why did you not send the driver changes to them?

My bad sorry. The changes only touch data (adding new varaiant of the
orion5x), are very trivial and won't cause any merge
conflict. Furthermore there is depency with the other pacthes in the
mvebu branches and we already did this in the past to avoid dependecy
between subsystem. _But_ I should have asked the acked-by from the
drivers maintainers, it was the way we wolved it in the past and I
forgot it.

>
> Not pulled for now, until this is resolved, sorry.

If the drivers maintainer for pinctrl and clk give their acked-by do you
agree to take it for 4.9?

Thanks,

Gregory
-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
