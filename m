From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: drop users of irq_set_chip_and_handler_name()
Date: Fri, 29 Nov 2013 12:20:51 +0200
Message-ID: <20131129102050.GF2281@intel.com>
References: <1385472771-26681-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36714 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752224Ab3K2KOa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 05:14:30 -0500
Content-Disposition: inline
In-Reply-To: <1385472771-26681-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, David Cohen <david.a.cohen@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, Nov 26, 2013 at 02:32:51PM +0100, Linus Walleij wrote:
> Switch all users of irq_set_chip_and_handler_name() to simply
> use irq_set_chip_and_handler(), all just provide a boilerplate
> name like "demux" or "mux" - a fact which is anyway obvious
> from the hwirq number from the irqdomain now present in e.g.
> /proc/interrupts.
> 
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I'm challenging all users of this function to make an argument
> for it to stay in, and suspecting that this is mostly a copy
> and paste artifact...

I think so also. To me the patch makes perfect sense and it didn't break
anything on lynxpoint.

For gpio-lynxpoint:

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
