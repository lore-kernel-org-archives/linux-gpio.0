From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: msm: Staticize local variable 'msm_gpio'
Date: Fri, 16 Aug 2013 16:47:53 +0200
Message-ID: <CACRpkdak0MjAP=omZz1krJZdO-DtuAXq_YWM=mweH6bmU90X4g@mail.gmail.com>
References: <000301ce9289$61df6bd0$259e4370$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:40209 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791Ab3HPOry (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 10:47:54 -0400
Received: by mail-oa0-f46.google.com with SMTP id l10so2349884oag.33
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 07:47:53 -0700 (PDT)
In-Reply-To: <000301ce9289$61df6bd0$259e4370$@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rohit Vaswani <rvaswani@codeaurora.org>

On Tue, Aug 6, 2013 at 11:43 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> The local variable 'msm_gpio' is used only in this file.
> Fix the following sparse warning:
>
> drivers/gpio/gpio-msm-v2.c:109:21: warning: symbol 'msm_gpio' was not declared. Should it be static?
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
