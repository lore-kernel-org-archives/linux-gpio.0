From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: rockchip: Add 3bit width mux support
Date: Wed, 22 Feb 2017 16:00:46 +0100
Message-ID: <CACRpkda=0fzZ8ZajnfiVU0Xu51gLqQvmjEZNjDKb+xTR=Xshiw@mail.gmail.com>
References: <1486722229-5451-1-git-send-email-david.wu@rock-chips.com> <1486722229-5451-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35795 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932871AbdBVPAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:00:52 -0500
Received: by mail-io0-f177.google.com with SMTP id j18so3508704ioe.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:00:52 -0800 (PST)
In-Reply-To: <1486722229-5451-2-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 10, 2017 at 11:23 AM, David Wu <david.wu@rock-chips.com> wrote:

> From: "david.wu" <david.wu@rock-chips.com>
>
> This patch supports 3bit width iomux type.
>
> Signed-off-by: david.wu <david.wu@rock-chips.com>
> ---
> change in v2:
>  - add the "% 8" in the 3bit width iomux calculating

Patch applied for v4.12 with Heiko's review tag.

Will appear in my tree after the merge window.

Same applies to any other patch I apply now except fixes.

Yours,
Linus Walleij
