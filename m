From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: free handles in fringe cases
Date: Mon, 04 Jul 2016 15:23:55 +0200
Message-ID: <1540365.AKcYWQigcu@ws-stein>
References: <1467630885-3042-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:51069 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753653AbcGDNYD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 09:24:03 -0400
In-Reply-To: <1467630885-3042-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Monday 04 July 2016 13:14:45, Linus Walleij wrote:
> If we fail when copying the ioctl() struct to userspace we still
> need to clean up the cruft otherwise left behind or it will stay
> around until the issuing process terminates the file handle.
> 
> Reported-by: Alexander Stein <alexander.stein@systec-electronic.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Acked-by: Alexander Stein <alexander.stein@systec-electronic.com>

