From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zte: fix group_desc initialization
Date: Mon, 29 May 2017 10:17:59 +0200
Message-ID: <CACRpkdaROhkVtqZSgoVPyL8A7K5CR=9+1mq1uP-EnNZdQfdJGw@mail.gmail.com>
References: <1495461575-29488-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:35837 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751099AbdE2ISB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 04:18:01 -0400
Received: by mail-it0-f44.google.com with SMTP id c15so23441477ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 01:18:01 -0700 (PDT)
In-Reply-To: <1495461575-29488-1-git-send-email-shawnguo@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>

On Mon, May 22, 2017 at 3:59 PM, Shawn Guo <shawnguo@kernel.org> wrote:

> From: Shawn Guo <shawn.guo@linaro.org>
>
> There are a couple of issues with group_desc initialization in function
> zx_pinctrl_build_state().
>
>  - num_pins is not initialized and remains zero.
>  - pins shouldn't be initialized with a pointer to variable in the
>    stack.
>
> With them fixed, pin_request() in pinmux_enable_setting() can be invoked
> correctly.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Patch applied.

Yours,
Linus Walleij
