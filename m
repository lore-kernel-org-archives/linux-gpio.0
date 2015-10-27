From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC 0/4] pinctrl: sh-pfc: Add PINMUX_SINGLE()
Date: Tue, 27 Oct 2015 11:20:21 +0100
Message-ID: <CACRpkdYdV6iKL0Jnbzz=5JPkMmGS-0yfT+8Hp1mYtUS32xifhg@mail.gmail.com>
References: <1445369195-25117-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36723 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751573AbbJ0KUW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 06:20:22 -0400
Received: by obcqt19 with SMTP id qt19so165713582obc.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 03:20:21 -0700 (PDT)
In-Reply-To: <1445369195-25117-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 20, 2015 at 9:26 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi,
>
> Currently single-function pins are described using the raw PINMUX_DATA()
> macro.
>
> Morimoto-san doesn't like that. He proposed to use the existing
> PINMUX_IPSR_NOGP() macro instead (cfr. "[RFC] pinctrl: sh-pfc: r8a7795:
> Add pinmux data for single-function pins",
> http://www.spinics.net/lists/linux-sh/msg44823.html).
> However, that macro is intended to describe a pinmux configuration
> without GPIO function, which feels wrong to me.
>
> This patch series proposes an alternative, introducing a new macro
> PINMUX_SINGLE() to describe a pinmux configuration for a single-function
> pin. It also converts the existing single-function pin descriptions.

If Laurent gives his ACK you can stack these patches for your
next pull request.

Yours,
Linus Walleij
