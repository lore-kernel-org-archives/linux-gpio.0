From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 1/8] gpio: omap: convert omap_gpio_is_input() to use gpio
 offset
Date: Fri, 20 Mar 2015 09:42:58 -0700
Message-ID: <550C4E12.8070204@oracle.com>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org> <1426785944-17255-2-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:41929 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319AbbCTQne (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2015 12:43:34 -0400
In-Reply-To: <1426785944-17255-2-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@linaro.org, Javier Martinez Canillas <javier@dowhile0.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ssantosh@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/19/15 10:25 AM, grygorii.strashko@linaro.org wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Convert omap_gpio_is_input() to use GPIO offset instead of mask and,
> in such way, make code simpler and remove few lines of code.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
> ---

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
