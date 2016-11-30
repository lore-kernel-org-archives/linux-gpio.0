From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: New driver for TI DA850/OMAP-L138/AM18XX pinconf
Date: Wed, 30 Nov 2016 14:00:54 +0100
Message-ID: <CACRpkdYbBsUSN8f6-bmN-qkGciJOKVDn44P-e5FZaLWXm3azFg@mail.gmail.com>
References: <1480351226-3332-1-git-send-email-david@lechnology.com> <1480351226-3332-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:34864 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756592AbcK3NA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 08:00:56 -0500
Received: by mail-qk0-f171.google.com with SMTP id n204so208184218qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 05:00:55 -0800 (PST)
In-Reply-To: <1480351226-3332-3-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bgolaszewski@baylibre.com>

On Mon, Nov 28, 2016 at 5:40 PM, David Lechner <david@lechnology.com> wrote:

> This adds a new driver for pinconf on TI DA850/OMAP-L138/AM18XX. These
> SoCs have a separate controller for controlling pullup/pulldown groups.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Patch applied.

Yours,
Linus Walleij
