From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 100/182] pinctrl: as3722: use gpiochip data pointer
Date: Tue, 22 Dec 2015 11:27:07 +0530
Message-ID: <5678E633.4060103@nvidia.com>
References: <1449667897-2450-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3873 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbbLVGGz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 01:06:55 -0500
In-Reply-To: <1449667897-2450-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Andrew Bresticker <abrestic@chromium.org>, Mallikarjun Kasoju <mkasoju@nvidia.com>


On Wednesday 09 December 2015 07:01 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Andrew Bresticker <abrestic@chromium.org>
> Cc: Mallikarjun Kasoju <mkasoju@nvidia.com>
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
