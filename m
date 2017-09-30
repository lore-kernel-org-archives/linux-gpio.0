From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/8] pinctrl: meson: clean pin offsets
Date: Sat, 30 Sep 2017 22:35:25 +0200
Message-ID: <7hk20fexgy.fsf@baylibre.com>
References: <20170920133927.17390-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:43260 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751202AbdI3Uf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Sep 2017 16:35:28 -0400
Received: by mail-wr0-f173.google.com with SMTP id a43so1594162wrc.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Sep 2017 13:35:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Jerome Brunet <jbrunet@baylibre.com> writes:

> The initial goal of this series was move to TEST_N pin from the EE
> controller to AO controller, where it belongs. This meant modify the
> EE_OFF value.
>
> This offset is a quirk we brought from the vendor driver when it was
> initially merged. There no reason to keep this around and we could simply
> let pinctrl figure the pin base value.
>
> Removing this offset, while simple, ends up being quite a patch bomb.
> This is why I split the change over 5 first patches, so the important
> change, patch #1 remains visible. Of course, to avoid breaking bisect,
> these first 5 patches should be squashed into one. (If you prefer that I
> squash it myself, I may have to send you a PR as the patch would exceed
> VGER 100000 characters limit)
>
> The last change is this series, while not directly related, also requires
> to adjust the gpio-line-names property in DT. Having these changes going
> together would make it easier to coordinate the DTS changes.
>
> This was changeset has been test on gxbb P200, gxl libretech-cc.  It was
> also boot tested on meson8 (Thx Martin!)

Really nice cleanup, thanks!

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
