From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 RESEND 1/3] gpio: Add APM X-Gene standby GPIO
 controller driver
Date: Fri, 16 Jan 2015 16:19:13 +0100
Message-ID: <CACRpkdYjsQFgbZMSE6v1vQRP5OK-4vvDzOrk07NHxywXZ-4sGg@mail.gmail.com>
References: <1418793050-26927-1-git-send-email-yvo@apm.com>
	<1418793050-26927-2-git-send-email-yvo@apm.com>
	<CACRpkdZe7Huiruu-iSNU4MWaiLo_qL=QAab1crummuuVOEJ0zQ@mail.gmail.com>
	<CAL4ahLfGNc1sL-hr7bZi_pcxjz7CNHjPRSPnJf_TUCGsbweaDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:63422 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717AbbAPPTO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jan 2015 10:19:14 -0500
Received: by mail-ie0-f174.google.com with SMTP id at20so21180483iec.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2015 07:19:13 -0800 (PST)
In-Reply-To: <CAL4ahLfGNc1sL-hr7bZi_pcxjz7CNHjPRSPnJf_TUCGsbweaDA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches <patches@apm.com>

On Wed, Jan 14, 2015 at 9:27 AM, Y Vo <yvo@apm.com> wrote:
> On Tue, Jan 13, 2015 at 4:40 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> This looks very much like a memory-mapped standard GPIO controller,
>> use drivers/gpio/gpio-generic.c with some IRQ add-on, compare
>> to any other driver selecting GPIO_GENERIC for guidance:
>> drivers/gpio/gpio-74xx-mmio.c, gpio-dwapb.c etc.
>
> You mean I must rewrite to use GPIO_GENERIC follow gpio-74xx-mmio.c,
> gpio-dwapb.c ?

Yes.

Yours,
Linus Walleij
