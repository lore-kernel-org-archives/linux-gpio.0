From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Tue, 24 May 2016 13:03:09 +0200
Message-ID: <CACRpkdYPWBDHY92mVcKS+HFJm_TQbT2WgcotBdRyPEeb+7eOUA@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
	<CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
	<CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
	<CAOMFOmWTvH0ObHjnBAbKkew79oFN4OMrjou5x6V1HRc=CnP91w@mail.gmail.com>
	<57345C4E.2070903@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33567 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbcEXLDK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 07:03:10 -0400
Received: by mail-oi0-f48.google.com with SMTP id k23so20202480oih.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 04:03:10 -0700 (PDT)
In-Reply-To: <57345C4E.2070903@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Anatol Pomozov <anatol.pomozov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

On Thu, May 12, 2016 at 12:34 PM, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:

> As driver was written with the original assumption of not being a module,
> there
> might be that the remove codepaths in gpio-lynxopoint are not properly
> calling
> gpiochip_remove (that should call gpiochip_irqchip_remove etc) on driver
> unload,
> or not checking if those return errors, or ourself not returning proper
> errors on removes that should fail.

We have devm_gpiochip_add_data() these days, so you don't need
to call gpiochip_remove() explicitly if you use that.

Yours,
Linus Walleij
