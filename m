From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: davinci: Handle return value of clk_prepare_enable
Date: Mon, 29 May 2017 10:39:33 +0200
Message-ID: <CACRpkdZym6wTQJtueUG_CjzjUGvXGXPRpNbw3pBRmEYL5Ga2YQ@mail.gmail.com>
References: <1fe4ff39a277a29c8a1c72cfd333f49419fb1a3b.1495530935.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:35987 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbdE2Ijf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:39:35 -0400
Received: by mail-it0-f51.google.com with SMTP id o5so23675711ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:39:35 -0700 (PDT)
In-Reply-To: <1fe4ff39a277a29c8a1c72cfd333f49419fb1a3b.1495530935.git.arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 23, 2017 at 11:18 AM, Arvind Yadav
<arvind.yadav.cs@gmail.com> wrote:

> clk_prepare_enable() can fail here and we must check its return value.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Patch applied.

Normally we use goto's for the errorpath but in this case I see the
goto is used for positive exit in this driver so this solution is less
messy than adding another goto path.

Yours,
Linus Walleij
