From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/5] gpio: make gpiochip_get_desc() gpiolib-private
Date: Tue, 22 Jul 2014 13:17:40 -0700
Message-ID: <20140722201740.GA11459@roeck-us.net>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
 <1406013463-19218-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:42912 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaGVURq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Jul 2014 16:17:46 -0400
Content-Disposition: inline
In-Reply-To: <1406013463-19218-4-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com

On Tue, Jul 22, 2014 at 04:17:41PM +0900, Alexandre Courbot wrote:
> As GPIO descriptors are not going to remain unique anymore, having this
> function public is not safe. Restrain its use to gpiolib since we have
> no user outside of it.
> 
If I implement a gpio chip driver built as module, and I want to use
gpiochip_request_own_desc(), how am I supposed to get desc ?

I understand that there is still gpio_to_desc(), but I would have thought
that
	desc = gpiochip_get_desc(chip, pin);
would be better than
	desc = gpio_to_desc(chip->base + pin);

Not that it makes much of a difference for me, just asking.

Thanks,
Guenter
