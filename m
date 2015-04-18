From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 00/10] Add Freescale i.mx7d support
Date: Sat, 18 Apr 2015 08:39:57 +0200 (CEST)
Message-ID: <389076076.132823.1429339197272.JavaMail.open-xchange@oxbaltgw09.schlund.de>
References: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64837 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903AbbDRGk1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Apr 2015 02:40:27 -0400
In-Reply-To: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Frank.Li@freescale.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, lznuaa@gmail.com, shawn.guo@linaro.org

Hi Frank,

> Frank.Li@freescale.com hat am 17. April 2015 um 23:28 geschrieben:
>
>
> From: Frank Li <Frank.Li@freescale.com>
>
> add basic support for chip imx7d.
> - MSL
> - Clock support. All clock enabled.
> - pinctrl support
> - SD Card support
>
> Change from v2 to v3
> - remove unsupport part in imx7d-sdb.dtb
>
> Change from V1 to V2:
> - split patch1 to three small one to avoid 100k maillist limitation.
> - fix imx7d.dtsi code style problem
>
> Anson Huang (1):
> ARM: imx: add msl support for imx7d
>
> Frank Li (9):
> ARM: dts: add pinfunc include file to support imx7d
> ARM: dts: add pinfunc include file gpio1 to support imx7d
> ARM: dts: add clock include file to support imx7d
> ARM: dts: add imx7d soc dtsi file
> pinctrl: add imx7d support
> ARM: imx: add gpt system timer support for imx7d
> ARM: imx: add imx7d clk tree support
> arm: dts: add imx7d-sdb support
> ARM: config: imx_v6_v7_defconfig add imx7d support

please pay attention to:

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/submitting-patches.txt

Thanks
Stefan
