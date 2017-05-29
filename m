From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: meson-gxl: Fix typo in AO SPDIF pins
Date: Mon, 29 May 2017 10:58:14 +0200
Message-ID: <CACRpkdZUr_swQx9oUrxQRHk+bFvdux1TgumQEmtiVg69T5XjaQ@mail.gmail.com>
References: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com> <1495614042-2676-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35553 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdE2I6Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:58:16 -0400
Received: by mail-io0-f172.google.com with SMTP id f102so37738619ioi.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:58:16 -0700 (PDT)
In-Reply-To: <1495614042-2676-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>

On Wed, May 24, 2017 at 10:20 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> The AO SPDIF pins were incorrectly defined with the EE pin offset.
>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: b840d649f9ec ("pinctrl: meson: gxl: add spdif output pins")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied with Jerome's review tag.

Yours,
Linus Walleij
