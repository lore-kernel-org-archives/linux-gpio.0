From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] gpio-mxc: Fix issue with gpios used as wake source
 on iMX27
Date: Thu, 27 Jul 2017 22:17:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707272214320.2368@nanos>
References: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:55950 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751613AbdG0URF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2017 16:17:05 -0400
In-Reply-To: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Rosenberger <p.rosenberger@linutronix.de>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org


Gentle ping ....

Thanks,

	tglx

On Wed, 12 Jul 2017, Philipp Rosenberger wrote:

> The gpio-mxc driver is able to use two interrupts per gpio bank. One for
> the lower 16 and the other for the higher 16 gpios. The iMX27 has only one
> interrupt per bank. An error in the driver leads to the problem that the
> driver uses an invalid interrupt for the higher 16 gpios. Which in turn
> prevents the upper 16 gpios per bank to be used as wake source.
> 
> The first patch fixes the assignment for the irq_high. The second patch
> adds proper return values. Which should make finding any problems in the
> future much easier.
> 
> Philipp Rosenberger (2):
>   gpio: gpio-mxc: Fix: higher 16 GPIOs usable as wake source
>   gpio: gpio-mxc: gpio_set_wake_irq() use proper return values
> 
>  drivers/gpio/gpio-mxc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> -- 
> 2.1.4
> 
> 
