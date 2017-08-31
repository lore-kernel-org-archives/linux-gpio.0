From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: make mxs_regs const
Date: Thu, 31 Aug 2017 13:57:24 +0200
Message-ID: <CACRpkda8M0hbzbTn=VH2OwbD-fx42m0OT3mAqJsqrgq44NLAXA@mail.gmail.com>
References: <1503496152-4926-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36857 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751057AbdHaL5Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 07:57:25 -0400
Received: by mail-oi0-f52.google.com with SMTP id t75so3484260oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 04:57:25 -0700 (PDT)
In-Reply-To: <1503496152-4926-1-git-send-email-bhumirks@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 23, 2017 at 3:49 PM, Bhumika Goyal <bhumirks@gmail.com> wrote:

> Make these const as they are only stored in the const field of a
> mxs_pinctrl_soc_data structure.
>
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>

Patch applied.

Yours,
Linus Walleij
