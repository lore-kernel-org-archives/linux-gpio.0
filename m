From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Fri, 27 Feb 2015 14:15:02 +0100
Message-ID: <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
	<20150130234552.GA20407@sysresccd>
	<20150131083300.GZ21469@belle.intranet.vanheusden.com>
	<CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
	<20150203090325.GA29693@deathray>
	<CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
	<20150219085303.GI21469@belle.intranet.vanheusden.com>
	<CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
	<CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:59534 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318AbbB0NPD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Feb 2015 08:15:03 -0500
Received: by mail-oi0-f47.google.com with SMTP id i138so15433614oig.6
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2015 05:15:02 -0800 (PST)
In-Reply-To: <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: folkert <folkert@vanheusden.com>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 26, 2015 at 11:27 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Feb 20, 2015 at 1:52 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 19, 2015 at 9:53 AM, folkert <folkert@vanheusden.com> wrote:
>>
>>> I also think that this interface is cumbersome. I did not measure it(!)
>>> but I think adding this open/seek + read construction may add all kinds
>>> of overhead. Especially since my use-case requires the lowest latency
>>> possible. Not to forget that conversion of the measured value to ascii
>>> and back.
>>
>> Yes this interface sucks.
>>
>> The tentative long-term plan is to replace it with something like
>> a char device that can handle a quick context switch and also
>> issuing calls to set multiple pins at once, as we now have an
>> in-kernel interface for that (that I totally refuse to support from
>> sysfs).
>
> Mmm, I was thinking it would be nice to have a (new, redesigned) sysfs
> interface for this. :P
>
> Aren't we going to make things less accessible if we use a char device?

Since sysfs has a "one value per file" paradigm, it also has a
"one context switch per operation" paradigm, meaning any
efficiency-oriented use cases where a lot of stuff needs to be
changed in one context switch are by the very construction
not suitable for sysfs IMO. That is the use case for ioctl()
operations that can pass an entire struct of stuff over.

And things like bit-banging a clock+data line which would in
a sysfs case involve two context switches (one per value, since
that is one file per GPIO line) in an ioctl() case it would be
just one, already 50% less context switches for a very basic
use case.

But I may be just so wrong ... input welcome.

Yours,
Linus Walleij
