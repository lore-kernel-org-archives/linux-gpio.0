From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 038/182] gpio: mcp: use gpiochip data pointer
Date: Thu, 10 Dec 2015 08:06:11 +0100
Message-ID: <4571119.WHxU4p0sId@ws-stein>
References: <1449667081-31552-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:59997 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751358AbbLJHGO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 10 Dec 2015 02:06:14 -0500
In-Reply-To: <1449667081-31552-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Sonic Zhang <sonic.zhang@analog.com>

On Wednesday 09 December 2015 14:18:01, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Alexander Stein <alexander.stein@systec-electronic.com>
> Cc: Sonic Zhang <sonic.zhang@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alexander Stein <alexander.stein@systec-electronic.com>
-- 
-----
Please note our closure period for Christmas vacation and turn of the year
We are closed from 21st December 2015 to 3rd January 2016
-----
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

