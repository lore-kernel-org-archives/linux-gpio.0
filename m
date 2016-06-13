From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: xway: Change structure initialisation to c99 style
Date: Mon, 13 Jun 2016 14:03:59 +0200
Message-ID: <CACRpkdZBL1VW9ZTCt8YkC5GTFOfaT_rH=SdSwvfs=9dO-y0+sQ@mail.gmail.com>
References: <20160611040252.GA20307@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35210 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422736AbcFMMEB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:04:01 -0400
Received: by mail-oi0-f43.google.com with SMTP id w5so124656496oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:04:00 -0700 (PDT)
In-Reply-To: <20160611040252.GA20307@amitoj-Inspiron-3542>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Jun 11, 2016 at 6:02 AM, Amitoj Kaur Chawla
<amitoj1606@gmail.com> wrote:

> Replace the in order struct initialisation style with explicit field
> style.
>
> The Coccinelle semantic patch used to make this change is as follows:
>
> @decl@
> identifier i1,fld;
> type T;
> field list[n] fs;
> @@
>
> struct i1 {
>  fs
>  T fld;
>  ...};
>
> @@
> identifier decl.i1,i2,decl.fld;
> expression e;
> position bad.p, bad.fix;
> @@
>
> struct i1 i2@p = { ...,
> + .fld = e
> - e@fix
>  ,...};
>
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>

Patch applied, thanks!

Yours,
Linus Walleij
