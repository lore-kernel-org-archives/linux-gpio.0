From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] gpio: omap: convert to use generic irq handler
Date: Mon, 12 Oct 2015 09:52:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1510120947220.6097@nanos>
References: <1443209283-20781-1-git-send-email-grygorii.strashko@ti.com> <1443209283-20781-3-git-send-email-grygorii.strashko@ti.com> <CACRpkdYDrcwa+h2Lxd65RBMc-1n9CCyVDz1qjc2U1MEU2GP7hA@mail.gmail.com> <560F07CC.9050205@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:43147 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176AbbJLHxf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2015 03:53:35 -0400
In-Reply-To: <560F07CC.9050205@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, Austin Schuh <austin@peloton-tech.com>, philipp@peloton-tech.com, linux-rt-users@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Grygorii,

can you please provide a patch set against 4.1-RT? That stuff rejects
left and right.

Thanks,

	tglx
