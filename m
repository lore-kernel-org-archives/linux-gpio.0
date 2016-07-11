From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: add Ethernet pin-mux settings
Date: Mon, 11 Jul 2016 09:54:05 +0200
Message-ID: <CACRpkdaSLbPRwCuZiUaM5E9WUtQtCjDrtjfXWh-tqQ6Ne2od0w@mail.gmail.com>
References: <1467817932-7034-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33680 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753208AbcGKHyG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 03:54:06 -0400
Received: by mail-oi0-f54.google.com with SMTP id u201so136633213oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 00:54:06 -0700 (PDT)
In-Reply-To: <1467817932-7034-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 6, 2016 at 5:12 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add the following Ethernet interfaces:
>
>   PH1-LD4: MII, RMII
>   PH1-Pro4: MII, RMII, RGMII
>   PH1-sLD8: MII, RMII (Built-in PHY is also supported)
>   ProXstream2: MII, RMII, RGMII
>   PH1-LD6b: RMII, RGMII
>   PH1-LD11: RMII (Built-in PHY is also supported)
>   PH1-LD20: RMII, RGMII
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
