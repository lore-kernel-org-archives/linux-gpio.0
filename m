From: Michael Heimpold <mhei@heimpold.de>
Subject: Re: Question about gpio sysfs interface
Date: Mon, 07 Apr 2014 21:55:49 +0200
Message-ID: <5800442.2kVGacMVbM@kerker>
References: <1420047.Pa7NFNg2Xt@kerker> <CAAVeFuKyixV8CPp3i+ftuqgtF-sWc5TVRy1gRg6Xg+pQBsF6-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:51867 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755141AbaDGTzv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 15:55:51 -0400
In-Reply-To: <CAAVeFuKyixV8CPp3i+ftuqgtF-sWc5TVRy1gRg6Xg+pQBsF6-w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

Am Montag, 7. April 2014, 16:58:22 schrieb Alexandre Courbot:
> On Mon, Apr 7, 2014 at 3:56 AM, Michael Heimpold <mhei@heimpold.de> wrote:
> > Hi,
> >
> > I have a question regarding user-space gpio support with sysfs.
> >
> > Documentation/gpio/sysfs.txt states
> >> GPIO signals have paths like /sys/class/gpio/gpio42/ (for GPIO #42)
> >> and have the following read/write attributes:
> >>
> >>    /sys/class/gpio/gpioN/
> >>
> >>       "direction" ... reads as either "in" or "out". This value may
> >>               normally be written. ...
> >>
> >>               Note that this attribute *will not exist* if the kernel
> >>               doesn't support changing the direction of a GPIO, or
> >>               it was exported by kernel code that didn't explicitly
> >>               allow userspace to reconfigure this GPIO's direction.
> >
> > Imagine for example a generic user-space tool which enumerates
> > all available GPIOs to the user and sorts by input and output GPIOs.
> > How would such a tool classify an exported GPIO when kernel
> > doesn't export the 'direction' file via sysfs? Or in other words: how
> > can userspace detect the state (in vs. out) of a GPIO when 'direction'
> > is not exported?
> 
> Wouldn't the "value" field be read-only for a "in" GPIO and read-write
> for an "out" one?

The file itself will still have 0644 permissions, but writing to the file
results with EPERM error. So an algorithm would be to first read the
value and then try to write the same value (to not change the pin state).
If writing succeeds then the GPIO is configured as output, but if it fails
then you know that this GPIO is an "in" one.

> 
> Other than that, I also don't see any drawback to having "direction"
> always exported and made read-only if direction cannot be changed.

Ok, will  try to code and send a patch for further discussion.

Regards,
Michael

