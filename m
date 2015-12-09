From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 072/182] gpio: twl4030: use gpiochip data pointer
Date: Wed, 9 Dec 2015 09:32:32 -0800
Message-ID: <20151209173232.GP2498@atomide.com>
References: <1449667613-812-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:51812 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752779AbbLIRci (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 12:32:38 -0500
Content-Disposition: inline
In-Reply-To: <1449667613-812-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Roger Quadros <rogerq@ti.com>

* Linus Walleij <linus.walleij@linaro.org> [151209 05:27]:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Tony Lindgren <tony@atomide.com>
