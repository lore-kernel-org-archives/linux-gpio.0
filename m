From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/2] pinctrl: nomadik: mark GPIO lines used for IRQ
Date: Fri, 11 Oct 2013 21:32:03 +0200
Message-ID: <51579AD2-BB2A-499B-8958-2F007E4FF4A5@collabora.co.uk>
References: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org> <52584EB6.7020604@wwwdotorg.org>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43920 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752780Ab3JKTcI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 15:32:08 -0400
In-Reply-To: <52584EB6.7020604@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>


> On 11/10/2013, at 21:17, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> On 10/11/2013 03:32 AM, Linus Walleij wrote:
>> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
>> the gpiolib so we can keep track of the usage centrally.
> 
> Are you planning on converting all GPIO+IRQ drivers, or should others
> port this fix?

FWIW I have already a patch to convert gpio-omap to use this API instead of custom code and will post it as soon as Linus' patch is merged on one of his branches.

Best regards,
Javier