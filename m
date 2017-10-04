From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Wed, 4 Oct 2017 09:42:49 +0300
Message-ID: <20171004064249.GP2761@lahna.fi.intel.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171003170049.24480-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Gorman <chrisjohgorman@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 03, 2017 at 12:00:49PM -0500, Grygorii Strashko wrote:
> New GPIO IRQs are allocated and mapped dynamically by default when
> GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
> This causes issues on some Intel platforms [1][2] with broken BIOS which
> hardcodes Linux IRQ numbers in their ACPI tables.
> 
> On such platforms cherryview-pinctrl driver should allocate and map all
> GPIO IRQs at probe time.
> Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
> can be seen at boot log.
> 
> NOTE. It still may fail if boot sequence will changed and some interrupt
> controller will be probed before cherryview-pinctrl which will shift Linux IRQ
> numbering (expected with CONFIG_SPARCE_IRQ enabled).
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
> [2] https://lkml.org/lkml/2017/9/28/153
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Chris Gorman <chrisjohgorman@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
> Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Looks reasonable to me. Thanks for taking care of this!

Chris, can you try if this fixes the issue and provide your Tested-by?
