From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH v2 2/2] pinctrl: sunxi: add support of R40
 to A10 pinctrl driver
Date: Tue, 18 Jul 2017 17:08:57 +0800
Message-ID: <CAGb2v66CGHgTU-9eBFQ=tOF12KqQDbO1JW1NUtn=OM=CMpyTTQ@mail.gmail.com>
References: <20170718074254.20732-1-icenowy@aosc.io> <20170718074254.20732-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:43096 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751334AbdGRJJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jul 2017 05:09:22 -0400
In-Reply-To: <20170718074254.20732-3-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Tue, Jul 18, 2017 at 3:42 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> R40 is said to be an upgrade of A20, and its pin configuration is also
> similar to A20 (and thus similar to A10).
>
> Add support for R40 to the A10 pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
