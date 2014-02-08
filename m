From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] gpio: mvebu: use chained_irq_{enter, exit} for GIC
 compatibility
Date: Sat, 8 Feb 2014 12:06:35 -0500
Message-ID: <20140208170635.GJ8533@titan.lakedaemon.net>
References: <1391772559-28357-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:32241 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453AbaBHRGr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2014 12:06:47 -0500
Content-Disposition: inline
In-Reply-To: <1391772559-28357-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Fri, Feb 07, 2014 at 12:29:19PM +0100, Thomas Petazzoni wrote:
> On currently supported SoCs, the GPIO block used on Marvell EBU SoCs
> is always connected to the Marvell MPIC. However, we are going to
> introduce the support for newer Marvell EBU SoCs that use the
> Cortex-A9 core, and therefore use the GIC as their main interrupt
> controller, to which the GPIO block controlled by the gpio-mvebu
> driver is connected.
> 
> The GIC interrupt controller driver uses the fasteoi flow handler. In
> order to ensure that the eoi hook of the GIC driver gets called, the
> GPIO driver should call chained_irq_enter() and chained_irq_exit() in
> its handler. Without this, the first GPIO interrupt locks up the
> system because it doesn't get acked at the GIC level.
> 
> This change is similar to for example commit
> 0d978eb7349941139241a99acf05de6dd49b78d1 ("gpio: davinci: use
> chained_irq_enter/chained_irq_exit API").
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
