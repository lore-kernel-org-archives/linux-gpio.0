From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Thu, 12 May 2016 06:35:20 -0700
Message-ID: <CAOMFOmX59DVU4U37jjHpNHLVfhqydNx3SHsMduHWud_rUoHWXw@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
	<CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
	<CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
	<CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
	<20160511140233.GQ1713@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:36554 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932205AbcELNfV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 May 2016 09:35:21 -0400
Received: by mail-ig0-f170.google.com with SMTP id lr7so54848640igb.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 May 2016 06:35:21 -0700 (PDT)
In-Reply-To: <20160511140233.GQ1713@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Matt DeVillier <matt.devillier@gmail.com>

Hi

On Wed, May 11, 2016 at 7:02 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, May 11, 2016 at 07:00:18AM -0700, Anatol Pomozov wrote:
>>    Hi
>>    I tried to read the gpio handling code, but I do not see any obvious
>>    reason for this "insert module" crash. And I had no time to do history
>>    bisect.
>>    On Wed, May 11, 2016 at 2:22 AM, Linus Walleij
>>    <[1]linus.walleij@linaro.org> wrote:
>>
>>      > I compiled lynx gpio into kernel instead of compiling it as a
>>      module.
>>      > And the system got more stable - I rebooted my devices ~50 times
>>      > already and I do not see the boot problem I had before.
>>      'CONFIG_..=y'
>>      > definitely makes the situation better.
>>      >
>>      > As of bisecting - it will require time do find the commit. I might
>>      do
>>      > it if I find some spare time.
>>      If nothing else works I'm happy to accept a patch turning the
>>      driver into a bool and removing all module handling code.
>>
>>    Before doing this I would love to get some feedback from the driver
>>    maintainer. Mathias, do you see this issue with the module?
>>    Also I am going to change Arch Linux kernel config to compile this
>>    driver as 'y'.
>
> Let's first analyze why it crashes in the first place. Can you give me
> detailed instructions how can I reproduce this?

I use Chromebox with Matt's coreboot firmware and Arch Linux that
currently compiles LYNX gpio as a module.

There are 2 crashes:
1) ~25% chance of crash at boot time. Just boot the device and the
system crashes when tries to probe the driver
2) system crashes when try to 'rmmod'. See stack trace in the first
message of this thread.
