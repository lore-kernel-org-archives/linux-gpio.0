From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Wed, 14 Sep 2016 14:46:01 +0200
Message-ID: <CACRpkdYRYR0hSacpxieG6k9qHyjMFsr6ViYU3HCcQEzB9NXLGQ@mail.gmail.com>
References: <20160911080506.GO15313@lahna.fi.intel.com> <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com> <20160912130444.GB2411@ktx>
 <20160912131111.GG1811@lahna.fi.intel.com> <CACRpkdZRguTg4davCW-x6HvRJgOxNz8R4KyeFCEnQzyXPkP6cg@mail.gmail.com>
 <20160913093302.GL1811@lahna.fi.intel.com> <CACRpkdY9+poXW1cw4K20edGYjiuPN9DH0umsEAh31iHXGJhx6g@mail.gmail.com>
 <20160913125214.GO1811@lahna.fi.intel.com> <CACRpkdY-8_+jp+J55FnDHrt-y6woFTEqs7JPxR+KRRcuWPpQWw@mail.gmail.com>
 <20160914082610.GV1811@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36593 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756249AbcINMqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 08:46:03 -0400
Received: by mail-oi0-f47.google.com with SMTP id q188so18979059oia.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2016 05:46:03 -0700 (PDT)
In-Reply-To: <20160914082610.GV1811@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 14, 2016 at 10:26 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Sep 13, 2016 at 10:57:31PM +0200, Linus Walleij wrote:

>> Isn't this (a list of what IRQs are reserved by BIOS) by sheer logic
>> something that ACPI should provide?
>>
>> Or is this one of those "well we could alter ACPI tables but we can't
>> because they already shipped so we just can't so now we need to
>> hack around it"?
>
> Isn't it always the case? ;-)
>
> Once the hardware enters stores the firmware cannot be changed anymore
> and we get all the fun working around problems in the OS.

To me this is just a big proof that the ACPI design-by-committee isn't
working. With Device Tree we review bindings and drivers together
and then we tend to not miss stuff like this as much.

But I realize as soon as I say that someone will pull out a counter-example
of stupid DT bindings used in the wild and make me look stupid.

>> Letting Linux map an interrupt it cannot access and then papering it
>> over by using handle_simple_irq() just feels wrong to me.
>>
>> I would argue for associating the mask of BIOS-reserved IRQs with
>> something in ACPI and implement the mentioned scheme to avoid
>> even mapping them seems most logical.
>
> I'm going to re-read the hardware spec and see if there is anything we
> can do about this. The newer hardware (Skylake, Broxton) has a bit that
> tells the IRQ is routed directly to I/O-APIC but unfortunately Braswell
> misses that. There may be something else, though.

So as far as we can determine:

(A) we are running on Braswell and
(B) we are probing this driver

we can conclude that

(C) IRQs A,B,C are reserved by BIOS?

That sounds doable?

Yours,
Linus Walleij
