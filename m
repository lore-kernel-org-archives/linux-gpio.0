From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: acpi: separation of concerns
Date: Mon, 3 Oct 2016 14:36:50 +0200
Message-ID: <CACRpkdb_Owwei1vA2cwzcuuTOxVnyWJY1Q8yL4UVM8TdNb74+Q@mail.gmail.com>
References: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
 <1475485360-15127-2-git-send-email-linus.walleij@linaro.org> <20161003102446.GA1218@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33072 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbcJCMgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 08:36:51 -0400
Received: by mail-oi0-f47.google.com with SMTP id r126so197653846oib.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 05:36:51 -0700 (PDT)
In-Reply-To: <20161003102446.GA1218@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>

On Mon, Oct 3, 2016 at 12:24 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Oct 03, 2016 at 11:02:39AM +0200, Linus Walleij wrote:
>> The generic GPIO library directly implement code for acpi_find_gpio()
>> which is only used with CONFIG_ACPI. This was probably done because
>> OF did the same thing, but I removed that so remove this too.
>
> Yes, it was originally copied from the DT implementation.
>
>> Rename the internal acpi_find_gpio() in gpiolib-acpi.c to
>> acpi_populate_gpio_lookup() which seems to be more appropriate anyway
>> so as to avoid a namespace clash with the same function.
>>
>> Make the stub return -ENOENT rather than -ENOSYS (as that is for
>> syscalls!).
>
> -ENXIO?

Sorry for not writing all that I think.

The code works like such that if -ENOENT is returned, the core
will proceed to check for presence of boardfile-type hardcoded
descriptor tables. Which might be relevant.

(The mechanism should be used as fallback also when no
desc is found in the ACPI lookup, actually.)

>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Regardless of that,
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks!

Yours,
Linus Walleij
