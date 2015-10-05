From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 1/2] pinctrl: at91-pio4: Use irq_set_handler_locked()
Date: Mon, 5 Oct 2015 11:09:57 +0100
Message-ID: <20151005100957.GA2992@odux.rfo.atmel.com>
References: <abf74f93ec58e3b321dce23af3fa5af1ffa2e070.1443793711.git.nicolas.ferre@atmel.com>
 <560E8D4C.1000400@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:34829 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752447AbbJEKKD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 06:10:03 -0400
Content-Disposition: inline
In-Reply-To: <560E8D4C.1000400@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, s.hauer@pengutronix.de, alexandre.belloni@free-electrons.com, Thomas Gleixner <tglx@linutronix.de>

Hi Nicolas,

On Fri, Oct 02, 2015 at 03:57:32PM +0200, Nicolas Ferre wrote:
> Hi all,
> 
> Well it seems my cover letter is missing. So, here it is:
> 
> ---8<----
> pinctrl: at91-pio4: fixes for current linux-next (irq)
> 
> While testing the sama5d2 on today's linux-next I discovered that some
> adaptations were missing. So, I don't know if you were aware but here
> are my fixes in case you don't have them already.
> 
> +Cc: Thomas and Stephen in case these errors happen while building
> linux-next...

Yes it happens, fixes sent and taken by Linus.

> 
> Bye,

Ludovic
