From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: generic: clamp retured value to [0,1]
Date: Thu, 6 Feb 2014 13:42:57 +0900
Message-ID: <CAAVeFuJ-N9a7viNv2dCOtYnCtoxs6qgRYH4ko_WWgWvsyYoeXw@mail.gmail.com>
References: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org> <20140205220811.GG20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:52364 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942AbaBFEnS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 23:43:18 -0500
Received: by mail-vc0-f176.google.com with SMTP id la4so1056295vcb.35
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 20:43:17 -0800 (PST)
In-Reply-To: <20140205220811.GG20094@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Evgeny Boger <boger@contactless.ru>, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Feb 6, 2014 at 7:08 AM, Gerhard Sittig <gsi@denx.de> wrote:
> On Wed, Feb 05, 2014 at 14:14 +0100, Linus Walleij wrote:
>>
>> The generic GPIO would return 0 for low generic GPIO, and
>> something != 0 for high GPIO. Let's make this sane by clamping
>> the returned value to [0,1].
>>
>> [ ... ]
>>
>> -     return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);
>> +     return !!(bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio));
>
> I've asked this before, may be too picky, but certainly want to
> make sure.  Is any language lawyer around? :)  Would be nice to
> get a definitive answer on this, before the pattern gets spread
> even more and still does not what callers expect.
>
> Is there a guarantee that "!0" will result in "1", and not "-1"
> or any other non-zero implementation defined bit pattern?  I
> always thought that one had to write "val ? 1 : 0", or else the
> result may just be another kind of "zero or non-zero".

Seems to be true at least for C99:

http://stackoverflow.com/a/8617111/251248

> Remember that the return data type is int.  For bool you would
> get exactly "true" and "false", but for int I would not be sure,
> and would rather err to the safe side.

In any case, we will be converting the driver's get/set functions to
use bools (not sure if we want to go as far as doing the same for
gpio_get/set_value()). This should settle the issue.

Alex.
