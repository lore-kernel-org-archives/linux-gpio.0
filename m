From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] pinctrl/lantiq: updating devicetree binding description
Date: Mon, 30 Nov 2015 13:11:25 +0100
Message-ID: <CACRpkdZbWJeg9erANW3onEYFXb7LnNkegeaWi6m2AzB37c41uw@mail.gmail.com>
References: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33604 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753827AbbK3ML0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 07:11:26 -0500
Received: by oixx65 with SMTP id x65so93438022oix.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 04:11:26 -0800 (PST)
In-Reply-To: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>, Jonas Gorski <jogo@openwrt.org>, daniel.schwierzeck@gmail.com

On Thu, Nov 26, 2015 at 11:00 AM, Martin Schiller <mschiller@tdt.de> wrote:

> This patch adds the new dedicated "lantiq,<chip>-pinctrl" compatible strings
> to the devicetree bindings Documentation, where <chip> is one of "ase",
> "danube", "xrx100", "xrx200" or "xrx300" and marks the "lantiq,pinctrl-xway",
> "lantiq,pinctrl-ase" and "lantiq,pinctrl-xr9" compatible strings as DEPRECATED.
>
> Signed-off-by: Martin Schiller <mschiller@tdt.de>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v3:
> None

Patch applied.

Yours,
Linus Walleij
