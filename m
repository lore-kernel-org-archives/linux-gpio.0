From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Sun, 1 May 2016 07:36:57 -0700
Message-ID: <CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:35315 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751111AbcEAOg6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2016 10:36:58 -0400
Received: by mail-ig0-f170.google.com with SMTP id bi2so64359968igb.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2016 07:36:58 -0700 (PDT)
In-Reply-To: <CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

Hi

+Matt, the maintainer of Coreboot firmware that I use at this device.

On Sun, May 1, 2016 at 1:38 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, May 1, 2016 at 2:33 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
>
>> I am trying to 'rmmod gpio_lynxpoint' module at my Chromebox with Arch
>> 4.5.1 kernel and get this oops:
>>
>> [  118.801173] BUG: unable to handle kernel NULL pointer dereference
>> at 0000000000000078
>> [  118.801228] IP: [<ffffffff8105401f>] apic_ack_edge+0x2f/0x60
>
> Mathias Nyman is the maintainer of this driver. Interesting that
> a recent Chromebox is using Lynxpoint!
>
> Are you Cc:ing Laxman because you think the addition of
> devm_gpiochip_add_data() handling is causing it?

Yeah. I was looking at the history of recent changes in that file and
just CC a few people.

Starting from 4.2/4.3 kernel release I see numerous problems with this
driver. For example there are regular crashes at the boot time when
tries to load this driver https://goo.gl/photos/fGk2U6PgUFtxUk9w5    I
have to stick with Arch 4.1 kernel that does not have this problem.

> I think this looks much more related to the fact that we're removing
> an irqchip and it's not really working.
>
> GPIO drivers with backing irqchips are providing resources to other
> drivers, they are seldom really removeable.
>
> Maybe this driver should be made a bool?
