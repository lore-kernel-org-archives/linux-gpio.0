From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 050/182] gpio: pch: use gpiochip data pointer
Date: Mon, 4 Jan 2016 09:55:09 +0100
Message-ID: <20160104095509.42920f2d@endymion.delvare>
References: <1449667188-32127-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43674 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751550AbcADIzV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Jan 2016 03:55:21 -0500
In-Reply-To: <1449667188-32127-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>

Hi Linus,

On Wed,  9 Dec 2015 14:19:48 +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pch.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
