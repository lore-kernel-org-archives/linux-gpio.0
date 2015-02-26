From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Thu, 26 Feb 2015 19:27:55 +0900
Message-ID: <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd> <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
 <20150203090325.GA29693@deathray> <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
 <20150219085303.GI21469@belle.intranet.vanheusden.com> <CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:39302 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752696AbbBZK2R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Feb 2015 05:28:17 -0500
Received: by iecvy18 with SMTP id vy18so12893456iec.6
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2015 02:28:16 -0800 (PST)
In-Reply-To: <CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: folkert <folkert@vanheusden.com>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 20, 2015 at 1:52 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Feb 19, 2015 at 9:53 AM, folkert <folkert@vanheusden.com> wrote:
>
>> I also think that this interface is cumbersome. I did not measure it(!)
>> but I think adding this open/seek + read construction may add all kinds
>> of overhead. Especially since my use-case requires the lowest latency
>> possible. Not to forget that conversion of the measured value to ascii
>> and back.
>
> Yes this interface sucks.
>
> The tentative long-term plan is to replace it with something like
> a char device that can handle a quick context switch and also
> issuing calls to set multiple pins at once, as we now have an
> in-kernel interface for that (that I totally refuse to support from
> sysfs).

Mmm, I was thinking it would be nice to have a (new, redesigned) sysfs
interface for this. :P

Aren't we going to make things less accessible if we use a char device?
