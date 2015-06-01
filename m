From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH 2/2] pinctrl: zynq: fix offset address for {SD0,SD1}_WP_CD_SEL
Date: Mon, 1 Jun 2015 14:44:33 +0200
Message-ID: <CACRpkda6UV72Zhg2S9xuMXnhBq32yPTSqwCLbSPEHBHn3ist8g@mail.gmail.com>
References: <1432111351-21336-1-git-send-email-yamada.masahiro@socionext.com>
	<1432111351-21336-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35601 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752677AbbFAMod convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:44:33 -0400
Received: by obcnx10 with SMTP id nx10so96674617obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:44:33 -0700 (PDT)
In-Reply-To: <1432111351-21336-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, May 20, 2015 at 10:42 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The address for SD0_WP_CD_SEL, SD1_WP_CD_SEL is 0xf8000830,
> 0xf8000834, respectively.
>
> Each offset address must be prefixed with 0x.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

No reply from S=C3=B6ren, but applying anyway since it seems to make se=
nse.
Only for -next though.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
