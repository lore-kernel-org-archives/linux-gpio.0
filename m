From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Wed, 15 Jun 2016 11:48:17 +0200
Message-ID: <CACRpkdYGy-3L4LR=qCSsjWKHEMAARPvybSM0AA_ujzznPJTWNw@mail.gmail.com>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
 <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
 <20160427160034.GA20392@deathstar> <CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
 <20160601034343.GA3749@deathstar> <CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
 <20160601180906.GA5286@deathstar> <CACRpkdYEfYFwnhgEGf2AmCkj7QUJm-GeQW3_CE2H4vWSNngp_Q@mail.gmail.com>
 <20160602145927.GA4198@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:32779 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbcFOJsS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2016 05:48:18 -0400
Received: by mail-oi0-f54.google.com with SMTP id u201so25590744oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2016 02:48:18 -0700 (PDT)
In-Reply-To: <20160602145927.GA4198@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Thu, Jun 2, 2016 at 4:59 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Wed, Jun 01, 2016 at 11:40:04PM +0200, Linus Walleij wrote:
>> On Wed, Jun 1, 2016 at 8:09 PM, Michael Welling <mwelling@ieee.org> wrote:
>>
>> > Is there a way to name a group of GPIOs?
>>
>> Do you mean from the producer side or the consumer side?
>
> Producer side is what I am thinking.
>
>> There is gpio-line-names in DT for the producer side.
>>
> The gpio-line-names are naming individual GPIO on a controller.
> I am looking to take a set of GPIOs and name them as a group and
> be able to access them by that name. Either individually or
> simultaneously.

There is no such mechanism currently, all lines are individual
resources.

>> Sorry not following, I guess you need to post me some part of
>> the patch or so...
>
> +       fprintf(stdout, "] on %s, initial states: [", device_name);
> +       for (i = 0; i < nlines; i++) {
> +               fprintf(stdout, "%d", data.values[i]);
>
> data.values[i];
>
> Each bit is stored in a byte.

Yeah the userspace interface is wasteful in that sense. It's a trade-off
between storage and simplicity and I had to choose something.

If I try to bitstuff the bits then I need to add another ABI to describe
how the bits are stuffed in the words. So I get complexity somewhere
else instead.

Yours,
Linus Walleij
