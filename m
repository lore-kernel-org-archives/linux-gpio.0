From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: altera: Fix altr,interrupt-type property
Date: Wed, 9 Mar 2016 09:48:37 +0700
Message-ID: <CACRpkdZkiF=wU0jm3Btpxp_A_kG55mcdgE1g_o8h9fBV2uEVjQ@mail.gmail.com>
References: <1456762997-7607-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35946 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbcCICsi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 21:48:38 -0500
Received: by mail-ob0-f176.google.com with SMTP id m7so33760058obh.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 18:48:37 -0800 (PST)
In-Reply-To: <1456762997-7607-1-git-send-email-marex@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tien Hock Loh <thloh@altera.com>

On Mon, Feb 29, 2016 at 11:23 PM, Marek Vasut <marex@denx.de> wrote:

> The altr,interrupt-trigger property is not used by the driver.
> Instead, altr,interrupt-type is used by the driver and the driver
> does not probe if this property is not specified. Therefore, it
> is expected that there are no users of the -trigger property in
> the wild and that this is a typo in the documentation for the
> altera-pio controller. This patch fixes the typo.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Tien Hock Loh <thloh@altera.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

Yours,
Linus Walleij
