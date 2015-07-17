From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] [v2] pinctrl: add support for Qualcomm Technologies
 QDF2xxx ARM64 SoCs
Date: Fri, 17 Jul 2015 14:41:21 +0200
Message-ID: <CACRpkda-bhOUUTN314Z_T02Mwsr6DmpeAnNspcc1eFvZ6BBn8Q@mail.gmail.com>
References: <1436978834-7271-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36491 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757091AbbGQMlW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:41:22 -0400
Received: by oibn4 with SMTP id n4so69823077oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:41:21 -0700 (PDT)
In-Reply-To: <1436978834-7271-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Vipul Gandhi <vgandhi@codeaurora.org>

On Wed, Jul 15, 2015 at 6:47 PM, Timur Tabi <timur@codeaurora.org> wrot=
e:

> Add the pinctrl driver for the Qualcomm Technologies QDF2xxx ARM64 So=
Cs,
> which uses the Qualcomm Technologies TLMM pinctrl/gpio device.  This
> driver is probed via ACPI and uses the pinctrl-msm.c backend driver.
>
> This driver is intended to be used only an ACPI-enabled system.  As s=
uch,
> UEFI will handle all pin control configuration, so this driver does n=
ot
> provide pin control functions.  It is effectively a GPIO-only driver.

In my experience, you will come back and add pin control to it if
it ever sees any practical power-aware use cases.

=46or the same reason that Intel is doing it to their pin controllers,
that also run on systems that are ACPI-enabled.

>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

This version applied with Bj=C3=B6rn's review tag.


Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
