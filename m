From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Fri, 7 Apr 2017 09:27:36 +0200
Message-ID: <CACRpkdaTviFd65mAR+CqTC+j6WWY-ETbRvTnyh-6orDZF6YPpw@mail.gmail.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
 <da0935b8-245a-6920-4749-ade6eb278dba@arm.com> <20170330090047.GX2957@lahna.fi.intel.com>
 <20170406095948.GT2957@lahna.fi.intel.com> <6bcf8db2-626c-7934-a334-13b11fb7be68@arm.com>
 <20170406105059.GV2957@lahna.fi.intel.com> <f5508b70-3cbd-bbdd-da8d-ff0bff08f835@arm.com>
 <20170406131824.GW2957@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:36085 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754862AbdDGH1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 03:27:43 -0400
Received: by mail-io0-f180.google.com with SMTP id l7so44351911ioe.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 00:27:43 -0700 (PDT)
In-Reply-To: <20170406131824.GW2957@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Apr 6, 2017 at 3:18 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Apr 06, 2017 at 12:05:28PM +0100, Marc Zyngier wrote:
>> > There is a proper way to use GPIOs as interrupts in ACPI, namely GpioInt
>> > resource but it has not been used in that particular machine for some
>> > reason.
>>
>> OK, that explains it. One thing you could try would be to allocate the
>> domain as a legacy one, which allows you to specify the virtual
>> interrupt range you require. Not sure that's any better though.
>
> Yeah, then I would have to add a whole bunch of code to handle custom
> irqdomain just to support this one machine (fingers crossed that it is
> limited to only this particular machine).

Thierry is working on better generic/custom irqdomains for the GPIOlib
core IRQ support. But right now the quirk is maybe a better solution.

Yours,
Linus Walleij
