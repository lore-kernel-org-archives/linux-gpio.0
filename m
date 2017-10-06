From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Fri, 6 Oct 2017 11:19:49 +0300
Message-ID: <20171006081949.GX2761@lahna.fi.intel.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
 <20171004064249.GP2761@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:62993 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750882AbdJFI2h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Oct 2017 04:28:37 -0400
Content-Disposition: inline
In-Reply-To: <20171004064249.GP2761@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Gorman <chrisjohgorman@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Wed, Oct 04, 2017 at 09:42:49AM +0300, Mika Westerberg wrote:
> On Tue, Oct 03, 2017 at 12:00:49PM -0500, Grygorii Strashko wrote:
> > New GPIO IRQs are allocated and mapped dynamically by default when
> > GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
> > This causes issues on some Intel platforms [1][2] with broken BIOS which
> > hardcodes Linux IRQ numbers in their ACPI tables.
> > 
> > On such platforms cherryview-pinctrl driver should allocate and map all
> > GPIO IRQs at probe time.
> > Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
> > can be seen at boot log.
> > 
> > NOTE. It still may fail if boot sequence will changed and some interrupt
> > controller will be probed before cherryview-pinctrl which will shift Linux IRQ
> > numbering (expected with CONFIG_SPARCE_IRQ enabled).
> > 
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
> > [2] https://lkml.org/lkml/2017/9/28/153
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Chris Gorman <chrisjohgorman@gmail.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com> 
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
> > Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Looks reasonable to me. Thanks for taking care of this!
> 
> Chris, can you try if this fixes the issue and provide your Tested-by?

Linus,

Chris gave his tested-by in another thread:

  https://patchwork.kernel.org/patch/9985087/

Chris, please let me know if that was not your intention.

I'm fine with the patch as well,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I guess this requires stable tag because if I understand comments in
that bug right, it affects the whole v4.13.
