From: YD Tseng <ltyu101@gmail.com>
Subject: Re:[PATCH v3] gpio: driver for AMD Promontory
Date: Mon, 19 Oct 2015 11:05:20 +0800
Message-ID: <1445223920-2730-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:33537 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752440AbbJSDFt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Oct 2015 23:05:49 -0400
Received: by pabrc13 with SMTP id rc13so176234813pab.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2015 20:05:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

> > Dear all:
> >
> > This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
> >
> > Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
>
> Please fix subject line to
> "gpio: driver for AMD Promontory"
>
> Put a line-wrapped concise description in the driver commit blurb.
>

fixed in the new submission.

> > +#define TOTAL_GPIO_PINS 8
>
> Call this PT_TOTAL_GPIO 8 or so.
>

fixed in the new patch.

> > +config GPIO_AMDPT
> > +       tristate "AMD Promontory GPIO support"
> > +       depends on PCI && ACPI
>
> Why does this depend on PCI when it's an ACPI platform device?
>

removed PCI dependency in Kconfig.

> Yours,
> Linus Walleij

Best Regards,
YD Tseng
