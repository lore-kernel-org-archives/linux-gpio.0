From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Thu, 12 May 2016 17:11:24 +0300
Message-ID: <20160512141124.GU1713@lahna.fi.intel.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
 <CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
 <CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
 <CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
 <CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
 <CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
 <CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
 <20160511140233.GQ1713@lahna.fi.intel.com>
 <CAOMFOmX59DVU4U37jjHpNHLVfhqydNx3SHsMduHWud_rUoHWXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:1840 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbcELOLa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 May 2016 10:11:30 -0400
Content-Disposition: inline
In-Reply-To: <CAOMFOmX59DVU4U37jjHpNHLVfhqydNx3SHsMduHWud_rUoHWXw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Matt DeVillier <matt.devillier@gmail.com>

On Thu, May 12, 2016 at 06:35:20AM -0700, Anatol Pomozov wrote:
> I use Chromebox with Matt's coreboot firmware and Arch Linux that
> currently compiles LYNX gpio as a module.
>
> There are 2 crashes:
> 1) ~25% chance of crash at boot time. Just boot the device and the
> system crashes when tries to probe the driver
> 2) system crashes when try to 'rmmod'. See stack trace in the first
> message of this thread.

I tried pretty much the same on a Broadwell based machine (uses the same
GPIO driver) and I did not see any crashes. I don't have Haswell based
machines around anymore.

Since you seem to be able get it crashing pretty easily, I wonder if you
can try following to debug the first crash:

 1. Blacklist gpio-lynxpoint
 2. Boot the system
 3. Send me contents of /proc/interrupts and /sys/kernel/debug/gpio
 4. Run 'insmod gpio-lynxpoint.ko'
 5. Send me full dmesg of the crash (if you can get it).

And the second crash:

 1. Remoge gpio-lynxpoint from blacklist
 2. Boot the system
 3. Run 'rmmod gpio-lynxpoint'
 4. Send me full dmesg of the crash (if you can get it).

Hopefully with that information we can find root cause of both crashes
(which may be the same).
