From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/5] pinctrl: imx: add soc specific mux_mode mask and
 shift property
Date: Mon, 22 May 2017 11:06:08 +0200
Message-ID: <CACRpkdbz44c=kM_0ZGNUJGQXvLuOUv=WewWFbqYWwYSZu=Vtxw@mail.gmail.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com> <1495177545-23006-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:36450 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757508AbdEVJGJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 05:06:09 -0400
Received: by mail-it0-f45.google.com with SMTP id o5so148001076ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 02:06:09 -0700 (PDT)
In-Reply-To: <1495177545-23006-4-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, fugang.duan@nxp.com, Sascha Hauer <kernel@pengutronix.de>

On Fri, May 19, 2017 at 9:05 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> MX7ULP MUX mode mask and shift bit is different from VF610.
> Let's make it a platform specific property for the later easy of
> adding MX7ULP support.
>
> One trick in exist code that Vybrid hardcoded the config part
> as 0xffff because its mux_config register BIT[15-0] are all configs
> part. But it's not true in ULP, so use mux_mask instead to address
> the difference.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>
> ---
> ChangeLog:
> v1->v2:
>  Minor changes:
>  * add more explanation about Vybrid trick in commit message.

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
