From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zynq: add static to platform_driver remove callback
Date: Tue, 19 May 2015 11:29:03 +0200
Message-ID: <CACRpkdZV3wcc_fC=SMngY7qK8-7hOFH0hH0A=pkny-F2-jFm7Q@mail.gmail.com>
References: <1431660698-30992-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35561 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754873AbbESJ3D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 05:29:03 -0400
Received: by obcus9 with SMTP id us9so7587049obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2015 02:29:03 -0700 (PDT)
In-Reply-To: <1431660698-30992-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, May 15, 2015 at 5:31 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This function is only referenced in this file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with S=C3=B6ren's review tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
