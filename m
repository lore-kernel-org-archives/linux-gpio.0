From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: acpi: Add managed variant of acpi_dev_add_driver_gpios()
Date: Tue, 14 Mar 2017 10:58:52 +0100
Message-ID: <CACRpkdYZVY0jYLkuH3Ti7SUnV1Dz_SkkLKv0cyZdvVjiGOR9dQ@mail.gmail.com>
References: <20170302134805.81705-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36762 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbdCNJ6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 05:58:54 -0400
Received: by mail-it0-f43.google.com with SMTP id w124so27628895itb.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 02:58:53 -0700 (PDT)
In-Reply-To: <20170302134805.81705-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 2, 2017 at 2:48 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Introduce device managed variant of acpi_dev_add_driver_gpios() and its
> counterpart acpi_dev_remove_driver_gpios().
>
> The functions in most cases are used in driver's ->probe() and
> ->remove() callbacks, that's why it's useful to have managed variant of
> them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> This is supposed to go through GPIO tree.
>
> Linus, can you create an immutable branch that other subsystems can use
> it if needed?

I have created ib-acpi-devm in the GPIO tree based on v4.11-rc1, applied
this patch and merged that into my devel branch.

Anyone who needs it can grab that branch, I will push it out later.

Yours,
Linus Walleij
