From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: fix V3s pinctrl driver IRQ bank base
Date: Mon, 7 Aug 2017 15:09:31 +0200
Message-ID: <CACRpkdYJX6SX5NjLMopoD7nKkmhseBMMTei-FoxzXwRnNDUaFg@mail.gmail.com>
References: <20170801145416.61854-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:34278 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbdHGNJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 09:09:33 -0400
Received: by mail-it0-f52.google.com with SMTP id m34so16073768iti.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 06:09:33 -0700 (PDT)
In-Reply-To: <20170801145416.61854-1-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, stable <stable@vger.kernel.org>

On Tue, Aug 1, 2017 at 4:54 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> The V3s pin controller doesn't have the bank 0 (starts at address
> 0x200), which is like A33. However, this is not workarounded when
> developing the driver, which makes IRQ not working.
>
> Fix the IRQ bank base.
>
> Fixes: 56d9e4a76039 ("pinctrl: sunxi: add driver for V3s SoC")
> Cc: stable@vger.kernel.org

This patch only applies on the devel branch so I don't see why it is tagged
for stable.

> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Patch applied.

Yours,
Linus Walleij
