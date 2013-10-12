From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: lynxpoint: drop references to "virtual" IRQ
Date: Sat, 12 Oct 2013 08:22:59 +0300
Message-ID: <20131012052259.GA3521@intel.com>
References: <1381512960-7356-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:39458 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750763Ab3JLFRc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 12 Oct 2013 01:17:32 -0400
Content-Disposition: inline
In-Reply-To: <1381512960-7356-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Fri, Oct 11, 2013 at 07:36:00PM +0200, Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus. Take this
> opportunity to sink a variable into a loop.
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
