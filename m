From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: single: use of_device_get_match_data() to get
 soc data
Date: Mon, 29 May 2017 10:19:26 +0200
Message-ID: <CACRpkdaM_p7QUq8afD03tCkWExZn9y8MXP5BDPXbV_atofTvsg@mail.gmail.com>
References: <1495296137-6461-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38786 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbdE2IT2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:19:28 -0400
Received: by mail-it0-f52.google.com with SMTP id r63so23356015itc.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:19:28 -0700 (PDT)
In-Reply-To: <1495296137-6461-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@linaro.org>

On Sat, May 20, 2017 at 6:02 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Use of_device_get_match_data() instead of of_match_device().
> It allows us to remove the forward declaration of pcs_of_match.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
