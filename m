From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 5/7] irqdomain: Add irq_domain_{push,pop}_irq()
 functions.
Date: Fri, 18 Aug 2017 10:17:29 +0100
Message-ID: <725e8645-2936-0695-2a40-96035570f27f@arm.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <1503017616-3252-6-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:60136 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750812AbdHRJRc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Aug 2017 05:17:32 -0400
In-Reply-To: <1503017616-3252-6-git-send-email-david.daney@cavium.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 18/08/17 01:53, David Daney wrote:
> For an already existing irqdomain hierarchy, as might be obtained via
> a call to pci_enable_msix_range(), a PCI driver wishing to add an
> additional irqdomain to the hierarchy needs to be able to insert the
> irqdomain to that already initialized hierarchy.  Calling
> irq_domain_create_hierarchy() allows the new irqdomain to be created,
> but no existing code allows for initializing the associated irq_data.
> 
> Add a couple of helper functions (irq_domain_push_irq() and
> irq_domain_pop_irq()) to initialize the irq_data for the new
> irqdomain added to an existing hierarchy.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
