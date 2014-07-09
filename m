From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Wed, 9 Jul 2014 12:17:13 +0200
Message-ID: <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com>
References: <25983307.ZjJOfz2Kpg@pcimr>
	<CACRpkdYBCHnCRe3sJ5Uf62ZUjZ23wM54nKs6_QwWyswHUsWaEw@mail.gmail.com>
	<3862339.n8jYhAjBf6@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:58692 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932085AbaGIKRN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jul 2014 06:17:13 -0400
Received: by mail-ob0-f178.google.com with SMTP id nu7so95708obb.23
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2014 03:17:13 -0700 (PDT)
In-Reply-To: <3862339.n8jYhAjBf6@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Mon, Jul 7, 2014 at 6:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> On Monday 07 July 2014 17:23:34 Linus Walleij wrote:
>> On Mon, Jun 16, 2014 at 3:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
>>
>> > Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
>> > interface which allow setting multiple outputs with just one function call.
>> > Also add an optional set_multiple function to the driver interface. Without an
>> > implementation of that function in the chip driver outputs are set
>> > sequentially.
>>
>> Yes this looks good.
>>
>> Except for one thing I mentioned quite early  I think:
>>
>> no users!
>
> I'm pretty sure you did _not_ mention this before.

I'm not referring to your patch set specifically. The idea of array handling
has been proposed something like three times, I cannot tell these discussion
threads apart in my head.

But it's a reasonable request don't you think?

> I'll take a look at those drivers and hopefully come back with an extended
> patch set.

Thanks.

Yours,
Linus Walleij
