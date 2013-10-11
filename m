From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] gpio: add API to be strict about GPIO IRQ usage
Date: Fri, 11 Oct 2013 13:16:37 -0600
Message-ID: <52584E95.9090802@wwwdotorg.org>
References: <1381483935-12165-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37216 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753172Ab3JKTQk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 15:16:40 -0400
In-Reply-To: <1381483935-12165-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On 10/11/2013 03:32 AM, Linus Walleij wrote:
> It is currently often possible in many GPIO drivers to request
> a GPIO line to be used as IRQ after calling gpio_to_irq() and,
> as the gpiolib is not aware of this, set the same line to
> output and start driving it, with undesired side effects.
> 
> As it is a bogus usage scenario to request a line flagged as
> output to used as IRQ, we introduce APIs to let gpiolib track
> the use of a line as IRQ, and also set this flag from the
> userspace ABI.
> 
> The API is symmetric so that lines can also be flagged from
> .irq_enable() and unflagged from IRQ by .irq_disable().
> The debugfs file is altered so that we see if a line is
> reserved for IRQ.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
