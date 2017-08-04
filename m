From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH] pinctrl: sunxi: fix V3s pinctrl driver IRQ
 bank base
Date: Fri, 4 Aug 2017 10:23:59 +0800
Message-ID: <CAGb2v64BBJrr+yo-7n1DkZjYvdB2ws+0OHD_Dwt_MCS85-U19Q@mail.gmail.com>
References: <20170801145416.61854-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:36010 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751891AbdHDCYX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 22:24:23 -0400
In-Reply-To: <20170801145416.61854-1-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, stable@vger.kernel.org

On Tue, Aug 1, 2017 at 10:54 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The V3s pin controller doesn't have the bank 0 (starts at address
> 0x200), which is like A33. However, this is not workarounded when

                                           was not worked around

"Work around" is a verb phrase. "Workaround" is a noun.

> developing the driver, which makes IRQ not working.

                               broke the IRQs.

>
> Fix the IRQ bank base.
>
> Fixes: 56d9e4a76039 ("pinctrl: sunxi: add driver for V3s SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Confirmed this is the same thing we saw on A33.
The fix is the same.

Apart from the typo / grammar errors above,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
