From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/4] pinctrl: rockchip: split out verification of mux settings
Date: Tue, 28 Mar 2017 11:18:31 +0200
Message-ID: <CACRpkda27uiDc_E-4Vkq8iT4FG0hXbirAjOva3w9YhacYJ8nvQ@mail.gmail.com>
References: <20170323105931.10455-1-john@metanate.com> <20170323105931.10455-4-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:34992 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754833AbdC1JSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 05:18:47 -0400
Received: by mail-it0-f42.google.com with SMTP id y18so105102781itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 02:18:32 -0700 (PDT)
In-Reply-To: <20170323105931.10455-4-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 11:59 AM, John Keeping <john@metanate.com> wrote:

> We need to avoid calling regmap functions from irq handlers, so the next
> commit is going to move the call to rockchip_set_mux() into an
> irq_bus_sync_unlock handler.  But we can't return an error from there so
> we still need to check the settings from rockchip_irq_set_type() and we
> will use this new rockchip_verify_mux() function from there.
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
