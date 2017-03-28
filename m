From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: meson-gxl: Fix inverted registers and add
 missing pins
Date: Tue, 28 Mar 2017 11:26:16 +0200
Message-ID: <CACRpkdbZanPxCGcgcrpGzOkMHvC27z_BPjXLgKAAHm_cdk+HTg@mail.gmail.com>
References: <20170323104112.16558-1-narmstrong@baylibre.com> <20170323104112.16558-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36123 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753702AbdC1J0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 05:26:48 -0400
Received: by mail-it0-f43.google.com with SMTP id e75so49496506itd.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 02:26:17 -0700 (PDT)
In-Reply-To: <20170323104112.16558-2-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 11:41 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> Fix some inverted bit numbers in some pinctrl groups and add missing pins
> and groups to be in pair with the GXBB pinctrl pins definition.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij
