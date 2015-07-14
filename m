From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] ARM: imx: pinctrl-imx: imx7d: add support for iomuxc lpsr
Date: Tue, 14 Jul 2015 09:57:52 +0200
Message-ID: <CACRpkdYt227EmLW3SngChp-mHd4TO38W2FswCZRar-MET7dztw@mail.gmail.com>
References: <1434743950-7771-1-git-send-email-aalonso@freescale.com>
	<1434743950-7771-3-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36648 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694AbbGNH5w (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 03:57:52 -0400
Received: by oibn4 with SMTP id n4so1357679oib.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 00:57:52 -0700 (PDT)
In-Reply-To: <1434743950-7771-3-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Anson.Huang@freescale.com" <Anson.Huang@freescale.com>, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com

On Fri, Jun 19, 2015 at 9:59 PM, Adrian Alonso <aalonso@freescale.com> wrote:

> * Extend pinctrl-imx driver to support iomux lpsr conntroller,
> * iMX7D has two iomuxc controllers, iomuxc controller similar as
>   previous iMX SoC generation and iomuxc-lpsr which provides
>   low power state rentetion capabilities on gpios that are part of
>   iomuxc-lpsr (GPIO1_IO7..GPIO1_IO0).
> * Use IOMUXC_LPSR_SUPPORT and iput_val most significant bits to
>   properly configure iomuxc/iomuxc-lpsr settings.
>
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>

I'm waiting for Shawn's ACK on this before I do anything, and you also
need to address Zhi Li's comments. (Or there is already such
a version higher up in my mailbox, in that case, sorry.)

Yours,
Linus Walleij
