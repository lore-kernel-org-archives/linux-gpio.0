From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on Intel_Strago
 based systems
Date: Sat, 2 Dec 2017 09:25:13 -0800
Message-ID: <e6a8c2aa-787b-d2cc-7a86-c19a7437c038@roeck-us.net>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
 <CACRpkdYfOz2ET_0JnqpTwCwRt5Wd0-6zfsjPLx42g8ia-KwgMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:42644 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751943AbdLBRZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 12:25:16 -0500
Received: by mail-pl0-f66.google.com with SMTP id bd8so8053980plb.9
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 09:25:15 -0800 (PST)
In-Reply-To: <CACRpkdYfOz2ET_0JnqpTwCwRt5Wd0-6zfsjPLx42g8ia-KwgMA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On 12/02/2017 07:51 AM, Linus Walleij wrote:
> On Fri, Dec 1, 2017 at 11:25 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
>> Guenter Roeck reported an interrupt storm on a prototype system which is
>> based on Cyan Chromebook. The root cause turned out to be a incorrectly
>> configured pin that triggers spurious interrupts. This will be fixed in
>> coreboot but currently we need to prevent the interrupt storm from
>> happening by masking all interrupts (but not GPEs) on those systems.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Fixes:?
> Cc: stable@vger.kernel.org?

Fixes: bcb48cca23ec ("pinctrl: cherryview: Do not mask all interrupts in probe")

Mika, any chance to send an update soon ? I would like to apply the patch to
chromeos-4.14, and I would prefer to use the final version.

On a side note, I confirmed that the problem is also seen on release systems
(Acer Chromebook R11) as well as on other systems using the same chipset,
such as Samsung Chromebook 3.

Thanks,
Guenter
