From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Mon, 7 Aug 2017 11:05:56 +0200
Message-ID: <CACRpkdbLTr+zcwXaanr2HJHp=e-AauDx_hZ=dd4zjmAKsRdOtQ@mail.gmail.com>
References: <20170729180744.873303067@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36785 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbdHGJF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:05:58 -0400
Received: by mail-io0-f181.google.com with SMTP id g35so650055ioi.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:05:58 -0700 (PDT)
In-Reply-To: <20170729180744.873303067@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Jul 29, 2017 at 8:07 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> of_irq_to_resource() has recently been fixed to return negative error #'s
> along with 0 in case of failure, however the ST driver still only regards
> 0 as failure indication -- fix it up.
>
> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied.

Yours,
Linus Walleij
