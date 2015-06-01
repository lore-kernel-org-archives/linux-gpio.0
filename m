From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH 1/2] pinctrl: zynq: fix DEFINE_ZYNQ_PINMUX_FUNCTION_MUX
 macro
Date: Mon, 1 Jun 2015 14:44:16 +0200
Message-ID: <CACRpkdY0n-mdq4BSumUEJQENcWBdP2Y7kputm7Ek_LL4am6_Yg@mail.gmail.com>
References: <1432111351-21336-1-git-send-email-yamada.masahiro@socionext.com>
	<1432111351-21336-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36826 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911AbbFAMoR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:44:17 -0400
Received: by oihb142 with SMTP id b142so100003193oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:44:16 -0700 (PDT)
In-Reply-To: <1432111351-21336-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, May 20, 2015 at 10:42 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The offset to the mux register is missing.
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
