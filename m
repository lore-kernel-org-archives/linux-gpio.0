From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: cherryview: Add support for GMMR GPIO opregion
Date: Thu, 23 Mar 2017 14:43:25 +0100
Message-ID: <CACRpkdYSAzs7vCMronYhpgZSw1yzAPtMH4-hBuiTsK5PKsGSug@mail.gmail.com>
References: <20170323132325.21558-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:38835 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752507AbdCWNnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 09:43:46 -0400
Received: by mail-it0-f45.google.com with SMTP id y18so40551376itc.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 06:43:26 -0700 (PDT)
In-Reply-To: <20170323132325.21558-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 23, 2017 at 2:23 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> On some Cherry Trail devices the ASL uses the GMMR GPIO to access
> GPIOs so as to serialize MMIO accesses to GPIO registers with the
> OS, because:
>
> "Due to a silicon issue, a shared lock must be used to prevent concurrent
> accesses across the 4 GPIO controllers.
>
> See Intel Atom Z8000 Processor Series Specification Update (Rev. 005),
> errata #CHT34, for further information."
>
> This commit adds support for this opregion, this fixes a number of
> ASL errors on my Ezpad mini3 tablet and makes the otg port device/host
> muxing which is controlled in firmware on this model work properly.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes in v2:
> -Call acpi_remove_address_space_handler on remove
> Changes in v3:
> -Return actual status from the handler rather then always returning AE_OK

Patch applied.

Yours,
Linus Walleij
