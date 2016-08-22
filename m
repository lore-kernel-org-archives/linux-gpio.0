From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pistachio: fix mfio pll_lock pinmux
Date: Mon, 22 Aug 2016 15:29:09 +0200
Message-ID: <CACRpkda9DL=KPOpXyN8AR7tJ8vmA3=-HS70RHqog_WuczsE-7Q@mail.gmail.com>
References: <1471604603-23221-1-git-send-email-james.hartley@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34193 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754198AbcHVN3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 09:29:10 -0400
Received: by mail-oi0-f48.google.com with SMTP id l203so150354175oib.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 06:29:10 -0700 (PDT)
In-Reply-To: <1471604603-23221-1-git-send-email-james.hartley@imgtec.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: James Hartley <james.hartley@imgtec.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>, Damien Horsley <Damien.Horsley@imgtec.com>, Linux MIPS <linux-mips@linux-mips.org>, "# 4 . 4 . x-" <stable@vger.kernel.org>

On Fri, Aug 19, 2016 at 1:03 PM, James Hartley <james.hartley@imgtec.com> wrote:

> A previous patch attempted to fix the pinmuxes for mfio 84 - 89, but it
> omitted a change to pistachio_pin_group pistachio_groups, which results
> in incorrect pll_lock signals being routed.
>
> Apply the correct mux settings throughout the driver.
>
> fixes: cefc03e5995e ("pinctrl: Add Pistachio SoC pin control driver")
> fixes: e9adb336d0bf ("pinctrl: pistachio: fix mfio84-89 function description and pinmux.")
>
> Cc: <stable@vger.kernel.org> # 4.4.x-
>
> Signed-off-by: James Hartley <james.hartley@imgtec.com>
> Reviewed-by: Sifan Naeem <Sifan.Naeem@imgtec.com>

Patch applied for fixes.

Yours,
Linus Walleij
