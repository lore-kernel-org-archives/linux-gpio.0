From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Wed, 11 May 2016 07:26:52 -0700
Message-ID: <CAOMFOmXbFOCnNd3P5pcLNJ5DvPmZ=0fLCV1xZsrTEF0e8xYdJQ@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
	<CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
	<CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34435 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbcEKO0x (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 10:26:53 -0400
Received: by mail-ig0-f195.google.com with SMTP id kj7so4254365igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 07:26:52 -0700 (PDT)
In-Reply-To: <CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

...resending it as a plain text


I tried to read the gpio handling code, but I do not see any obvious
reason for this "insert module" crash. And I had no time to do the
history bisect.

On Wed, May 11, 2016 at 2:22 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> I compiled lynx gpio into kernel instead of compiling it as a module.
>> And the system got more stable - I rebooted my devices ~50 times
>> already and I do not see the boot problem I had before. 'CONFIG_..=y'
>> definitely makes the situation better.
>>
>> As of bisecting - it will require time do find the commit. I might do
>> it if I find some spare time.
>
> If nothing else works I'm happy to accept a patch turning the
> driver into a bool and removing all module handling code.

Before doing this I would love to get some feedback from the driver
maintainer. Mathias, do you see this issue with the module?

Also I am going to change Arch Linux kernel config to compile this
driver as 'y'.
