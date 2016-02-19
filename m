From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 10:47:45 +0100
Message-ID: <CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<20160217205445.GA2394@deathstar>
	<CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
	<20160219094620.GA28750@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33912 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1427368AbcBSJrq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 04:47:46 -0500
Received: by mail-oi0-f47.google.com with SMTP id m82so8583861oif.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 01:47:45 -0800 (PST)
In-Reply-To: <20160219094620.GA28750@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>, Jonathan Cameron <jic23@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 10:46 AM, Michael Welling <mwelling@ieee.org> wrote:

> I am looking forward to see how the GPIOs will be modified from userspace.
> The fact that single controllers can host hundreds of GPIOs is going to
> make it an interesting problem.
>
> Do you have a sketch of how the accesses with be performed?
> ioctl, read, write.

No. Suggestions welcome. Looking at drivers/iio for inspiration.

Yours,
Linus Walleij
