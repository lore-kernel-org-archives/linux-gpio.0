From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Wed, 28 Oct 2015 16:11:41 +0100
Message-ID: <CACRpkdZBnmE2F7i2PYuxvO4cpYsGnrcGr0HMKg9WAPVMGnDBTw@mail.gmail.com>
References: <20151019165914.GA22867@sophia>
	<CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
	<20151027142343.GI1548@lahna.fi.intel.com>
	<CACRpkdbs8US2m1+hEmXbJ9JJT15-iRHnO2L4bk5qeNRgb2vbKg@mail.gmail.com>
	<20151027165134.GK1548@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:36339 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbbJ1PLn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2015 11:11:43 -0400
Received: by lbjm5 with SMTP id m5so7980704lbj.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2015 08:11:42 -0700 (PDT)
In-Reply-To: <20151027165134.GK1548@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 27, 2015 at 5:51 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Oct 27, 2015 at 05:42:23PM +0100, Linus Walleij wrote:
>> On Tue, Oct 27, 2015 at 3:23 PM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > On Tue, Oct 27, 2015 at 11:06:58AM +0100, Linus Walleij wrote:
>> >> > +menu "ISA GPIO drivers"
>> >> > +
>> >> > +config GPIO_104_IDIO_16
>> >> > +       tristate "ACCES 104-IDIO-16 GPIO support"
>> >> > +       depends on X86
>> >> > +       help
>> >> > +         Enables GPIO support for the ACCES 104-IDIO-16 family.
>> >> > +
>> >> > +endmenu
>> >>
>> >> I have five other drivers using port-based I/O:
>> >>
>> >> gpio-f7188x.c
>> >> gpio-it87.c
>> >> gpio-sch.c
>> >> gpio-sch311x.c
>> >> gpio-ts5500.c
>> >>
>> >> Do you think it makes sense to move all of these in under
>> >> the "ISA GPIO drivers" menu as well? I guess they all require
>> >> ISA after all.
>> >>
>> >> (Added their maintainers to the To: line so I can get some input
>> >> on this.)
>> >
>> > Not all of them actually require ISA. For example gpio-sch is part of an
>> > MFD device which is a PCI device. PCI bus also has notion of I/O ports.
>>
>> Hm, is there a more fitting symbol we should sort it under, which
>> means thingofabob-that-has-portmapped I/O?
>
> Well, there's already "Memory mapped GPIO drivers" so how about "I/O
> mapped GPIO drivers"?

Sure, "Port-mapped I/O GPIO drivers"

But what should I put as "depends" for that submenu, that is maybe
the real question.

Would (ISA || PCI) suffice?

Yours,
Linus Walleij
