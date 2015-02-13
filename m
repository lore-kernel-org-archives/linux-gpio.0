From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Fri, 13 Feb 2015 11:43:38 +0800
Message-ID: <CACRpkdbGo1+v_aVJP7+pbbw2HnRdqrBwwPv=0fC87Ze5JveAnw@mail.gmail.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
	<20150130234552.GA20407@sysresccd>
	<20150131083300.GZ21469@belle.intranet.vanheusden.com>
	<CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
	<20150203090325.GA29693@deathray>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34324 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbbBMDnj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Feb 2015 22:43:39 -0500
Received: by mail-ob0-f170.google.com with SMTP id va2so15747472obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2015 19:43:38 -0800 (PST)
In-Reply-To: <20150203090325.GA29693@deathray>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 3, 2015 at 5:03 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Sat, Jan 31, 2015 at 02:39:03PM +0100, Alexandre Courbot wrote:
>> On Sat, Jan 31, 2015 at 9:33 AM, folkert <folkert@vanheusden.com> wrote:
>> > Michael,
>> >
>> >> > For timekeeping I wrote a program which waits for interrupts on
>> >> > gpio-pins and then tells the local ntp daemon the clock offset.
>> >> > I'm aware of the pps support in recent kernel but that does not work
>> >> > (yet) on all platforms (eg cubieboard 1).
>> >> >
>> >> > This has worked for quite some time but no longer.
>> >> >
>> >> > Until at least kernel 3.12 I could do:
>> >> >
>> >> > // export gpio pin
>> >> > // set direction to in
>> >> > // set direction to rising
>> >> > int fd = open("/sys.../value", O_RDONLY);
>> >> > fdset[0].fd = fd;
>> >> > fdset[0].events = POLLPRI;
>> >> > fdset[0].revents = 0;
>> >> > poll(fdset, 1, -1);
>> >> > // at this point pin went high
>> >>
>> >> Try using lseek before reading the data after the poll.
>> >>
>> >> EX.
>> >>       if (fdset[0].revents & POLLPRI) {
>> >>               lseek(fdset[0].fd, 0, SEEK_SET);
>> >>               len = read(fdset[0].fd, buf, MAX_BUF);
>> >>               .
>> >>               .
>> >>       }
>> >>
>> >> See if this helps.
>> >
>> > Yes, that fixed it!
>>
>> Still, shouldn't we consider this as a regression, especially if not
>> using lseek worked for kernel 3.12 and before?
>
> Perhaps this is a side effect of the sysfs to kernfs change over to happened in
> 3.14.
>
> Looking at 'kernfs_fop_poll' my guess is that 'kernfs_get_active' is returning NULL
> immediately returning from the poll command and causing described behavior.
>
> http://lxr.free-electrons.com/source/fs/kernfs/file.c#L763

I think this looks plausible.

Folkert what do you say about this?

Yours,
Linus Walleij
