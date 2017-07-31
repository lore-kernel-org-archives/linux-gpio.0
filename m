From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] pinctrl: sunxi: add a missing function of A10/A20
 pinctrl driver
Date: Mon, 31 Jul 2017 15:53:31 +0200
Message-ID: <CACRpkdbeu=NbWWiJvFHrHYe=4U5M16PNspTZ7S1-9_3v7+tV=A@mail.gmail.com>
References: <20170722025054.32645-1-icenowy@aosc.io> <20170722025054.32645-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:37342 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdGaNxc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:53:32 -0400
Received: by mail-io0-f178.google.com with SMTP id c74so111271582iod.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:53:32 -0700 (PDT)
In-Reply-To: <20170722025054.32645-2-icenowy@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Sat, Jul 22, 2017 at 4:50 AM, Icenowy Zheng <icenowy@aosc.io> wrote:

> The PH16 pin has a function with mux id 0x5, which is the DET pin of the
> "sim" (smart card reader) IP block.
>
> This function is missing in old versions of A10/A20 SoCs' datasheets and
> user manuals, so it's also missing in the old drivers. The newest A10
> Datasheet V1.70 and A20 Datasheet V1.41 contain this pin function, and
> it's discovered during implementing R40 pinctrl driver.
>
> Add it to the driver. As we now merged A20 pinctrl driver to the A10
> one, we need to only fix the A10 driver now.
>
> Fixes: f2821b1ca3a2 ("pinctrl: sunxi: Move Allwinner A10 pinctrl
> driver to a driver of its own")
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes in v3:

Patch applied for fixes.

Yours,
Linus Walleij
