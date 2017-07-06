From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: fix USB3 pin assignment for Pro4
Date: Thu, 6 Jul 2017 16:09:09 +0900
Message-ID: <CAK7LNARg7iNu=1ZvoxN9Mj+OvLTaMB4x0g4_qn5W8aNTPTa1FA@mail.gmail.com>
References: <1499324063-907-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24519 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752728AbdGFHJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jul 2017 03:09:32 -0400
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com [209.85.213.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v6679AZ7018497
        for <linux-gpio@vger.kernel.org>; Thu, 6 Jul 2017 16:09:11 +0900
Received: by mail-yb0-f172.google.com with SMTP id f194so3270731yba.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jul 2017 00:09:11 -0700 (PDT)
In-Reply-To: <1499324063-907-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

2017-07-06 15:54 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
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


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
