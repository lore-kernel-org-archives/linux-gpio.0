From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: cherryview: Add a quirk to make Acer
 Chromebook keyboard work again
Date: Tue, 11 Apr 2017 10:10:38 +0200
Message-ID: <CACRpkdbeiV3Hry6zcbtrX6yVRWVUp-eL4X6jVzNPkmB5tebJ4A@mail.gmail.com>
References: <20170410101633.53161-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36735 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754126AbdDKIKj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2017 04:10:39 -0400
Received: by mail-io0-f181.google.com with SMTP id l7so124845428ioe.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2017 01:10:39 -0700 (PDT)
In-Reply-To: <20170410101633.53161-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 10, 2017 at 12:16 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> After commit 47c950d10202 ("pinctrl: cherryview: Do not add all
> southwest and north GPIOs to IRQ domain") the driver does not add all
> GPIOs to the irqdomain. The reason for that is that those GPIOs cannot
> generate IRQs at all, only GPEs (General Purpose Events). This causes
> Linux virtual IRQ numbering to change.
>
> However, it seems some CYAN Chromebooks, including Acer Chromebook
> hardcodes these Linux IRQ numbers in the ACPI tables of the machine.
> Since the numbering is different now, the IRQ meant for keyboard does
> not match the Linux virtual IRQ number anymore making the keyboard
> non-functional.
>
> Work this around by adding special quirk just for these machines where
> we add back all GPIOs to the irqdomain. Rest of the Cherryview/Braswell
> based machines will not be affected by the change.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Fixes: 47c950d10202 ("pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain")
> Reported-by: Adam S Levy <theadamlevy@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes from v1:
>  - Add BIOS date to DMI match string to keep this quirk from affecting
>    future BIOS versions where the issue might be fixed already.
>
> Marc, Linus,
>
> I went for adding the quirk here instead of quirking it in i8042 keyboard
> driver because there might be other devices hard-coding the Linux IRQ
> number. This way we only need to touch one driver.

Patch applied for fixes.

It is about time we get something upstream to fix this.

Yours,
Linus Walleij
