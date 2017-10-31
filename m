From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rockchip: Add iomux-route switching support for rk3288
Date: Tue, 31 Oct 2017 10:14:22 +0100
Message-ID: <CACRpkdazu_ESJNZQJe-LEMn51mLFmrO33Y7RNjF0i_Pp=67-nw@mail.gmail.com>
References: <20171021085310.16246-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:50809 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751402AbdJaJOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 05:14:23 -0400
Received: by mail-io0-f196.google.com with SMTP id 97so33471945iok.7
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 02:14:23 -0700 (PDT)
In-Reply-To: <20171021085310.16246-1-heiko@sntech.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>

On Sat, Oct 21, 2017 at 10:53 AM, Heiko Stuebner <heiko@sntech.de> wrote:

> The rk3288 also has one function that can be routed to one of two pins,
> the hdmi cec functionality can use either gpio7c0 or gpio7c7.
> So add the route switching support for it.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Hans Verkuil <hans.verkuil@cisco.com>

Patch applied with David's review tag.

Yours,
Linus Walleij
