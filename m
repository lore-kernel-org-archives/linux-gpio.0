From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: rcar: Add r8a77995 (R-Car D3) support
Date: Thu, 9 Nov 2017 13:54:28 +0100
Message-ID: <CACRpkdYhzbRTyjax_A0mF9CW27i26g8OrSZYyepL7zSNgYRLcA@mail.gmail.com>
References: <1510223960-14139-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:51892 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754561AbdKIMya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2017 07:54:30 -0500
Received: by mail-it0-f68.google.com with SMTP id o135so10621444itb.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Nov 2017 04:54:29 -0800 (PST)
In-Reply-To: <1510223960-14139-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Nov 9, 2017 at 11:39 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> This patch adds binding for r8a77995 (R-Car D3). This SoC can use
> "renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
> doesn't modify the gpio-rcar driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Linus: it seems this one fell through the cracks, as the later
> f76a2d9d7f9524c5 ("gpio-rcar: document R8A77970 bindings") did get
> applied.
>
> Thx!
>
> v2:
>   - Add Acked-by, rebased.

Oopsie. Maybe my oversight.

Patch applied!

Yours,
Linus Walleij
