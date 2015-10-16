From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] drivers: field for new GPIO driver
Date: Fri, 16 Oct 2015 23:18:57 +0200
Message-ID: <CACRpkdafQ6jUQ0SRkT-39Ev+GZPqOz+z0SrXaU_7vEYo6c=cwA@mail.gmail.com>
References: <1444817801-2266-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35585 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984AbbJPVS6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 17:18:58 -0400
Received: by oiev17 with SMTP id v17so23740009oie.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 14:18:57 -0700 (PDT)
In-Reply-To: <1444817801-2266-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Yd_Tseng@asmedia.com.tw, =?UTF-8?B?VHVuZ1l1IEx1KOWRguadseaYsSk=?= <TungYu_Lu@asmedia.com.tw>

On Wed, Oct 14, 2015 at 12:16 PM, YD Tseng <ltyu101@gmail.com> wrote:

> Dear all:
>
> This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>

Please fix subject line to
"gpio: driver for AMD Promontory"

Put a line-wrapped concise description in the driver commit
blurb.

> +#define TOTAL_GPIO_PINS 8

Call this PT_TOTAL_GPIO 8 or so.

> +config GPIO_AMDPT
> +       tristate "AMD Promontory GPIO support"
> +       depends on PCI && ACPI

Why does this depend on PCI when it's an ACPI platform device?

Yours,
Linus Walleij
