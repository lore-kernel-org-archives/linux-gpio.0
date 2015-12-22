From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 123/182] ARM: scoop: use gpiochip data pointer
Date: Tue, 22 Dec 2015 11:24:11 -0800
Message-ID: <20151222192411.GQ30172@localhost>
References: <1449668080-3626-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36855 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754299AbbLVTjd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 14:39:33 -0500
Received: by mail-pa0-f46.google.com with SMTP id q3so100902052pav.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 11:39:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668080-3626-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, arm@kernel.org, Richard Purdie <rpurdie@rpsys.net>

On Wed, Dec 09, 2015 at 02:34:40PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: arm@kernel.org
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC people: please ACK this so I can take it with the rest of
> the refactoring through the GPIO tree.

Blanket:

Acked-by: Olof Johansson <olof@lixom.net>

for the series that you requested.


-Olof
