From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on Intel_Strago
 based systems
Date: Sat, 2 Dec 2017 16:51:32 +0100
Message-ID: <CACRpkdYfOz2ET_0JnqpTwCwRt5Wd0-6zfsjPLx42g8ia-KwgMA@mail.gmail.com>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34796 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbdLBPvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 10:51:33 -0500
Received: by mail-io0-f196.google.com with SMTP id s19so14361617ioa.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 07:51:33 -0800 (PST)
In-Reply-To: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Fri, Dec 1, 2017 at 11:25 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Guenter Roeck reported an interrupt storm on a prototype system which is
> based on Cyan Chromebook. The root cause turned out to be a incorrectly
> configured pin that triggers spurious interrupts. This will be fixed in
> coreboot but currently we need to prevent the interrupt storm from
> happening by masking all interrupts (but not GPEs) on those systems.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Fixes:?
Cc: stable@vger.kernel.org?

Yours,
Linus Walleij
