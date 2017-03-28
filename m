From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Tue, 28 Mar 2017 11:17:40 +0200
Message-ID: <CACRpkdZpKoBF1b8OwVWfFm9cMX06TjAv9m4Ra5Xp0vy4GzJJGA@mail.gmail.com>
References: <20170323105931.10455-1-john@metanate.com> <20170323105931.10455-3-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:33881 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754738AbdC1JRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 05:17:42 -0400
Received: by mail-it0-f54.google.com with SMTP id y18so25450280itc.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 02:17:41 -0700 (PDT)
In-Reply-To: <20170323105931.10455-3-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 11:59 AM, John Keeping <john@metanate.com> wrote:

> This lock is used from rockchip_irq_set_type() which is part of the
> irq_chip implementation and thus must use raw_spinlock_t as documented
> in Documentation/gpio/driver.txt.
>
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v3: unchanged
> v2: unchanged

Patch applied.

Yours,
Linus Walleij
