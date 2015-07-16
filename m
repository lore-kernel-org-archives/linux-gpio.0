From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Resend][PATCH] Pinctrl: imx1: fix wrong pin-name resolving
Date: Thu, 16 Jul 2015 10:52:58 +0200
Message-ID: <CACRpkdZ4h59v6i6_htLGj2K9n_-qidd2wtZFW21N2J1p=OK=Cw@mail.gmail.com>
References: <558C9C49.7090600@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34577 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755071AbbGPIw7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 04:52:59 -0400
Received: by obre1 with SMTP id e1so42997539obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 01:52:58 -0700 (PDT)
In-Reply-To: <558C9C49.7090600@gtsys.com.hk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jun 26, 2015 at 2:26 AM, Chris Ruehl <chris.ruehl@gtsys.com.hk> wrote:

> Bug in function imx1_pinconf_set() cause crash when
> princtrl debug is enabled and the pin_id becomes larger
> then the info->pins[] contains data.
>
> imx27-pinctrl 10015000.iomuxc: request pin 134 (MX27_PAD_UART2_TXD) for
> 1000b000.serial
> imx27-pinctrl 10015000.iomuxc: request pin 135 (MX27_PAD_UART2_RXD) for
> 1000b000.serial
> imx27-pinctrl 10015000.iomuxc: request pin 131 (MX27_PAD_UART2_CTS) for
> 1000b000.serial
> imx27-pinctrl 10015000.iomuxc: request pin 132 (MX27_PAD_UART2_RTS) for
> 1000b000.serial
> imx27-pinctrl 10015000.iomuxc: enable function uart group uart2-1
> imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x86, function 0, gpio 0,
> direction 1, oconf 0, iconfa 0, iconfb 0
> imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x87, function 0, gpio 0,
> direction 0, oconf 0, iconfa 0, iconfb 0
> imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x83, function 0, gpio 0,
> direction 1, oconf 0, iconfa 0, iconfb 0
> imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0x84, function 0, gpio 0,
> direction 0, oconf 0, iconfa 0, iconfb 0
> imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=134
> imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_RTS
> imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=135
> imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_RTCK
> imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=131
> imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_TXD
> imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=132
> imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_UART1_RXD
> ...
> imx27-pinctrl 10015000.iomuxc: write: register 0xf4415508 offset 4 value 0x3
> imx27-pinctrl 10015000.iomuxc: write: register 0xf4415510 offset 4 value 0x0
> imx27-pinctrl 10015000.iomuxc: write: register 0xf4415518 offset 4 value 0x0
> imx27-pinctrl 10015000.iomuxc: imx1_pmx_set, pin 0xb5, function 0, gpio 0,
> direction 1, oconf 0, iconfa 0, iconfb 0
> imx27-pinctrl 10015000.iomuxc: num_configs=1 PinID=171
> Unable to handle kernel paging request at virtual address 6c61765f
> pgd = c0004000
> 6c61765f] *pgd=00000000
> Internal error: Oops: 5 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-rc4-next-20150522-dirty #8
> Hardware name: GTSYS i.MX27GTSIR (Device Tree Support)
> task: ce832000 ti: ce848000 task.ti: ce848000
> PC is at strnlen+0x28/0x3c
> LR is at string.isra.4+0x34/0xcc
> pc : [<c01ae188>]    lr : [<c01af9a4>]    psr: 20000093
> sp : ce849a88  ip : ce849a98  fp : ce849a94
> r10: c05d7e3a  r9 : c05d81e4  r8 : 00000000
> r7 : 6c61765f  r6 : c05d81e4  r5 : ffffffff  r4 : c05d7e3a
> r3 : 6c61765f  r2 : 6c61765f  r1 : 6c61765e  r0 : 6c61765f
> Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
>
>
> Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>

Patch applied. Can't seem so see anyone who's safeguarding this
driver recently, putting some people on To:

Yours,
Linus Walleij
