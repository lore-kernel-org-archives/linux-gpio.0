From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] gpio: remove misleading documentation
Date: Mon, 10 Mar 2014 21:21:53 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403102121400.18573@ionos.tec.linutronix.de>
References: <1394158555-22114-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:52945 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752925AbaCJUVr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Mar 2014 16:21:47 -0400
In-Reply-To: <1394158555-22114-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Fri, 7 Mar 2014, Linus Walleij wrote:
> It is currently debated where the functions to lock a certain
> GPIO line as used for IRQs should be called. Delete all
> misleading documentation.
> 
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
