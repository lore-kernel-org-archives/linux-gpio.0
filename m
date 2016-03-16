From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH RFT] gpio: amdpt: Convert to use gpio-generic
Date: Wed, 16 Mar 2016 16:29:24 +0800
Message-ID: <CAFRkauBcidtr3FQb1d6mx5zAKGy185p82mka21HWPPsRg+PFug@mail.gmail.com>
References: <1458113656-4459-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33120 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965385AbcCPI30 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 04:29:26 -0400
Received: by mail-lb0-f172.google.com with SMTP id oe12so43087730lbc.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 01:29:25 -0700 (PDT)
In-Reply-To: <1458113656-4459-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, varkab@cdac.in, pramod.gurav@smartplayin.com, dbaryshkov@gmail.com, Ken.Xue@amd.com, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

2016-03-16 15:34 GMT+08:00 YD Tseng <ltyu101@gmail.com>:
> From: YD Tseng <Yd_Tseng@asmedia.com.tw>
>
> Sorry for reply late, please add the following emails in this thread.
> yd_tseng@asmedia.com.tw
> tungyu_lu@asmedia.com.tw
>
> We will confirm the new patch. And we also need to add a new ACPI HID, AMDIF030, in the pt_gpio_acpi_match.
> Which code base should we submit for the new ID?
If you patch is just adding new ACPI HID to pt_gpio_acpi_match, I
think it's fine for
use current tree or on top of this patch. It can be applied without
conflict anyway.

Regards,
Axel
