From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: Use u32 to store register data
Date: Mon, 9 Mar 2015 17:37:30 +0100
Message-ID: <CACRpkdbDNu55E6Cd+w29koWiQQ=wpAkG_feg6ap2U_LuBgYueg@mail.gmail.com>
References: <1425058685-12956-1-git-send-email-geert+renesas@glider.be>
	<1425058685-12956-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34031 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932616AbbCIQha (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 12:37:30 -0400
Received: by oigh136 with SMTP id h136so30369685oig.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 09:37:30 -0700 (PDT)
In-Reply-To: <1425058685-12956-4-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Fri, Feb 27, 2015 at 6:38 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As PFC registers are either 8, 16, or 32 bits wide, use u32 (mostly
> replacing unsigned long) to store (parts of) register values and masks.
>
> Switch the shadow register operations from {set,clear}_bit() to plain C
> bit operations, as the former can operate on long data only.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied with Laurent's ACK.

Yours,
Linus Walleij
