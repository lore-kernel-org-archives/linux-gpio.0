From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Wed, 29 Mar 2017 15:24:21 +0200
Message-ID: <CACRpkdb0O+_PXrYfWWaeJGU-Ytg32AJsGzOH-_AQ9eY2hOG8LA@mail.gmail.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com> <20170329131937.GW2957@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:37543 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932679AbdC2NYX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 09:24:23 -0400
Received: by mail-it0-f52.google.com with SMTP id 190so55061583itm.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2017 06:24:22 -0700 (PDT)
In-Reply-To: <20170329131937.GW2957@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 29, 2017 at 3:19 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Mar 29, 2017 at 02:58:19PM +0200, Linus Walleij wrote:
>> On Wed, Mar 29, 2017 at 11:59 AM, Mika Westerberg
>> > +       chip->irq_need_valid_mask = need_valid_mask;
>>
>> Isn't the right solution to translate this back to the offset from the "Linux
>> IRQ" and use that offset? This quirk seems pretty violent.
>
> So based on DMI strings instead of doing this, just correct the offset
> and be done with it? Works for me.

Yeah I imagine? We just fix up the Linux magic numbers to the hardware
magic numbers.

This is what a poor soul trying to port this chromebook to use BSD or
Windows will have to do anyway, so I don't see why we should be
different.

Yours,
Linus Walleij
