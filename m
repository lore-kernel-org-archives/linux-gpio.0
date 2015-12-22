From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 047/182] gpio: palmas: use gpiochip data pointer
Date: Tue, 22 Dec 2015 11:25:31 +0530
Message-ID: <5678E5D3.3010901@nvidia.com>
References: <1449667158-31977-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10356 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbbLVGF1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 01:05:27 -0500
In-Reply-To: <1449667158-31977-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Andrew Chew <achew@nvidia.com>, Stephen Warren <swarren@nvidia.com>


On Wednesday 09 December 2015 06:49 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Andrew Chew <achew@nvidia.com>
> Cc: Stephen Warren <swarren@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
