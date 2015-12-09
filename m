From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 079/182] gpio: wm831x: use gpiochip data pointer
Date: Wed, 9 Dec 2015 14:49:22 +0000
Message-ID: <20151209144922.GH6058@localhost.localdomain>
References: <1449667665-1156-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:35830 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751381AbbLIOtw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 09:49:52 -0500
Content-Disposition: inline
In-Reply-To: <1449667665-1156-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@kernel.org>

On Wed, Dec 09, 2015 at 02:27:45PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: patches@opensource.wolfsonmicro.com
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
