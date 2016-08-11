From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/11] pinctrl: nomadik: use of_property_read_bool
Date: Thu, 11 Aug 2016 13:52:04 +0200
Message-ID: <CACRpkdZi-dpkgvH5zR_UKiTbk4pmsGeiXH5pVgjZBrW2FaK1ZQ@mail.gmail.com>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr> <1470387411-15879-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36745 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257AbcHKLwF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 07:52:05 -0400
Received: by mail-oi0-f51.google.com with SMTP id f189so1482821oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 04:52:05 -0700 (PDT)
In-Reply-To: <1470387411-15879-4-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alessandro Rubini <rubini@unipv.it>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 5, 2016 at 10:56 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Use of_property_read_bool to check for the existence of a property.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression e1,e2;
> statement S2,S1;
> @@
> -       if (of_get_property(e1,e2,NULL))
> +       if (of_property_read_bool(e1,e2))
>         S1 else S2
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.

Yours,
Linus Walleij
