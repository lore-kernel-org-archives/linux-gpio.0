From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: fix USB3 pin assignment for Pro4
Date: Mon, 31 Jul 2017 15:50:35 +0200
Message-ID: <CACRpkdY0UdiMxepc4+JYEPV5gLDFyVLPgJPdB_wrxT7eH7a8AQ@mail.gmail.com>
References: <1499324063-907-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:37610 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdGaNuj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:50:39 -0400
Received: by mail-io0-f182.google.com with SMTP id c74so111239568iod.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:50:39 -0700 (PDT)
In-Reply-To: <1499324063-907-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Thu, Jul 6, 2017 at 8:54 AM, Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> According to pinctrl assignment for Pro4, each definition of USB#2 and
> USB#3 are as follows.
>
>   184: USB2VBUS
>   185: USB2OD
>   186: USB2ID
>   187: USB3VBUS
>   188: USB3OD
>
> USB#2 has an additional pin "USB2ID", but the chip doesn't use this pin
> while in host-mode. Considering this pin, the pin definitions for USB#3
> should be {187, 188}.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied for fixes with Masahiro's ACK.

Yours,
Linus Walleij
