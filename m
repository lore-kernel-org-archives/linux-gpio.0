From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 043/182] gpio: msic: use gpiochip data pointer
Date: Wed, 09 Dec 2015 16:53:38 +0200
Message-ID: <56684072.2090009@linux.intel.com>
References: <1449667124-31787-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:37623 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983AbbLIOsZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 09:48:25 -0500
In-Reply-To: <1449667124-31787-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On 09.12.2015 15:18, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


