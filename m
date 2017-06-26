From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: acpi: Skip _AEI entries without a handler rather
 then aborting the scan
Date: Mon, 26 Jun 2017 19:08:14 +0300
Message-ID: <20170626160814.GO629@lahna.fi.intel.com>
References: <20170623072613.3768-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:40722 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750919AbdFZQIU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jun 2017 12:08:20 -0400
Content-Disposition: inline
In-Reply-To: <20170623072613.3768-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On Fri, Jun 23, 2017 at 09:26:13AM +0200, Hans de Goede wrote:
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

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
