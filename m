From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] gpio: introduce GPIO_DAVINCI kconfig option
Date: Sun, 15 Dec 2013 17:34:29 +0530
Message-ID: <52AD9ACD.7010507@ti.com>
References: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com>	<1385048076-7875-3-git-send-email-grygorii.strashko@ti.com> <CACRpkdbrtyBgMiQ-+J9O5JdfBo8vZLL1rY9F7p1X_rWbr54Qzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38658 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753984Ab3LOMFf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 15 Dec 2013 07:05:35 -0500
In-Reply-To: <CACRpkdbrtyBgMiQ-+J9O5JdfBo8vZLL1rY9F7p1X_rWbr54Qzg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday 29 November 2013 02:05 PM, Linus Walleij wrote:
> On Thu, Nov 21, 2013 at 4:34 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> The compatible to Davinci GPIO HW block is used by other TI SoCs, like
>> Keystone, where GPIO support is declared as optional.
>>
>> Hence, introduce GPIO_DAVINCI Kconfig option which will allow to enable
>> Davinci GPIO driver for Keystone SoCs when needed. At same time, kept
>> Davinci GPIO driver enabled for Davinci SoCs by default.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Sekhar, same comment here.

Queuing this with your's, Santosh's and Prabhakar's acks.

Thanks,
Sekhar
