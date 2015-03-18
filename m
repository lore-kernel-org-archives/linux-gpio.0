From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl: sh-pfc: Use reg_width instead of reg as sentinel
Date: Wed, 18 Mar 2015 02:15:12 +0100
Message-ID: <CACRpkdZ6kG0hJ7dno=ecFXEAPzpCUF3kDtS55rBkNo7+R1wu-A@mail.gmail.com>
References: <1426154956-26583-1-git-send-email-geert+renesas@glider.be>
	<1426154956-26583-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34873 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753487AbbCRBPN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:15:13 -0400
Received: by oiag65 with SMTP id g65so24185878oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:15:12 -0700 (PDT)
In-Reply-To: <1426154956-26583-4-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 12, 2015 at 11:09 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> All other loops over sh_pfc_soc_info.data_regs[] use
> pinmux_data_reg.regwidth as the sentinel, which is safer as zero is
> never a valid regwidth value (reg could be zero if we start using it to
> store an offset).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v3:
>   - Add Acked-by,

Patch applied.

Yours,
Linus Walleij
