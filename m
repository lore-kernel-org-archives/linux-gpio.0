From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 2/2] pinctrl: nomadik: mark GPIO lines used for IRQ
Date: Sat, 12 Oct 2013 08:03:58 +0200
Message-ID: <20131012060357.GI24616@ns203013.ovh.net>
References: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org>
 <52584EB6.7020604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]:55379 "EHLO
	mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752058Ab3JLGCz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Oct 2013 02:02:55 -0400
Received: from mail407.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 95A3EFF840C
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2013 08:02:22 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <52584EB6.7020604@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On 13:17 Fri 11 Oct     , Stephen Warren wrote:
> On 10/11/2013 03:32 AM, Linus Walleij wrote:
> > When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
> > the gpiolib so we can keep track of the usage centrally.
> 
> Are you planning on converting all GPIO+IRQ drivers, or should others
> port this fix?

I plan to do so
I propose this at ELCE and more cleanup

Best Regards,
J.
