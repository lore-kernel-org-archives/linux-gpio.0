From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: add missing module_exit function
Date: Tue, 14 Jul 2015 15:38:27 +0200
Message-ID: <CACRpkdahFxxBaFh593tH0gAY_u58R6055ubBjvmwtZufYOseDQ@mail.gmail.com>
References: <1434531101-2585-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35764 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484AbbGNNi1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 09:38:27 -0400
Received: by obbop1 with SMTP id op1so6054281obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 06:38:27 -0700 (PDT)
In-Reply-To: <1434531101-2585-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jun 17, 2015 at 10:51 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This driver is tristate, so it should be cleanable.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Michal's test tag.

Yours,
Linus Walleij
