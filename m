From: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [RFC PATCH] gpio: support for GPIO forwarding
Date: Wed, 14 Jan 2015 08:32:12 -0800
Message-ID: <54B69A0C.7040505@linux.intel.com>
References: <1418890998-23811-1-git-send-email-heikki.krogerus@linux.intel.com> <CACRpkdY-yFKsYbCrMpnViMFoQEugyGQivaV0M+GDzLrbDO7i6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:37380 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbbANQce (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 14 Jan 2015 11:32:34 -0500
In-Reply-To: <CACRpkdY-yFKsYbCrMpnViMFoQEugyGQivaV0M+GDzLrbDO7i6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On 1/14/15 4:58 AM, Linus Walleij wrote:
> On Thu, Dec 18, 2014 at 9:23 AM, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> 
>> This makes it possible to assign GPIOs at runtime. The
>> motivation for it is because of need to forward GPIOs from
>> one device to an other. That feature may be useful for
>> example with some mfd devices, but initially it is needed

+Samuel Ortiz for his thoughts on applicability to MFD.

>> because on some Intel Braswell based ACPI platforms the GPIO
>> resources controlling signals of the USB PHY are given to
>> the controller device object for whatever reason, so the
>> driver of that controller needs be able to pass them to the
>> PHY device somehow.
>>
>> So basically this is meant to allow patching of bad (bad
>> from Linux kernels point of view) hardware descriptions
>> provided by system fw in the drivers.
>>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
>>
>> Hi,
>>
>> I'm sending this first as a RFC in case you guys have some better
>> idea how to solve our problem. I actually already have couple
>> platforms where the GPIO resources are given to the "wrong" device
>> objects now.
>>
>> Originally we were thinking about simply handling our problem with
>> hacks to the PHY drivers, basically also checking if the parent has
>> GPIOs. That would only work if the controller is always the parent,
>> which it's not, but even if it was, it would be too risky. The PHY
>> drivers don't know which controller they are attached to, so what is
>> to say that the GPIOs aren't really attached to the controller.
>>
>> So the safest way to handle our problem is to deal with it in quirks
>> in the controller drivers. Solving it by bouncing the GPIOs did not
>> feel ideal there doesn't seem to be any other way. The API is copied
>> from clkdev (clk_register_clkdev). In the end it's really only one
>> function for adding the lookups and one for removing them.
>>
>> The way it's implemented is by modifying the current style of handling
>> the lookups a little bit. The per device lookup table is basically
>> reverted back to the single linked-list format since it seems that
>> these lookups may have to be assigned from several sources.
> 
> Oh ain't that great.
> 
> So now we start patching around the kernel because the ACPI
> tables are erroneous for GPIOs. I'd like some feedback from
> Rafael &| Darren on this patch, i.e. if you two think this is a good
> way of accounting for bad GPIO descriptions in ACPI tables then
> ACK this patch.
> 
> I guess the other option would be to fix up the ACPI DSDT
> itself to put resources right, correct? Is this not possible?

This is my gut reaction as well. Heikki, why can't we correct the
firmware tables? That needs to be made clear before we start adding
hacks to the kernel.

You said, "Bad for Linux", why is this not a problem for other operating
systems?

> 
> Alexandre also need to ACK it before I dare do anything with
> it.
> 
> Do we want to use the same mechanism for augmenting
> bad device trees too?
> 
> What I like about it so far is the create/remove symmetry
> though.
> 
> Yours,
> Linus Walleij
> 

-- 
Darren Hart
Intel Open Source Technology Center
