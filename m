From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] pinctrl: nomadik: mark GPIO lines used for IRQ
Date: Fri, 11 Oct 2013 13:17:10 -0600
Message-ID: <52584EB6.7020604@wwwdotorg.org>
References: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56445 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772Ab3JKTRN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 15:17:13 -0400
In-Reply-To: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On 10/11/2013 03:32 AM, Linus Walleij wrote:
> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
> the gpiolib so we can keep track of the usage centrally.

Are you planning on converting all GPIO+IRQ drivers, or should others
port this fix?
