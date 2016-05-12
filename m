From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Thu, 12 May 2016 13:34:54 +0300
Message-ID: <57345C4E.2070903@linux.intel.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>	<CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>	<CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com> <CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:59611 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752826AbcELK16 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 May 2016 06:27:58 -0400
In-Reply-To: <CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

Hi

On 11.05.2016 17:00, Anatol Pomozov wrote:
> Hi
>
> I tried to read the gpio handling code, but I do not see any obvious reason for this "insert module" crash. And I had no time to do history bisect.
>
> On Wed, May 11, 2016 at 2:22 AM, Linus Walleij <linus.walleij@linaro.org <mailto:linus.walleij@linaro.org>> wrote:
>
>     > I compiled lynx gpio into kernel instead of compiling it as a module.
>     > And the system got more stable - I rebooted my devices ~50 times
>     > already and I do not see the boot problem I had before. 'CONFIG_..=y'
>     > definitely makes the situation better.
>     >
>     > As of bisecting - it will require time do find the commit. I might do
>     > it if I find some spare time.
>
>     If nothing else works I'm happy to accept a patch turning the
>     driver into a bool and removing all module handling code.
>
>
> Before doing this I would love to get some feedback from the driver maintainer. Mathias, do you see this issue with the module?
>
> Also I am going to change Arch Linux kernel config to compile this driver as 'y'.

I haven't been looking at this code for some time, Mika has mostly been taking care of it lately.

Driver was originally written as bool (not module) partly because we wanted it to load earlier as
we suspected some other drivers depend on gpio interrupts, and partly because the IO port resources
overlapped with motherboard resources that pnpacpi would request before gpio-lynxpoint.

As driver was written with the original assumption of not being a module, there
might be that the remove codepaths in gpio-lynxopoint are not properly calling
gpiochip_remove (that should call gpiochip_irqchip_remove etc) on driver unload,
or not checking if those return errors, or ourself not returning proper errors on removes that should fail.

An other possible issue could be that if hw reduced acpi stuff that expects os to have a interrupt handler for
gpio interrupts triggered in firmware. Not sure if that eneded up being used anywhere, but I can imagine there being issues
if we remove the interrupt handling for those.

Anyways, I don't mind turning it back to a bool, but I agree with Mika that we really should investigate the cause
behind this and not just do it because it removes the symptoms.

-Mathias
    
