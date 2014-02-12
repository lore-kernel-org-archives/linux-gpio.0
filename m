From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio: pl061: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 13:25:33 +0900
Message-ID: <CAAVeFu+vLDeccfYjfbedo-xx0T-O7=fKAs5oYjkjhOxzc1Yc2g@mail.gmail.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com> <000101cf279d$acf1f300$06d5d900$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f54.google.com ([209.85.212.54]:46156 "EHLO
	mail-vb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbaBLEZy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2014 23:25:54 -0500
Received: by mail-vb0-f54.google.com with SMTP id w20so6782795vbb.27
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2014 20:25:53 -0800 (PST)
In-Reply-To: <000101cf279d$acf1f300$06d5d900$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Haojian Zhuang <haojian.zhuang@linaro.org>

On Wed, Feb 12, 2014 at 11:53 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> Use devm_ioremap_resource() in order to make the code simpler.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
