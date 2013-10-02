From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] gpio/lynxpoint: check if the interrupt is enabled in
 IRQ handler
Date: Wed, 02 Oct 2013 14:03:46 +0300
Message-ID: <524BFD92.8030406@linux.intel.com>
References: <1380638143-20040-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:41752 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753933Ab3JBK7Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 2 Oct 2013 06:59:16 -0400
In-Reply-To: <1380638143-20040-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

On 10/01/2013 05:35 PM, Mika Westerberg wrote:
> Checking LP_INT_STAT is not enough in the interrupt handler because its
> contents get updated regardless of whether the pin has interrupt enabled or
> not. This causes the driver to loop forever for GPIOs that are pulled up.
>
> Fix this by checking the interrupt enable bit for the pin as well.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

