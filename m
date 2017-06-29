From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: acpi: Skip _AEI entries without a handler rather
 then aborting the scan
Date: Thu, 29 Jun 2017 14:55:56 +0200
Message-ID: <CACRpkdZzGYLeBjRn+ihD1g4pMPk-oH+5AUsWr1tRSBn98HTvDA@mail.gmail.com>
References: <20170623072613.3768-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33547 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752420AbdF2Mz6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 08:55:58 -0400
Received: by mail-io0-f169.google.com with SMTP id h64so6355722iod.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 05:55:58 -0700 (PDT)
In-Reply-To: <20170623072613.3768-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jun 23, 2017 at 9:26 AM, Hans de Goede <hdegoede@redhat.com> wrote:

> acpi_walk_resources will stop as soon as the callback passed in returns
> an error status. On a x86 tablet I have the first GpioInt in the _AEI
> resource list has no handler defined in the DSDT, causing
> acpi_walk_resources to abort scanning the rest of the resource list,
> which does define valid ACPI GPIO events.
>
> This commit changes the return for not finding a handler from
> AE_BAD_PARAMETER to AE_OK so that the rest of the resource list will
> get scanned normally in case of missing event handlers.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied for fixes with the ACKs.

Yours,
Linus Walleij
