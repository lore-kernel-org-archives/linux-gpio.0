From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: Use common interface for recalced iomux
Date: Thu, 3 Aug 2017 09:30:39 +0200
Message-ID: <CACRpkdYsHCqMob9JbmwwMu7uZygBt4yA3wtQe_cc6XJYbuBG-Q@mail.gmail.com>
References: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com> <1500618435-15092-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34832 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751194AbdHCHal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 03:30:41 -0400
Received: by mail-oi0-f48.google.com with SMTP id e124so5352452oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 00:30:41 -0700 (PDT)
In-Reply-To: <1500618435-15092-2-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 21, 2017 at 8:27 AM, David Wu <david.wu@rock-chips.com> wrote:

> The other Socs also need the feature of recalced iomux, so
> make it as a common interface like iomux route feature.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
