From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/6] pinctrl: sunxi: Deal with configless pins
Date: Sat, 29 Oct 2016 11:08:53 +0200
Message-ID: <CACRpkdabSP47+OA5bVwYhqMBvqKGxxG8=Vk94KcdAmkqjsi2pA@mail.gmail.com>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
 <ae812275bfb0f0ded2a73b571bfcecffcd747126.1476971126.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:36218 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932186AbcJ2JIz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 05:08:55 -0400
Received: by mail-qk0-f169.google.com with SMTP id o68so113615962qkf.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2016 02:08:54 -0700 (PDT)
In-Reply-To: <ae812275bfb0f0ded2a73b571bfcecffcd747126.1476971126.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>

On Thu, Oct 20, 2016 at 3:49 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> Even though the our binding had the assumption that the allwinner,pull and
> allwinner,drive properties were optional, the code never took that into
> account.
>
> Fix that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Patch applied.

Yours,
Linus Walleij
