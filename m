From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/7] gpio: mcp23s08: Make of_device_id array const
Date: Fri, 9 May 2014 10:59:48 +0200
Message-ID: <CACRpkdafFpaEUEvsj0bMuJaqgwV7mNEmHvU6MBQDG9wnwPSKbQ@mail.gmail.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
	<022801cf69d3$774c9fc0$65e5df40$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:60419 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754078AbaEII7t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 04:59:49 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so4534225oag.13
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 01:59:49 -0700 (PDT)
In-Reply-To: <022801cf69d3$774c9fc0$65e5df40$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, May 7, 2014 at 11:05 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
