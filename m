From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio/pinctrl: make gpio_chip members typed boolean
Date: Thu, 5 Dec 2013 10:21:16 +0900
Message-ID: <529FD50C.8050002@nvidia.com>
References: <1386164723-31773-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2256 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753824Ab3LEBVU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 20:21:20 -0500
In-Reply-To: <1386164723-31773-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 12/04/2013 10:45 PM, Linus Walleij wrote:
> This switches the two members of struct gpio_chip that were
> defined as unsigned foo:1 to bool, because that is indeed what
> they are. Switch all users in the gpio and pinctrl subsystems
> to assign these values with true/false instead of 0/1. The
> users outside these subsystems will survive since true/false
> is 1/0, atleast we set some kind of more strict typing example.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

