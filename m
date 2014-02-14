From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: [PATCH 1/2] gpio/omap: Use devm_ioremap_resource()
Date: Fri, 14 Feb 2014 13:34:08 -0800
Message-ID: <52FE8BD0.4000307@deeprootsystems.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:35491 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752031AbaBNVeL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 16:34:11 -0500
Received: by mail-pb0-f42.google.com with SMTP id jt11so12856756pbb.15
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 13:34:10 -0800 (PST)
In-Reply-To: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Santosh Shilimkar' <santosh.shilimkar@ti.com>

On 02/11/2014 06:51 PM, Jingoo Han wrote:
> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because the value is checked by devm_ioremap_resource().
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Nice cleanup.

Acked-by: Kevin Hilman <khilman@linaro.org>
