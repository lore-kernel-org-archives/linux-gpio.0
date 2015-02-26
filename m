From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Thu, 26 Feb 2015 19:29:54 +0900
Message-ID: <CAAVeFuKQ5dckVyhhsZb+m+bsQyqvSMAVA7KSStky2BoZRcqszw@mail.gmail.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd> <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
 <20150203090325.GA29693@deathray> <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
 <20150219085303.GI21469@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:36490 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753303AbbBZKaP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Feb 2015 05:30:15 -0500
Received: by ierx19 with SMTP id x19so12976809ier.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2015 02:30:14 -0800 (PST)
In-Reply-To: <20150219085303.GI21469@belle.intranet.vanheusden.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: folkert <folkert@vanheusden.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 19, 2015 at 5:53 PM, folkert <folkert@vanheusden.com> wrote:
>> >> >> Try using lseek before reading the data after the poll.
>> >> >>
>> >> >> EX.
>> >> >>       if (fdset[0].revents & POLLPRI) {
>> >> >>               lseek(fdset[0].fd, 0, SEEK_SET);
>> >> >>               len = read(fdset[0].fd, buf, MAX_BUF);
>> >> >>               .
>> >> >>               .
>> >> >>       }
>> >> >>
>> >> >> See if this helps.
>> >> >
>> >> > Yes, that fixed it!
>> >>
>> >> Still, shouldn't we consider this as a regression, especially if not
>> >> using lseek worked for kernel 3.12 and before?
>> >
>> > Perhaps this is a side effect of the sysfs to kernfs change over to happened in
>> > 3.14.
>> >
>> > Looking at 'kernfs_fop_poll' my guess is that 'kernfs_get_active' is returning NULL
>> > immediately returning from the poll command and causing described behavior.
>> >
>> > http://lxr.free-electrons.com/source/fs/kernfs/file.c#L763
>>
>> I think this looks plausible.
>> Folkert what do you say about this?
>
> That looks indeed to be the current situation. It worked different
> before though.
>
> I also think that this interface is cumbersome. I did not measure it(!)
> but I think adding this open/seek + read construction may add all kinds
> of overhead. Especially since my use-case requires the lowest latency
> possible. Not to forget that conversion of the measured value to ascii
> and back.

Folkert, since you have code that can reproduce the issue, could you
see whether you could come with a patch that restores the original
behavior? Maybe by introducing a in-kernel lseek() as soon as the file
is opened?
