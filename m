From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Thu, 31 Jul 2014 11:35:17 +0900
Message-ID: <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
References: <25983307.ZjJOfz2Kpg@pcimr> <3862339.n8jYhAjBf6@pcimr>
 <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com> <5291550.Rzt9KR357U@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:57564 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755888AbaGaCfh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 22:35:37 -0400
Received: by mail-ig0-f173.google.com with SMTP id h18so8531276igc.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2014 19:35:37 -0700 (PDT)
In-Reply-To: <5291550.Rzt9KR357U@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Wed, Jul 30, 2014 at 6:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> On Wednesday 09 July 2014 12:17:13 Linus Walleij wrote:
>> On Mon, Jul 7, 2014 at 6:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>> > On Monday 07 July 2014 17:23:34 Linus Walleij wrote:
>> >> On Mon, Jun 16, 2014 at 3:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>> >>
>> >> > Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
>> >> > interface which allow setting multiple outputs with just one function call.
>> >> > Also add an optional set_multiple function to the driver interface. Without an
>> >> > implementation of that function in the chip driver outputs are set
>> >> > sequentially.
>> >>
>> >> Yes this looks good.
>> >>
>> >> Except for one thing I mentioned quite early  I think:
>> >>
>> >> no users!
>> >
>> > I'm pretty sure you did _not_ mention this before.
>>
>> I'm not referring to your patch set specifically. The idea of array handling
>> has been proposed something like three times, I cannot tell these discussion
>> threads apart in my head.
>>
>> But it's a reasonable request don't you think?
>>
>
> The request might be reasonable.
>
> But after taking a look at the i2c-gpio and spi-gpio drivers, I do not think they
> would benefit from the new feature. In both cases there are only two GPIO lines.
> And they have to be set separately at least half of the time.
>
> I could not find any other in-kernel driver that might benefit from the new feature, either.
>
> So I guess you are right: There are no users for this.
>
> For my use-case the feature is very beneficial, but of course only in combination
> with an out-of-kernel driver module for configuring the FPGA on my custom board.
> I posted the patch because I expected similar use-cases to exist for other people
> out there. If you think that's not the case, there is nothing I can do about it.

Personally I would be sad if this series is not merged. It is a
well-written solution to a problem that comes regularly. It is
understandable that the upstream kernel API serves, well, upstream
users - but we also need to recognize that most of the drivers using
lots of GPIOs do not get merged upstream because using GPIOs that way
is often considered a hack.

I'd be surprised if at least *one* such driver was not in mainline
though. Had a quick look but could not find anything that would be an
obvious candidate to use these new functions.
