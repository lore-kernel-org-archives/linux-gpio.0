From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/2] pinctrl: meson-gxbb: add the missing SDIO interrupt pin
Date: Mon, 12 Sep 2016 11:07:46 -0700
Message-ID: <7hr38poutp.fsf@baylibre.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
        <20160911123903.20027-1-martin.blumenstingl@googlemail.com>
        <20160911123903.20027-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34935 "EHLO
        mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752958AbcILSHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 14:07:48 -0400
Received: by mail-pa0-f54.google.com with SMTP id b2so53035744pat.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 11:07:48 -0700 (PDT)
In-Reply-To: <20160911123903.20027-2-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Sun, 11 Sep 2016 14:39:02 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, carlo@caione.org, linux-arm-kernel@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds the SDIO interrupt pin which can be used by sd_emmc_a.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Fixes: 29885a656511 ("pinctrl: meson-gxbb: add the pins for the
> SDIO/sd_emmc_a controller")

Acked-by: Kevin Hilman <khilman@baylibre.com>
