From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: bcm-kona: add missing .owner to struct gpio_chip
Date: Wed, 30 Oct 2013 11:23:28 -0700
Message-ID: <CACRpkdYPB5aSLSYpRvBqe3qQSayHawPs0tUwCjO7zj46sBuwwQ@mail.gmail.com>
References: <CAPgLHd99TN_wZ50T3KwbxsqHK7TmcM7JoD_6GcNu_6dpXGghcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:37773 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751574Ab3J3SX2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 14:23:28 -0400
Received: by mail-oa0-f49.google.com with SMTP id j10so1862548oah.8
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 11:23:28 -0700 (PDT)
In-Reply-To: <CAPgLHd99TN_wZ50T3KwbxsqHK7TmcM7JoD_6GcNu_6dpXGghcQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 28, 2013 at 8:49 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Add missing .owner of struct gpio_chip. This prevents the
> module from being removed from underneath its users.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
