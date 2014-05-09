From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/7] gpio: mvebu: Make of_device_id array const
Date: Fri, 9 May 2014 11:01:02 +0200
Message-ID: <CACRpkdZ0_kgF2ErA273BO569Nxk+Zn5WQoKEmU_j1vJLuf9c+Q@mail.gmail.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
	<022901cf69d3$95828a90$c0879fb0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:37569 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756267AbaEIJBE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 05:01:04 -0400
Received: by mail-oa0-f44.google.com with SMTP id i11so4569722oag.31
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 02:01:03 -0700 (PDT)
In-Reply-To: <022901cf69d3$95828a90$c0879fb0$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Wed, May 7, 2014 at 11:06 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
