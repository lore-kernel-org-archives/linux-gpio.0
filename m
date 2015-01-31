From: folkert <folkert@vanheusden.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Sat, 31 Jan 2015 14:53:53 +0100
Message-ID: <20150131135353.GB21469@belle.intranet.vanheusden.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd>
 <20150131083300.GZ21469@belle.intranet.vanheusden.com>
 <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:51803 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751939AbbAaNxz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jan 2015 08:53:55 -0500
Content-Disposition: inline
In-Reply-To: <CAAVeFuJ6+W-CpXKCE2uY=T7RUVjA4d2PML708xH8dPQwij5NTg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> >> > For timekeeping I wrote a program which waits for interrupts on
> >> > gpio-pins and then tells the local ntp daemon the clock offset.
> >> > I'm aware of the pps support in recent kernel but that does not work
> >> > (yet) on all platforms (eg cubieboard 1).
> >> >
> >> > This has worked for quite some time but no longer.
> >> >
> >> > Until at least kernel 3.12 I could do:
> >> >
> >> > // export gpio pin
> >> > // set direction to in
> >> > // set direction to rising
> >> > int fd = open("/sys.../value", O_RDONLY);
> >> > fdset[0].fd = fd;
> >> > fdset[0].events = POLLPRI;
> >> > fdset[0].revents = 0;
> >> > poll(fdset, 1, -1);
> >> > // at this point pin went high
> >>
> >> Try using lseek before reading the data after the poll.
> >>
> >> EX.
> >>       if (fdset[0].revents & POLLPRI) {
> >>               lseek(fdset[0].fd, 0, SEEK_SET);
> >>               len = read(fdset[0].fd, buf, MAX_BUF);
> >>               .
> >>               .
> >>       }
> >>
> >> See if this helps.
> >
> > Yes, that fixed it!
> 
> Still, shouldn't we consider this as a regression, especially if not
> using lseek worked for kernel 3.12 and before?
> 
> Linus, what do you think?

In case it is relevant, my code with 3.12 was:

	for(;;)
        {
                  char dummy;
  
                  read(gpio_pps_in_fd, &dummy, 1);
  
                  fdset[0].fd = gpio_pps_in_fd;
                  fdset[0].events = POLLPRI;
                  fdset[0].revents = 0;
  
                  if (poll(fdset, 1, -1) <= 0)
                          error_exit("poll() failed");
  
                  if (likely(fdset[0].revents & POLLPRI))
		  { /* notify ntp */ {
	}

Now with 3.18 I added an lseek before that read and all is fine.


Folkert van Heusden

-- 
