From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] ARM64: dts: meson-gxl: Add missing pinctrl pins groups
Date: Wed, 15 Mar 2017 10:44:53 +0100
Message-ID: <CACRpkdbdBHkCg_ZK2YAL6LmMxPMHt1iWcjgJkcwCoCgR-h0LKg@mail.gmail.com>
References: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com> <1488893462-7016-4-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:35905 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752605AbdCOJoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:44:55 -0400
Received: by mail-io0-f181.google.com with SMTP id l7so16330575ioe.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:44:55 -0700 (PDT)
In-Reply-To: <1488893462-7016-4-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Mar 7, 2017 at 2:31 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add pinctrl pins nodes following the additions of missing pins in the pinctrl
> driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through ARM SoC or wherever meson dts files
go.

Yours,
Linus Walleij
