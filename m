From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 13/17] gpio: SPEAr: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 14:17:50 +0530
Message-ID: <CAKohpo=-ijAYUxBon988BnZZHMgyyCNLJEvEqHr-cRKByYG6Tg@mail.gmail.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
	<003e01cf6387$047d77a0$0d7866e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:52965 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756555AbaD2Iru (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:47:50 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo20so8555271obc.17
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2014 01:47:50 -0700 (PDT)
In-Reply-To: <003e01cf6387$047d77a0$0d7866e0$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Shiraz Hashim <shiraz.linux.kernel@gmail.com>

On 29 April 2014 14:12, Jingoo Han <jg1.han@samsung.com> wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/gpio/gpio-spear-spics.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
