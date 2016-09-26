From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] gpio: max77620: Remove unused fields from struct max77620_gpio
Date: Mon, 26 Sep 2016 18:13:27 +0530
Message-ID: <57E917EF.80901@nvidia.com>
References: <1474807444-6841-1-git-send-email-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6167 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161042AbcIZM53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2016 08:57:29 -0400
In-Reply-To: <1474807444-6841-1-git-send-email-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Venkat Reddy Talla <vreddytalla@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org


On Sunday 25 September 2016 06:14 PM, Axel Lin wrote:
> Current code does not use gpio_irq/irq_base/gpio_base fields from
> struct max77620_gpio, so remove them.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
