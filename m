From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: remove pointless pin-mux settings for PH1-LD11
Date: Mon, 4 Jul 2016 11:48:22 +0200
Message-ID: <CACRpkdYzOwSKFdcVEc2wbFxAec_pHgR_CKvRUHbLN7Pu-mRWKw@mail.gmail.com>
References: <1467190633-19990-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35047 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753079AbcGDJsY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 05:48:24 -0400
Received: by mail-oi0-f43.google.com with SMTP id r2so188391700oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 02:48:23 -0700 (PDT)
In-Reply-To: <1467190633-19990-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 29, 2016 at 10:57 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This SoC has no SD card controller.  Nor does it have USB port3.
> These pin-mux settings have no point.
>
> Fixes: 70f2f9c4cf25 ("pinctrl: uniphier: add UniPhier PH1-LD11 pinctrl driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
