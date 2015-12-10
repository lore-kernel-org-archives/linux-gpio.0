From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 0/3] pinmux support for Broadcom NSP SOC
Date: Thu, 10 Dec 2015 14:55:59 -0800
Message-ID: <566A02FF.9080708@broadcom.com>
References: <1448042120-9212-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:32558 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbLJW5S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 17:57:18 -0500
In-Reply-To: <1448042120-9212-1-git-send-email-yrdreddy@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com

Hi,

On 11/20/2015 9:55 AM, Yendapally Reddy Dhananjaya Reddy wrote:
> This patchset contains the pinmux support for the Broadcom's
> Northstar Plus (NSP) SOC.
>
> The first patch provides the documentation details and the
> second patch contains the driver details. The third patch
> contains the enable method.
>
> This patchset has been tested on NSP bcm958625HR board.
> This patchset is based on v4.4.0-rc1 and is available from github
> repo: https://github.com/Broadcom/cygnus-linux.git
> branch: nsp-pinmux-v1
>
> Yendapally Reddy Dhananjaya Reddy (3):
>    pinctrl: Broadcom NSP pinctrl device tree bindings
>    pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC
>    ARM: dts: enable pinctrl for Broadcom NSP
>
>   .../bindings/pinctrl/brcm,nsp-pinmux.txt           |  79 +++
>   arch/arm/boot/dts/bcm-nsp.dtsi                     |   7 +
>   arch/arm/boot/dts/bcm958625k.dts                   |   9 +
>   drivers/pinctrl/bcm/Kconfig                        |  13 +
>   drivers/pinctrl/bcm/Makefile                       |   1 +
>   drivers/pinctrl/bcm/pinctrl-nsp-mux.c              | 650 +++++++++++++++++++++
>   6 files changed, 759 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-pinmux.txt
>   create mode 100644 drivers/pinctrl/bcm/pinctrl-nsp-mux.c
>

This entire patch set looks good to me.

Reviewed-by: Ray Jui <rjui@broadcom.com>

Thanks,

Ray
