From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 08/17] gpio: mvebu: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 07:25:19 -0400
Message-ID: <20140429112519.GE28159@titan.lakedaemon.net>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
 <003901cf6386$607ce8c0$2176ba40$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:15787 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933719AbaD2LZX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 07:25:23 -0400
Content-Disposition: inline
In-Reply-To: <003901cf6386$607ce8c0$2176ba40$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>

On Tue, Apr 29, 2014 at 05:38:21PM +0900, Jingoo Han wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/gpio/gpio-mvebu.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
