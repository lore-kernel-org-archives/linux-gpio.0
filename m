From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/5] gpio/mockup: add virtual gpio device
Date: Mon, 26 Sep 2016 11:48:35 -0700
Message-ID: <CACRpkdaemve87TAt+=1yrunaLUtbFFcMQjoXoYPH7LRvkj5A-w@mail.gmail.com>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org> <20160831094548.12574-4-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36146 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161228AbcIZSsg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2016 14:48:36 -0400
Received: by mail-oi0-f54.google.com with SMTP id t83so218214138oie.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2016 11:48:36 -0700 (PDT)
In-Reply-To: <20160831094548.12574-4-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Kamlakant Patel <kamlakant.patel@broadcom.com>

On Wed, Aug 31, 2016 at 2:45 AM,  <bamvor.zhangjian@linaro.org> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> This patch add basic structure of a virtual gpio device(gpio-mockup)
> for testing gpio subsystem. The tester could manipulate such device
> through userspace(sysfs or char device) and check the result from
> debugfs.
>
> Currently, it support one or more gpiochip(determined by module
> parameters with base,ngpio pair). One could test the overlap of
> different gpiochip and test the direction and/or output values of
> these chips.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

This patch applied. It's a very simple, straight-forward driver that does
exactly what we want.

Yours,
Linus Walleij
