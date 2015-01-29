From: folkert <folkert@vanheusden.com>
Subject: Fw: [3.18.3] poll() on gpio pins broken
Date: Thu, 29 Jan 2015 16:29:02 +0100
Message-ID: <20150129152902.GX21469@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:45606 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647AbbA2PfE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jan 2015 10:35:04 -0500
Received: from belle.intranet.vanheusden.com (unknown [192.168.64.100])
	by keetweej.vanheusden.com (Postfix) with ESMTP id E5C9F15F6C3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2015 16:29:02 +0100 (CET)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

For timekeeping I wrote a program which waits for interrupts on
gpio-pins and then tells the local ntp daemon the clock offset.
I'm aware of the pps support in recent kernel but that does not work
(yet) on all platforms (eg cubieboard 1).

This has worked for quite some time but no longer.

Until at least kernel 3.12 I could do:

// export gpio pin
// set direction to in
// set direction to rising
int fd = open("/sys.../value", O_RDONLY);
fdset[0].fd = fd;
fdset[0].events = POLLPRI;
fdset[0].revents = 0;
poll(fdset, 1, -1);
// at this point pin went high

So: I would setup a gpio-pin using /sys-files, and then use poll() to
wait for the interrupt triggered by the level of the gpio pin going
high.
This worked fine on all raspberry pi's I tried, a nanos g20, a beagle
bone black and a cubieboard 1.

Since kernel 3.18.3 (.4 as well) this no longer works: 

1422542104.894908947] interrupt #2459, offset -0.105091s
1422542104.895162937] interrupt #2460, offset -0.104837s
1422542104.895408928] interrupt #2461, offset -0.104591s
1422542104.895650919] interrupt #2462, offset -0.104349s
1422542104.896293896] interrupt #2463, offset -0.103706s
...

As you can see suddenly the poll returns immediately.

strace learns me:
poll([{fd=3, events=POLLPRI}], 1, -1)   = 1 ([{fd=3, revents=POLLPRI|POLLERR}])

So apparently somewhere between 3.12 and 3.18 it is no longer
allowed/possible to do poll() on a gpio-pin value device.

Am I right that something broke the abi? Or have I been doing it wrong
and did that became visible?
Please advise.

thanks

Folkert van Heusden

-- 
