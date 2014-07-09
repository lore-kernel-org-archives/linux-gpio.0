From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: rcar: Add support for DT IRQ flags
Date: Wed, 9 Jul 2014 12:34:01 +0200
Message-ID: <CACRpkdbh+xb-bdUufGLVByNyO8RuD=ii0Mb4OCYuZdaaSDevig@mail.gmail.com>
References: <12008900.rC4lq8SXRG@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:41618 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755476AbaGIKeC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jul 2014 06:34:02 -0400
Received: by mail-oa0-f43.google.com with SMTP id o6so7900465oag.30
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2014 03:34:01 -0700 (PDT)
In-Reply-To: <12008900.rC4lq8SXRG@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Magnus Damm <damm@opensource.se>

On Tue, Jul 8, 2014 at 12:46 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> The gpio-rcar driver has no IRQ domain OF xlate function and thus
> ignores IRQ flags specified in DT. Fix this by using the two-cell xlate
> function.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Patch applied.

Yours,
Linus Walleij
