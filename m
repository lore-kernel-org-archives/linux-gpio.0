From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/3] gpio: acpi: separation of concerns
Date: Mon, 3 Oct 2016 13:24:46 +0300
Message-ID: <20161003102446.GA1218@lahna.fi.intel.com>
References: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
 <1475485360-15127-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:5639 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752043AbcJCKYv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Oct 2016 06:24:51 -0400
Content-Disposition: inline
In-Reply-To: <1475485360-15127-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>

On Mon, Oct 03, 2016 at 11:02:39AM +0200, Linus Walleij wrote:
> The generic GPIO library directly implement code for acpi_find_gpio()
> which is only used with CONFIG_ACPI. This was probably done because
> OF did the same thing, but I removed that so remove this too.

Yes, it was originally copied from the DT implementation.

> Rename the internal acpi_find_gpio() in gpiolib-acpi.c to
> acpi_populate_gpio_lookup() which seems to be more appropriate anyway
> so as to avoid a namespace clash with the same function.
> 
> Make the stub return -ENOENT rather than -ENOSYS (as that is for
> syscalls!).

-ENXIO?

> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Regardless of that,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
