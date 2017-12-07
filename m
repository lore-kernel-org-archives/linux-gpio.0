From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: cherryview: Mask all interrupts on
 Intel_Strago based systems
Date: Thu, 7 Dec 2017 09:47:35 +0100
Message-ID: <CACRpkdbbTPBuS7OHjm11Ns6CGjWDKMLM8e0_SrdK0DXnjL4j4Q@mail.gmail.com>
References: <20171204091102.40822-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:43867 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbdLGIrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Dec 2017 03:47:36 -0500
Received: by mail-it0-f68.google.com with SMTP id u62so13037744ita.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2017 00:47:36 -0800 (PST)
In-Reply-To: <20171204091102.40822-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Mon, Dec 4, 2017 at 10:11 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Guenter Roeck reported an interrupt storm on a prototype system which is
> based on Cyan Chromebook. The root cause turned out to be a incorrectly
> configured pin that triggers spurious interrupts. This will be fixed in
> coreboot but currently we need to prevent the interrupt storm from
> happening by masking all interrupts (but not GPEs) on those systems.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> Fixes: bcb48cca23ec ("pinctrl: cherryview: Do not mask all interrupts in probe")
> Reported-and-tested-by: Guenter Roeck <linux@roeck-us.net>
> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org
> ---
> Changes from v1:

Patch applied for fixes.

Yours,
Linus Walleij
