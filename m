From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] meson-gxl pinctrl - add the missing PWM pins
Date: Mon, 6 Mar 2017 17:14:56 +0100
Message-ID: <7aaa5ff1-8c10-2b69-1273-bfdb1783e47b@baylibre.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38775 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752973AbdCFQPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2017 11:15:00 -0500
Received: by mail-wm0-f41.google.com with SMTP id t193so68828151wmt.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2017 08:14:59 -0800 (PST)
In-Reply-To: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org

On 03/04/2017 10:23 PM, Martin Blumenstingl wrote:
> Due to the lack of a public GXL or GXM datasheet most of the PWM pin
> definitions are currently missing.
> However, the people behind the Khadas VIM boards were kind enough to
> share the PWM pins and their corresponding register offsets and bits
> with me.
> 
> This patch adds all missing PWM pins to the GXL pinctrl driver. The
> upcoming Khadas VIM board support patch only needs PWM_F and PWM_AO_A.
> I still decided to add all PWM pins just in case there's no public GXL
> datasheet release soon.
> 
> 
> Martin Blumenstingl (2):
>   pinctrl: meson: gxl: add the missing PWM pin definitions
>   ARM64: dts: amlogic: meson-gxl: add the missing PWM pins
> 
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 56 ++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 64 ++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 

Tested by running it on the Khadas VIM :

Tested-by: Neil Armstrong <narmstrong@baylibre.com>

and

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
