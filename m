From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 12/54] gpio: msic: Be sure to clamp return value
Date: Wed, 23 Dec 2015 13:47:53 +0200
Message-ID: <567A89E9.8080308@linux.intel.com>
References: <1450793970-22801-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:31990 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934321AbbLWLm0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 06:42:26 -0500
In-Reply-To: <1450793970-22801-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On 22.12.2015 16:19, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

