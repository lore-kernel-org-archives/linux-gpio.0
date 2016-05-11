From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Wed, 11 May 2016 17:02:33 +0300
Message-ID: <20160511140233.GQ1713@lahna.fi.intel.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
 <CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
 <CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
 <CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
 <CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
 <CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
 <CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:14314 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751404AbcEKO1i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 11 May 2016 10:27:38 -0400
Content-Disposition: inline
In-Reply-To: <CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Matt DeVillier <matt.devillier@gmail.com>

On Wed, May 11, 2016 at 07:00:18AM -0700, Anatol Pomozov wrote:
>    Hi
>    I tried to read the gpio handling code, but I do not see any obvious
>    reason for this "insert module" crash. And I had no time to do history
>    bisect.
>    On Wed, May 11, 2016 at 2:22 AM, Linus Walleij
>    <[1]linus.walleij@linaro.org> wrote:
> 
>      > I compiled lynx gpio into kernel instead of compiling it as a
>      module.
>      > And the system got more stable - I rebooted my devices ~50 times
>      > already and I do not see the boot problem I had before.
>      'CONFIG_..=y'
>      > definitely makes the situation better.
>      >
>      > As of bisecting - it will require time do find the commit. I might
>      do
>      > it if I find some spare time.
>      If nothing else works I'm happy to accept a patch turning the
>      driver into a bool and removing all module handling code.
> 
>    Before doing this I would love to get some feedback from the driver
>    maintainer. Mathias, do you see this issue with the module?
>    Also I am going to change Arch Linux kernel config to compile this
>    driver as 'y'.

Let's first analyze why it crashes in the first place. Can you give me
detailed instructions how can I reproduce this?
