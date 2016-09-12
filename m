From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: mxc: add generic gpio request/free callbacks
 to pinctrl
Date: Mon, 12 Sep 2016 14:29:37 +0200
Message-ID: <CACRpkdYL4PR1AYGhuT7rLZv3xepk1pqJ=Gg4MhUU+CPsCaJvMA@mail.gmail.com>
References: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com> <1473299296-22458-4-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37605 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754615AbcILM3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:29:38 -0400
Received: by mail-it0-f51.google.com with SMTP id 186so9265666itf.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:29:38 -0700 (PDT)
In-Reply-To: <1473299296-22458-4-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Sep 8, 2016 at 3:48 AM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> If a GPIO controller description in board DTB contains information
> about mappings between GPIOs and pads under IOMUX control use it to
> request and free GPIOs with respect to pinctrl/pinmux subsystems.
>
> One of immediate positive functional changes is inability to
> request non-existing GPIOs, i.e. if there is no pad such. Also
> pinctrl/pinmux may now properly account pads occupied by requested
> GPIOs.
>
> The change has no effect, if "gpio-ranges" property is not found
> including the case if a board has no DTB firmware.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
> Changes from v1 to v2:
> * none

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
