From: folkert <folkert@vanheusden.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Sat, 31 Jan 2015 09:33:00 +0100
Message-ID: <20150131083300.GZ21469@belle.intranet.vanheusden.com>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
 <20150130234552.GA20407@sysresccd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:49253 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbbAaIdE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jan 2015 03:33:04 -0500
Content-Disposition: inline
In-Reply-To: <20150130234552.GA20407@sysresccd>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: linux-gpio@vger.kernel.org

Michael,

> > For timekeeping I wrote a program which waits for interrupts on
> > gpio-pins and then tells the local ntp daemon the clock offset.
> > I'm aware of the pps support in recent kernel but that does not work
> > (yet) on all platforms (eg cubieboard 1).
> > 
> > This has worked for quite some time but no longer.
> > 
> > Until at least kernel 3.12 I could do:
> > 
> > // export gpio pin
> > // set direction to in
> > // set direction to rising
> > int fd = open("/sys.../value", O_RDONLY);
> > fdset[0].fd = fd;
> > fdset[0].events = POLLPRI;
> > fdset[0].revents = 0;
> > poll(fdset, 1, -1);
> > // at this point pin went high
> 
> Try using lseek before reading the data after the poll.
> 
> EX.
> 	if (fdset[0].revents & POLLPRI) {
> 		lseek(fdset[0].fd, 0, SEEK_SET);
> 		len = read(fdset[0].fd, buf, MAX_BUF);
> 		.
> 		.
> 	}
> 
> See if this helps.

Yes, that fixed it!
Great! Thanks!


Folkert van Heusden

-- 
MultiTail na wan makriki wrokosani fu tan luku den logfile nanga san
den commando spiti puru. Piki puru spesrutu sani, wroko nanga difrenti
kroru, tya kon makandra, nanga wan lo moro.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
