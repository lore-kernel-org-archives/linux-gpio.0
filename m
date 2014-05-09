From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] gpio: tegra: Make of_device_id array const
Date: Fri, 9 May 2014 11:02:32 +0200
Message-ID: <CACRpkdYZzhsvS2L-D5Ux6EXSt0gxkgd2JGG8PrU3H3JxhBgsNQ@mail.gmail.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
	<022b01cf69d3$cd65f1e0$6831d5a0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:41984 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbaEIJCd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 05:02:33 -0400
Received: by mail-ob0-f178.google.com with SMTP id va2so4462985obc.23
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 02:02:32 -0700 (PDT)
In-Reply-To: <022b01cf69d3$cd65f1e0$6831d5a0$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

On Wed, May 7, 2014 at 11:07 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
