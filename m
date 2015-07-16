From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: move CONFIG_PINCTRL to drivers/Makefile
Date: Thu, 16 Jul 2015 09:38:26 +0200
Message-ID: <CACRpkdYG1DS=remNj1=-vh5H45Zg_Y_N3MB_2wCVPo=sdNKT3A@mail.gmail.com>
References: <1436406901-31919-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34130 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752520AbbGPHi1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 03:38:27 -0400
Received: by obre1 with SMTP id e1so42060880obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 00:38:27 -0700 (PDT)
In-Reply-To: <1436406901-31919-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Pratik Patel <pratikp@codeaurora.org>, Oded Gabbay <oded.gabbay@amd.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Valentin Rothberg <valentinrothberg@gmail.com>

On Thu, Jul 9, 2015 at 3:55 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Kbuild should descend into drivers/pinctrl/ only when CONFIG_PINCTRL
> is enabled because everything under that directory depends on
> CONFIG_PINCTRL.
>
> We can avoid the conditional, ifeq ($(CONFIG_OF),y) ... endif.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks like a nice improvement to the build.

Patch applied unless Greg has objections.

Yours,
Linus Walleij
