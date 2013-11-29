From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 20:55:29 +0100
Message-ID: <CACRpkdb3xEKyV14OrmOg2STAZo87RPE=9noEXy_5PstJkB-uOg@mail.gmail.com>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
	<CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
	<20131129150238.GJ2281@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33619 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab3K2Tza (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 14:55:30 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so10331544obc.40
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 11:55:30 -0800 (PST)
In-Reply-To: <20131129150238.GJ2281@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bruno Randolf <br1@einfach.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 4:02 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Nov 29, 2013 at 03:40:01PM +0100, Linus Walleij wrote:
>> At the very least I want the driver split up in two files: one that
>> adds the GPIO driver for an arbitrary number of pins, and one
>> that adds this boards' configuration. You can put the latter in
>> drivers/platform/x86 or wherever, just not in drivers/gpio.
>>
>> Maybe this leads to another interesting discussion on why
>> ACPI is not used for configuring the board...
>
> AFAIK there are not that many systems shipping today that have ACPI 5.0
> supported and you need ACPI 5.0 in order to pass GpioIo/GpioInt resources
> from a device to the driver.

Yeah, hm, hehe, maybe they should use Device Tree?

Yours,
Linus Walleij
