From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Thu, 23 Mar 2017 10:03:44 +0100
Message-ID: <CACRpkda7oaXXdXkToE+5V0XhbFx3gV4p5Jp-mJm-ZvG5WN2fWw@mail.gmail.com>
References: <20170315174654.15128-1-john@metanate.com> <20170315174654.15128-2-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:34896 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752174AbdCWJDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:03:46 -0400
Received: by mail-it0-f45.google.com with SMTP id y18so36477475itc.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:03:45 -0700 (PDT)
In-Reply-To: <20170315174654.15128-2-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 15, 2017 at 6:46 PM, John Keeping <john@metanate.com> wrote:

> regmap_update_bits does its own locking and everything else accessed
> here is a local variable so there is no need to lock around it.
>
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v2:
> - Also remove locking in rockchip_set_schmitt()

This does not apply on my "devel" branch in the pinctrl tree.

Please rebase on that and resend.

Since I have no patches for rockchip so far I suspect this
is not even based on v4.11-rc1 so pls forward-port.

Yours,
Linus Walleij
