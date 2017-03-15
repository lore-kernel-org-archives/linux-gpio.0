From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: acpi: acpi_gpio_resource_lookup: return info
 even if there is no desc
Date: Wed, 15 Mar 2017 11:17:37 +0100
Message-ID: <CACRpkda7+UqubrXXV+KNP66P6b36NNpVZzR3acvDYx=1HrTM3Q@mail.gmail.com>
References: <20170310205846.16530-1-hdegoede@redhat.com> <20170310205846.16530-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33822 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752608AbdCOKRk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:17:40 -0400
Received: by mail-io0-f172.google.com with SMTP id b140so16902407iof.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 03:17:39 -0700 (PDT)
In-Reply-To: <20170310205846.16530-2-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 10, 2017 at 9:58 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> Make acpi_gpio_resource_lookup fill acpi_gpio_info even if there is
> no gpio_desc for the gpio and add a found flag to lookup which is
> used to indicate that valid info was found.
>
> This is a preparation patch for making acpi_dev_gpio_irq_get actually
> skip interrupts which do not match the requested index, rather then
> bailing if it cannot retreive a gpio_desc for them.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm totally dependent on Mika/Rafael to review these ACPI patches.

Mika?

Yours,
Linus Walleij
