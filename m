From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: meson8b: rename the NAND DQS pin definitions
Date: Mon, 03 Apr 2017 09:08:45 -0700
Message-ID: <m28tnha2ya.fsf@baylibre.com>
References: <20170325184350.7677-1-martin.blumenstingl@googlemail.com>
        <20170401135922.1288-1-martin.blumenstingl@googlemail.com>
        <20170401135922.1288-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:35907 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbdDCQIs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2017 12:08:48 -0400
Received: by mail-pg0-f54.google.com with SMTP id g2so123232600pge.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2017 09:08:47 -0700 (PDT)
In-Reply-To: <20170401135922.1288-3-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Sat, 1 Apr 2017 15:59:22 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, carlo@caione.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The NAND DQS pins are currently named nand_dqs_0 and nand_dqs_1.
> However, they both seem to have the same function, just exposed on
> different pins (unlike the ethernet TX pins for example, where there's
> eth_txd0..3 - all of these can be active at the same time as they are
> different data lines).
> Rename the NAND DQS pins to nand_dqs_15 and nand_dqs_18 to reflect that
> it's the same functionality just exposed on different pins (BOOT_15 and
> BOOT_18).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Since we don't yet have any users of these pins, LGTM.

Acked-by: Kevin Hilman <khilman@baylibre.com>

