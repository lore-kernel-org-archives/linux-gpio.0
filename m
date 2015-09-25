From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] sh-pfc: modify PINMUX_IPSR_MSEL() macro order
Date: Fri, 25 Sep 2015 09:43:54 -0700
Message-ID: <CACRpkdZo86njR0868ToH2hsjQswCHEjNz7Ff4bsq7aGONTKriQ@mail.gmail.com>
References: <87wpw9jn3i.wl%kuninori.morimoto.gx@renesas.com>
	<87io7tjmk6.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36750 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756344AbbIYQnz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 12:43:55 -0400
Received: by obbmp4 with SMTP id mp4so86357119obb.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 09:43:54 -0700 (PDT)
In-Reply-To: <87io7tjmk6.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Wed, Sep 2, 2015 at 12:44 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> The difference between PINMUX_IPSR_MSEL() and PINMUX_IPSR_MODSEL_DATA()
> are FN_xxx order, and PINMUX_IPSR_MSEL() is used only from r8a7778.
> Now it r8a7778 works correctly with PINMUX_IPSR_MODSEL_DATA() order.
> This means we can merge PINMUX_IPSR_MSEL() and PINMUX_IPSR_MODSEL_DATA().
>
> Current PFC driver is very difficult to read, because macro names are
> using different lenth. Especially PINMUX_IPSR_MODSEL_DATA() is well
> used macro
>
>         PINMUX_IPSR_NOGP(ispr, ...)
>         PINMUX_IPSR_DATA(ipsr, ...)
>         PINMUX_IPSR_NOGM(ispr, ...)
>         PINMUX_IPSR_NOFN(ipsr, ...)
>         PINMUX_IPSR_MSEL(ipsr, ...)
>         PINMUX_IPSR_MODSEL_DATA(ipsr, ...)
>
> It can be readable if we can merge PINMUX_IPSR_MSEL() and PINMUX_IPSR_MODSEL_DATA()
>
>         PINMUX_IPSR_NOGP(ispr, ...)
>         PINMUX_IPSR_DATA(ipsr, ...)
>         PINMUX_IPSR_NOGM(ispr, ...)
>         PINMUX_IPSR_NOFN(ipsr, ...)
>         PINMUX_IPSR_MSEL(ipsr, ...)
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

for the series, Geert will decide how to merge and send a
pull request for the patches to me.

Yours,
Linus Walleij
