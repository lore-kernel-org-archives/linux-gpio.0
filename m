From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 135/182] MIPS: alchemy: switch to gpiochip_add_data()
Date: Wed, 9 Dec 2015 14:54:48 +0100
Message-ID: <20151209135448.GI4722@linux-mips.org>
References: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:42832 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbbLINy6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:54:58 -0500
Received: from localhost.localdomain ([127.0.0.1]:38078 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27013559AbbLINy5F8Lc9 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 14:54:57 +0100
Content-Disposition: inline
In-Reply-To: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, linux-mips@linux-mips.org

On Wed, Dec 09, 2015 at 02:39:02PM +0100, Linus Walleij wrote:

> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Ralf: please ACK this so I can take it through the GPIO tree.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

> BTW: would be nice if the MIPS GPIO drivers could move down
> to drivers/gpio in the long run.

I agree - but for practical reasons this won't happen quickly.

  Ralf
