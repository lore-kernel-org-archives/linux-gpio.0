From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add a static gpio/pinctrl pin range mapping
Date: Thu, 18 Jan 2018 11:03:48 +0100
Message-ID: <CACRpkdafq9STOKa44kDVfkEPeFekSUDuWbDhYZJzsvOCkrpBiA@mail.gmail.com>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se> <20180117133423.4482-4-peda@axentia.se>
 <CACRpkdZfQkzcGW5dFwgg-b1G+R-323OO4nu3jpUkH=x6Ks+RaQ@mail.gmail.com> <292ad461-1976-84dc-6f08-92bb643bbfd3@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33223 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755251AbeARKDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jan 2018 05:03:49 -0500
Received: by mail-it0-f66.google.com with SMTP id c102so1421328itd.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 02:03:49 -0800 (PST)
In-Reply-To: <292ad461-1976-84dc-6f08-92bb643bbfd3@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org

On Thu, Jan 18, 2018 at 9:19 AM, Peter Rosin <peda@axentia.se> wrote:
> On 2018-01-18 08:58, Linus Walleij wrote:
>> On Wed, Jan 17, 2018 at 2:34 PM, Peter Rosin <peda@axentia.se> wrote:
>>
>>> Without such a range, gpiolib fails with -EPROBE_DEFER, pending the
>>> addition of the range. So, without a range, gpiolib will keep
>>> deferring indefinitely.
>>>
>>> Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond sleep")
>>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Peter Rosin <peda@axentia.se>
>>
>> Added the other Fixes: tag as well, add Cc: stable and applied.
>>
>> It will go in for the merge window as it is now, unless Torvalds
>> decide to do an -rc9 in which case I will consider sending it as
>> a separate fix next week.
>
> I didn't (yet?) receive any notification about patch 2/3 and thought
> I'd test what would happen without it, and results are not good.
> I get:
>
> gpio gpiochip5: (sx1502q): could not create pin range
>
> So, I guess if 3/3 is going to stable, all three patches should go
> there.

OK then I mark them all for stable.

Yours,
Linus Walleij
