From: folkert <folkert@vanheusden.com>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Mon, 9 Mar 2015 20:02:16 +0100
Message-ID: <20150309190216.GS21469@belle.intranet.vanheusden.com>
References: <20150219085303.GI21469@belle.intranet.vanheusden.com>
 <CACRpkdbPEoyyPqgmZXFT9AQAahgwVjfz0DOnH6ZW2omq=SWCTA@mail.gmail.com>
 <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
 <CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
 <CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
 <20150302072655.GA17089@deathray>
 <CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
 <CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
 <CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
 <CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from keetweej.vanheusden.com ([80.101.105.103]:46110 "EHLO
	keetweej.vanheusden.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932091AbbCITCS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 15:02:18 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Welling <mwelling@ieee.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> Whoever comes up with a cleaner sysfs or a clean device interface
> will win the argument and lock the path for the other approach.
> It's like a forking path with no going back or something.

Can't we just do it a bit like v4l2 does it?
E.g. an open /dev/gpio and then an ioctl which queries all chips with
io-pins, then after you select such a chip (e.g. the cubieboard has
chip a-f iirc), an ioctl which lists the number of pins and then one
that retrieves the number of parameters and then for each parameter
another ioctl that 
well:

- open /dev/gpio
- ioctl to obtain the number of gpio chips
- ioctl to iterate the chips
  - this could return a symbol name, e.g. "A"-"F" or e.g. "north",
    whatever
  - description
  - if it supports hardware interrupts(!)
  - get number of parameters for the chip
  - iterate parameters of the chip
    - get
    - set
  - get maximum number of pins that can be high (?)
- ioctl to select a chip
- ioctl to retrieve number of pins per chip
- ioctl to iterate the pins of a chip
- ioctl to select a pin
- ioctl to get the number of knobs on a pin
- ioctl to iterate the parameters
  they could be
	- set direction
	- set value
	- set trigger
	- has hardware interrupt
	- enable pps (!), preferably with a name override because
	  /dev/ppsX is not helpful

Now after you've selected a pin and selected a trigger you could do a
select()/poll() that waits until the trigger is triggered with
auto-reset of that trigger (or maybe make that selectable as well).
POLLIN then says; we had a trigger, POLLERR the chip was removed (or
POLLHUP?).

Oh and please as low latency for the select()/poll() as possible :-)


Folkert van Heusden

-- 
You've probably gotten really fed up with never winning in the Mega-
Millions lottery. Well, weep no longer: www.smartwinning.info tells
you everything that might help you deciding what numbers to choose.
With nice graphs and pretty animations!
