From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Wed, 22 Feb 2017 16:03:43 +0100
Message-ID: <CACRpkdawSW6TGtV-zSQdArJ4Z5sBjt6-ZiW3Xxf3KdmC6LL3XA@mail.gmail.com>
References: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com> <1486722229-5451-4-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:36489 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932684AbdBVPDp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:03:45 -0500
Received: by mail-io0-f171.google.com with SMTP id j13so3569730iod.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:03:44 -0800 (PST)
In-Reply-To: <1486722229-5451-4-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 10, 2017 at 11:23 AM, David Wu <david.wu@rock-chips.com> wrote:

> From: "david.wu" <david.wu@rock-chips.com>
>
> Note, the iomux of following pins are special, need to
> be recalculated specially.
>  - gpio2_b4
>  - gpio2_b7
>  - gpio2_c7
>
> Signed-off-by: david.wu <david.wu@rock-chips.com>
> ---
> change in v2:
>  - only 3 pins need to be recalculated

Patch applied for v4.12.

Yours,
Linus Walleij
