From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: moxart: add missing .owner to struct gpio_chip
Date: Tue, 10 Dec 2013 12:35:29 +0100
Message-ID: <CACRpkdZtc9gCxKX9jNxfGi7FGa+nnOGrFeJqi34YvJwPGJoU7Q@mail.gmail.com>
References: <CAPgLHd_rm=YN7OU9X8STWGa-0KaM7LhOFObwbAbsXZGRNsXVWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:54649 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147Ab3LJLf3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 06:35:29 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so5182215obc.16
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2013 03:35:29 -0800 (PST)
In-Reply-To: <CAPgLHd_rm=YN7OU9X8STWGa-0KaM7LhOFObwbAbsXZGRNsXVWQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 4, 2013 at 1:38 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Add missing .owner of struct gpio_chip. This prevents the
> module from being removed from underneath its users.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Same comments as the other patch, rebase include Jonas.

Yours,
Linus Walleij
