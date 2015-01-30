From: Michael Welling <mwelling@ieee.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Fri, 30 Jan 2015 17:45:52 -0600
Message-ID: <20150130234552.GA20407@sysresccd>
References: <20150129152902.GX21469@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:47702 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbbA3Xp7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 18:45:59 -0500
Received: by mail-ig0-f177.google.com with SMTP id z20so6378024igj.4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 15:45:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150129152902.GX21469@belle.intranet.vanheusden.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: folkert <folkert@vanheusden.com>
Cc: linux-gpio@vger.kernel.org

On Thu, Jan 29, 2015 at 04:29:02PM +0100, folkert wrote:
> Hi,
> 
> For timekeeping I wrote a program which waits for interrupts on
> gpio-pins and then tells the local ntp daemon the clock offset.
> I'm aware of the pps support in recent kernel but that does not work
> (yet) on all platforms (eg cubieboard 1).
> 
> This has worked for quite some time but no longer.
> 
> Until at least kernel 3.12 I could do:
> 
> // export gpio pin
> // set direction to in
> // set direction to rising
> int fd = open("/sys.../value", O_RDONLY);
> fdset[0].fd = fd;
> fdset[0].events = POLLPRI;
> fdset[0].revents = 0;
> poll(fdset, 1, -1);
> // at this point pin went high

Try using lseek before reading the data after the poll.

EX.
	if (fdset[0].revents & POLLPRI) {
		lseek(fdset[0].fd, 0, SEEK_SET);
		len = read(fdset[0].fd, buf, MAX_BUF);
		.
		.
	}

See if this helps.

> 
> So: I would setup a gpio-pin using /sys-files, and then use poll() to
> wait for the interrupt triggered by the level of the gpio pin going
> high.
> This worked fine on all raspberry pi's I tried, a nanos g20, a beagle
> bone black and a cubieboard 1.
> 
> Since kernel 3.18.3 (.4 as well) this no longer works: 
> 
> 1422542104.894908947] interrupt #2459, offset -0.105091s
> 1422542104.895162937] interrupt #2460, offset -0.104837s
> 1422542104.895408928] interrupt #2461, offset -0.104591s
> 1422542104.895650919] interrupt #2462, offset -0.104349s
> 1422542104.896293896] interrupt #2463, offset -0.103706s
> ...
> 
> As you can see suddenly the poll returns immediately.
> 
> strace learns me:
> poll([{fd=3, events=POLLPRI}], 1, -1)   = 1 ([{fd=3, revents=POLLPRI|POLLERR}])
> 
> So apparently somewhere between 3.12 and 3.18 it is no longer
> allowed/possible to do poll() on a gpio-pin value device.
> 
> Am I right that something broke the abi? Or have I been doing it wrong
> and did that became visible?
> Please advise.
> 
> thanks
> 
> Folkert van Heusden
> 
> -- 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
