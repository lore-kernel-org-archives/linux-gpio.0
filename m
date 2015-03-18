From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] pinctrl: sh-pfc: Use unsigned int for
 register/field widths and offsets
Date: Wed, 18 Mar 2015 02:14:15 +0100
Message-ID: <CACRpkdZxueV1uqbD1PabrwUsV=xfys+Gq=TN5bu47O3sgWjrZw@mail.gmail.com>
References: <1426154956-26583-1-git-send-email-geert+renesas@glider.be>
	<1426154956-26583-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36011 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754757AbbCRBOQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:14:16 -0400
Received: by oigv203 with SMTP id v203so24149313oig.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:14:15 -0700 (PDT)
In-Reply-To: <1426154956-26583-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 12, 2015 at 11:09 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As register and field widths and offsets are in the range 1..32, use
> unsigned int (mostly replacing unsigned long) to store them in local
> variables and for passing them around.
>
> Move to one variable per line, move variables to the beginning of the
> block where they are used, and drop superfluous initializations while we
> are at it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v3:
>   - Remove superfluous initializations of local variables,
>   - Add Acked-by,

Patch applied.

Yours,
Linus Walleij
