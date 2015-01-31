From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Sat, 31 Jan 2015 14:39:03 +0100
Message-ID: <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd> <20150131083300.GZ21469@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:57604 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923AbbAaNjX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jan 2015 08:39:23 -0500
Received: by mail-ig0-f170.google.com with SMTP id l13so8684961iga.1
        for <linux-gpio@vger.kernel.org>; Sat, 31 Jan 2015 05:39:23 -0800 (PST)
In-Reply-To: <20150131083300.GZ21469@belle.intranet.vanheusden.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: folkert <folkert@vanheusden.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jan 31, 2015 at 9:33 AM, folkert <folkert@vanheusden.com> wrote:
> Michael,
>
>> > For timekeeping I wrote a program which waits for interrupts on
>> > gpio-pins and then tells the local ntp daemon the clock offset.
>> > I'm aware of the pps support in recent kernel but that does not work
>> > (yet) on all platforms (eg cubieboard 1).
>> >
>> > This has worked for quite some time but no longer.
>> >
>> > Until at least kernel 3.12 I could do:
>> >
>> > // export gpio pin
>> > // set direction to in
>> > // set direction to rising
>> > int fd = open("/sys.../value", O_RDONLY);
>> > fdset[0].fd = fd;
>> > fdset[0].events = POLLPRI;
>> > fdset[0].revents = 0;
>> > poll(fdset, 1, -1);
>> > // at this point pin went high
>>
>> Try using lseek before reading the data after the poll.
>>
>> EX.
>>       if (fdset[0].revents & POLLPRI) {
>>               lseek(fdset[0].fd, 0, SEEK_SET);
>>               len = read(fdset[0].fd, buf, MAX_BUF);
>>               .
>>               .
>>       }
>>
>> See if this helps.
>
> Yes, that fixed it!

Still, shouldn't we consider this as a regression, especially if not
using lseek worked for kernel 3.12 and before?

Linus, what do you think?
