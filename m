From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: driver for AMD Promontory
Date: Mon, 26 Oct 2015 14:46:42 +0100
Message-ID: <CACRpkdYzAWxu0+yPvHOvjiS=XSSnbrETD2+UGamoYYPpdRuUgA@mail.gmail.com>
References: <1445224057-2775-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33968 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754040AbbJZNqn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2015 09:46:43 -0400
Received: by oies66 with SMTP id s66so100287953oie.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2015 06:46:42 -0700 (PDT)
In-Reply-To: <1445224057-2775-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Yd_Tseng@asmedia.com.tw, =?UTF-8?B?VHVuZ1l1IEx1KOWRguadseaYsSk=?= <TungYu_Lu@asmedia.com.tw>

On Mon, Oct 19, 2015 at 5:07 AM, YD Tseng <ltyu101@gmail.com> wrote:

> This patch adds a new GPIO driver for AMD Promontory chip.
>
> This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>

This looks all right now, patch applied!

Yours,
Linus Walleij
