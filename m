From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH 0/2] pinctrl: zynq: fix two bugs of zynq pinmux function
Date: Mon, 1 Jun 2015 15:01:25 +0200
Message-ID: <CACRpkdbpW6i2SNz254gt+T8TPw=gBzB68dQ2TmVNbwc41dT=1Q@mail.gmail.com>
References: <1432111351-21336-1-git-send-email-yamada.masahiro@socionext.com>
	<20150520142358.GS31550@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33321 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387AbbFANB0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 09:01:26 -0400
Received: by obbnx5 with SMTP id nx5so102230585obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 06:01:25 -0700 (PDT)
In-Reply-To: <20150520142358.GS31550@xsjsorenbubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, May 20, 2015 at 4:23 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> For the series:
> Reviewed-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

Ah that is S=C3=B6ren's Review tag.

> It may be a good ides to add
>   Fixes: add958cee967 "pinctrl: Add driver for Zynq"
> (I suspect that bug is there from the beginning) and ask Linus to
> consider this for stable.

I added it but still merging for -next at this point. No need to
rush this fix since it's been around so long.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
