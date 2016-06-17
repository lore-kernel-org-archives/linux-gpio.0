From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2] gpio: make library immune to error pointers
Date: Fri, 17 Jun 2016 10:15:55 +0900
Message-ID: <0ae84216-3e0b-be52-8a5d-23dee2a8fcf3@nvidia.com>
References: <1466076157-9805-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:2268 "EHLO
	hkmmgate101.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753830AbcFQBQB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2016 21:16:01 -0400
In-Reply-To: <1466076157-9805-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: stable@vger.kernel.org

On 06/16/2016 08:22 PM, Linus Walleij wrote:
> Most functions that take a GPIO descriptor in need to check the
> descriptor for IS_ERR(). We do this mostly in the VALIDATE_DESC()
> macro except for the gpiod_to_irq() function which needs special
> handling.

More resilience sounds good to have.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
