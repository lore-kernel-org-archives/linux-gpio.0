From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/7] gpio: xilinx: Make of_device_id array const
Date: Fri, 9 May 2014 11:03:42 +0200
Message-ID: <CACRpkdZ58d655X9iq4pupU=K2LuuW-YaHqFR6ubw=AbouWOSoA@mail.gmail.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
	<022c01cf69d3$e43d6b00$acb84100$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:56843 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbaEIJDn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 05:03:43 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so4494823oac.22
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 02:03:42 -0700 (PDT)
In-Reply-To: <022c01cf69d3$e43d6b00$acb84100$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>

On Wed, May 7, 2014 at 11:08 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied with Michal's Review tag.

Yours,
Linus Walleij
