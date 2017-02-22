From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: rockchip: Add mux recalculation support
Date: Wed, 22 Feb 2017 16:02:09 +0100
Message-ID: <CACRpkdZ0ixTixuBXOXjJjkVg7SKXKm2xzbfa1A_bU3DDNXPjtw@mail.gmail.com>
References: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com> <1486722229-5451-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:35192 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932797AbdBVPCL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:02:11 -0500
Received: by mail-it0-f48.google.com with SMTP id 203so139793024ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:02:11 -0800 (PST)
In-Reply-To: <1486722229-5451-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 10, 2017 at 11:23 AM, David Wu <david.wu@rock-chips.com> wrote:

> From: "david.wu" <david.wu@rock-chips.com>
>
> Some pins are special at a bank so that add
> IOMUX_RECALCED type to indicate which iomux source
> of the bank need to be recalculated. If the mux
> recalculateed callback and IOMUX_RECALCED type
> were set, recalculate the pins' iomux by using
> mux recalculated data struct.
>
> Signed-off-by: david.wu <david.wu@rock-chips.com>
> ---
> change in v2:
>  - reorder the entries of the recalced data struct

Patch applied.

Yours,
Linus Walleij
