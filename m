From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib-acpi: add _DEP support for Acer One 10
Date: Wed, 15 Jun 2016 08:49:11 +0200
Message-ID: <CACRpkdZ8LhhfMWrYbZyovXS3+WiFotuhEujg1faS7WHWHxowHg@mail.gmail.com>
References: <1463368705.22433.15.camel@rzhang1-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35312 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753219AbcFOGtM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2016 02:49:12 -0400
Received: by mail-oi0-f42.google.com with SMTP id w5so19877989oib.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2016 23:49:12 -0700 (PDT)
In-Reply-To: <1463368705.22433.15.camel@rzhang1-mobl4>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zhang, Rui" <rui.zhang@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-acpi <linux-acpi@intel.com>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "stace75@gmail.com" <stace75@gmail.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>

On Mon, May 16, 2016 at 5:18 AM, Zhang, Rui <rui.zhang@intel.com> wrote:

> On Acer One 10, the ACPI battery driver can not be probed because
> it depends on the GPIO controller as well as the I2C controller to work,
>         Device (BATC)
>         {
>             Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)
>             ...
>             Name (_DEP, Package (0x03)  // _DEP: Dependencies
>             {
>                 I2C1,
>                 GPO2,
>                 GPO0
>             })
>             ...
>         }
>
> The I2C dependency also exists on other platforms and has been fixed by commit
> 40e7fcb19293 ("ACPI: Add _DEP support to fix battery issue on Asus T100TA"),
> this patch resolves the GPIO dependency for Acer One 10.
>
> Link:https://bugzilla.kernel.org/show_bug.cgi?id=115191
> CC: Mika Westerberg <mika.westerberg@linux.intel.com>
> CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Tested-by: Stace A. Zacharov <stace75@gmail.com>
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
