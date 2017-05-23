From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: core: do not explicitly free on unregister
Date: Tue, 23 May 2017 10:20:31 +0200
Message-ID: <CACRpkdZoiZU5GGQixZ3d_Qp3enJY2-E7j_+t0TVZCDpGgJHUQQ@mail.gmail.com>
References: <20170516061859.396-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35043 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966655AbdEWIUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 04:20:33 -0400
Received: by mail-it0-f46.google.com with SMTP id c15so14954915ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 01:20:33 -0700 (PDT)
In-Reply-To: <20170516061859.396-1-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>

On Tue, May 16, 2017 at 8:18 AM, Stefan Agner <stefan@agner.ch> wrote:

> When using the resource managed version of pinctrl, resources
> might already been freed when pinctrl_unregister is called by the
> devres framework. When calling devm_kfree on such a already freed
> resource, devres prints a warning:
>   WARNING: CPU: 0 PID: 1 at drivers/base/devres.c:891 pinmux_generic_free_functions+0xf4/0x128
>   ...
>
> Solve this by not explicitly free resources. The two affected
> functions (pinmux_generic_free_functions/pinctrl_generic_free_groups)
> are only used in pinctrl_unregister. When not using the resource
> managed version of pinctrl, the underlying device will presumably
> get freed freed soon anyway.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

I think this is no longer needed after the fix from Tony
"pinctrl: core: Fix warning by removing bogus code"

Yours,
Linus Walleij
