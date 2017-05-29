From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: meson-gxbb: Add missing GPIODV_18 pin entry
Date: Mon, 29 May 2017 10:55:53 +0200
Message-ID: <CACRpkdb8UWUM0_18t5QkH9vYcJpqr=3OQ8AVwFtg3Gq2ETyOKQ@mail.gmail.com>
References: <1495548559-22261-1-git-send-email-narmstrong@baylibre.com> <1495548559-22261-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:33087 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbdE2Izz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:55:55 -0400
Received: by mail-it0-f45.google.com with SMTP id w68so6864174itc.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:55:54 -0700 (PDT)
In-Reply-To: <1495548559-22261-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 23, 2017 at 4:09 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> GPIODV_18 entry was missing in the original driver push.
>
> Fixes: 468c234f9ed7 ("pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied with Jerome's review tag.

Yours,
Linus Walleij
