From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2] gpio: lynxpoint: drop references to "virtual" IRQ
Date: Mon, 14 Oct 2013 10:26:24 +0300
Message-ID: <525B9CA0.3070505@linux.intel.com>
References: <1381512960-7356-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:18248 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751334Ab3JNHV2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Oct 2013 03:21:28 -0400
In-Reply-To: <1381512960-7356-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 10/11/2013 08:36 PM, Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus. Take this
> opportunity to sink a variable into a loop.
>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
