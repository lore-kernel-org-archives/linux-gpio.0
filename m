From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4] drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic
Date: Mon, 8 Feb 2016 18:34:29 +0100
Message-ID: <CACRpkdYSwSW+kd+QyvfabNoPyAXx9VDWJaYD79p3krpgmX8iOg@mail.gmail.com>
References: <1454498854-33169-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35324 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbcBHRea (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2016 12:34:30 -0500
Received: by mail-lf0-f54.google.com with SMTP id l143so100160394lfe.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Feb 2016 09:34:30 -0800 (PST)
In-Reply-To: <1454498854-33169-1-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, bhupesh.sharma@nxp.com, scott.wood@nxp.com, Leo.Li@nxp.com

On Wed, Feb 3, 2016 at 12:27 PM, Liu Gang <Gang.Liu@nxp.com> wrote:

> The new Layerscape platforms has the same ip block/controller
> as GPIO on PowerPC platforms(MPC8XXX), but the GPIO registers
> may be big or little endian. So the code needs to get the
> endian property from DTB, then make additional functions to
> fit all the PowerPC/Layerscape GPIO register read/write
> operations.
>
> gpio-generic.c provides an universal infrastructure for both
> big and little endian register operations. So switch the
> gpio-mpc8xxx to use gpio-generic can simplify the driver and
> reduce a lot of code.
>
> The IRQ and some workaround parts in gpio-mpc8xxx.c will be
> updated with the new API interfaces but following the
> original functionalities.
>
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
> ---
> -V4: Rebase the kernel to v4.5-rc1 for the new gpio-generic
>      infrastructure based on Linus Walleij comments.

Patch applied, I guess this also silences the compile errors I've
been getting about the be32 accessors.

Yours,
Linus Walleij
