From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] gpio / ACPI: fix returned error from
 acpi_dev_gpio_irq_get()
Date: Thu, 13 Oct 2016 10:10:31 +0300
Message-ID: <20161013071031.GD2774@lahna.fi.intel.com>
References: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:49839 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752019AbcJMHLg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Oct 2016 03:11:36 -0400
Content-Disposition: inline
In-Reply-To: <1476290430-19542-1-git-send-email-benjamin.tissoires@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, David Arcari <darcari@redhat.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 12, 2016 at 06:40:30PM +0200, Benjamin Tissoires wrote:
> From: David Arcari <darcari@redhat.com>
> 
> acpi_dev_gpio_irq_get() currently ignores the error returned
> by acpi_get_gpiod_by_index() and overwrites it with -ENOENT.
> 
> Problem is this error can be -EPROBE_DEFER, which just blows
> up some drivers when the module ordering is not correct.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: David Arcari <darcari@redhat.com>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
