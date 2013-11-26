From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpiolib: append SFI helpers for GPIO API
Date: Tue, 26 Nov 2013 10:37:15 +0100
Message-ID: <CACRpkdaO2oPoT0Vg7sLBoGfM-x3evaAW1rOtB4Wbggu5cbMQ_g@mail.gmail.com>
References: <1384957896-3477-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1384957896-3477-3-git-send-email-andriy.shevchenko@linux.intel.com>
	<20131121104006.GB2281@intel.com>
	<1385051340.1871.2.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:51669 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754592Ab3KZJhQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 04:37:16 -0500
Received: by mail-ob0-f170.google.com with SMTP id wp18so5562317obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 01:37:15 -0800 (PST)
In-Reply-To: <1385051340.1871.2.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, "linux-gpio @ vger . kernel . org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Len Brown <len.brown@intel.com>

On Thu, Nov 21, 2013 at 5:29 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, 2013-11-21 at 12:40 +0200, Mika Westerberg wrote:
>> On Wed, Nov 20, 2013 at 04:31:35PM +0200, Andy Shevchenko wrote:

>> > +struct gpio_desc *sfi_get_gpiod_by_name(const char *name);
>>
>> I'm wondering should this function be exported at all? What the drivers
>> should be using is gpiod_get_xxx() APIs and not DT/ACPI/SFI specific
>> interfaces.
>
> I won't mix this with generic stuff since we have really few users of
> SFI and there should be no new users at all.
>
>> Yeah, we have the same in ACPI version but I'm planning to get rid of it
>> completely.
>
> I'm okay to move to this direction, if Linus and others are okay with
> it.

Go for it. Mika is right that we need to get rid of any custom calls
and this is the way ACPI is moving too...

Yours,
Linus Walleij
