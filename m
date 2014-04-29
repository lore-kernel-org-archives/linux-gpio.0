From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] gpio: mvebu: Remove initcall-based driver
 initialization
Date: Tue, 29 Apr 2014 09:23:21 -0400
Message-ID: <20140429132321.GK28159@titan.lakedaemon.net>
References: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:14119 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaD2NX1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 09:23:27 -0400
Content-Disposition: inline
In-Reply-To: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>

On Thu, Apr 24, 2014 at 05:54:50PM -0300, Ezequiel Garcia wrote:
> There's no reason to use an initcall to initialize this driver,
> and regular module_platform_driver() can be used instead.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
