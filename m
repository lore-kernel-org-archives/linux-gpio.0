From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: winbond: add driver
Date: Thu, 28 Dec 2017 13:52:10 +0100
Message-ID: <CACRpkdZWzodfpWGG2=KJDupi0WGBRJof9aj6axX+LVSDq73tiA@mail.gmail.com>
References: <309acd17-5244-da8c-a28e-dace15ada4fb@maciej.szmigiero.name>
 <20171224224215.GA2372@sophia> <f3ebd850-c301-2adb-95e7-3a1f37c2259c@maciej.szmigiero.name>
 <0e8ece1e-3041-ea58-f5b6-298c163fa747@maciej.szmigiero.name>
 <20171227002410.GA12050@sophia> <CACRpkdYtGKWtodP9tb+ZdQ=dsSouvpMGeXRR_TDNV8hR53c+NQ@mail.gmail.com>
 <20171228043312.GA11117@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:33240 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752905AbdL1MwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Dec 2017 07:52:11 -0500
Received: by mail-it0-f51.google.com with SMTP id o130so1309711itg.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2017 04:52:11 -0800 (PST)
In-Reply-To: <20171228043312.GA11117@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Thu, Dec 28, 2017 at 5:33 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Given that CONFIG_PC104 now fulfills the original purpose of adding
> ISA_BUS_API to the depends on line for the PC/104 device drivers, and
> that ISA_BUS_API can be selected as necessary with no danger to the
> integrity of the system, I think it would be appropriate to change all
> the existing ISA_BUS_API depends on lines to respective select lines.
> Does that logic make sense?

I'm *BAD* at Kconfig.

But it makes sense to me. I just suspect that if you turn these into selects,
you will see the same thing that Maciej is seeing and then you get to deal
with it :D

So by all means, try it out!

Yours,
Linus Walleij
