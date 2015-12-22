From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 068/182] gpio: tps6586x: use gpiochip data pointer
Date: Tue, 22 Dec 2015 11:26:16 +0530
Message-ID: <5678E600.2080403@nvidia.com>
References: <1449667433-567-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3835 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbbLVGGH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 01:06:07 -0500
In-Reply-To: <1449667433-567-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>


On Wednesday 09 December 2015 06:53 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
