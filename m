From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Wed, 1 Jun 2016 23:40:04 +0200
Message-ID: <CACRpkdYEfYFwnhgEGf2AmCkj7QUJm-GeQW3_CE2H4vWSNngp_Q@mail.gmail.com>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
	<1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
	<20160427160034.GA20392@deathstar>
	<CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
	<20160601034343.GA3749@deathstar>
	<CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
	<20160601180906.GA5286@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35256 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367AbcFAVkF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 17:40:05 -0400
Received: by mail-oi0-f48.google.com with SMTP id w184so48939414oiw.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 14:40:05 -0700 (PDT)
In-Reply-To: <20160601180906.GA5286@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Wed, Jun 1, 2016 at 8:09 PM, Michael Welling <mwelling@ieee.org> wrote:

> Is there a way to name a group of GPIOs?

Do you mean from the producer side or the consumer side?
There is gpio-line-names in DT for the producer side.

>From the consumer side the same consumer name will be used
on all lines if more than one is selected, which I think makes
sense. (It's just a label after all.)

> It seems you are passing around a byte of data for each GPIO state.
> Is there a reason why the bits couldn't bit masked into single variable
> given the max number of handles is 64?

Sorry not following, I guess you need to post me some part of
the patch or so...

Yours,
Linus Walleij
