From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rockchip: add irq_enable & irq_disable ops
Date: Thu, 23 Mar 2017 10:05:39 +0100
Message-ID: <CACRpkdam_qAi3CB5ZZubc3CdJkBH2pOGja2m166Gtj5ikF+CzA@mail.gmail.com>
References: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35452 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbdCWJFm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:05:42 -0400
Received: by mail-it0-f47.google.com with SMTP id y18so36500132itc.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:05:41 -0700 (PDT)
In-Reply-To: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@google.com>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Mar 2, 2017 at 6:56 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:

> Currently we are trying to enable/disable the clk of irq's gpio bank when
> unmask/mask irq. But the kernel's "lazy disable approach" will skip masking
> irq when the irq chip doesn't support irq_disable ops.
>
> So we may hit this case:
>         irq_enable-> enable clk
>         irq_disable-> noop
>         irq_enable-> enable clk again
>         irq_disable-> noop
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
