From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Sun, 1 May 2016 10:38:52 +0200
Message-ID: <CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33748 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751784AbcEAIix (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2016 04:38:53 -0400
Received: by mail-oi0-f46.google.com with SMTP id v145so128288167oie.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2016 01:38:53 -0700 (PDT)
In-Reply-To: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dewangan@nvidia.com, Mika Westerberg <mika.westerberg@linux.intel.com>

On Sun, May 1, 2016 at 2:33 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:

> I am trying to 'rmmod gpio_lynxpoint' module at my Chromebox with Arch
> 4.5.1 kernel and get this oops:
>
> [  118.801173] BUG: unable to handle kernel NULL pointer dereference
> at 0000000000000078
> [  118.801228] IP: [<ffffffff8105401f>] apic_ack_edge+0x2f/0x60

Mathias Nyman is the maintainer of this driver. Interesting that
a recent Chromebox is using Lynxpoint!

Are you Cc:ing Laxman because you think the addition of
devm_gpiochip_add_data() handling is causing it?

I think this looks much more related to the fact that we're removing
an irqchip and it's not really working.

GPIO drivers with backing irqchips are providing resources to other
drivers, they are seldom really removeable.

Maybe this driver should be made a bool?

Yours,
Linus Walleij
