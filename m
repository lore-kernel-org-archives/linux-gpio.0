From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: add SSI pin groups
Date: Mon, 15 Feb 2016 23:14:27 +0100
Message-ID: <CACRpkdZKremvD7Y75EL9g18BTsfGsO+FpB0g7Y5nP04BYrdCyA@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
	<2575141.vI43ObUTa0@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:36585 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752924AbcBOWO1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 17:14:27 -0500
Received: by mail-ob0-f179.google.com with SMTP id gc3so130441629obb.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 14:14:27 -0800 (PST)
In-Reply-To: <2575141.vI43ObUTa0@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On Wed, Feb 10, 2016 at 11:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>
> Add the SSI pin groups to the R8A7794 PFC driver.
>
> [Sergei: fixed inconsistent alternate pin group naming, split SSI5/6 pin
> groups into data/control ones, moved SSI7 data B group to its proper place,
> fixed  pin names in  the comments to *_pins[], extended Cogent Embedded's
> copyright, added the changelog, renamed the patch.]
>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

These look fine to me, Acked-by for both.

Geert, will you & Laurent review and queue this please.

Yours,
Linus Walleij
