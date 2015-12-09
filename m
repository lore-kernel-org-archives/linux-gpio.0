From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 032/182] gpio: lynxpoint: use gpiochip data pointer
Date: Wed, 9 Dec 2015 16:24:46 +0200
Message-ID: <20151209142446.GW1766@lahna.fi.intel.com>
References: <1449667033-31266-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:51900 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751869AbbLIO07 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 09:26:59 -0500
Content-Disposition: inline
In-Reply-To: <1449667033-31266-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Wed, Dec 09, 2015 at 02:17:13PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
