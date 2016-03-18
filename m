From: YD Tseng <ltyu101@gmail.com>
Subject: Re: [PATCH RFT] gpio: amdpt: Convert to use gpio-generic
Date: Fri, 18 Mar 2016 17:49:34 +0800
Message-ID: <1458294574-3959-1-git-send-email-yd_tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35425 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757086AbcCRJuP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 05:50:15 -0400
Received: by mail-pf0-f194.google.com with SMTP id u190so15583254pfb.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2016 02:50:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, axel.lin@ingics.com, varkab@cdac.in, pramod.gurav@smartplayin.com, dbaryshkov@gmail.com, Ken.Xue@amd.com
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

From: YD Tseng <Yd_Tseng@asmedia.com.tw>

>Use gpio-generic to simplify this driver.
>
>Signed-off-by: Axel Lin <axel.lin@ingics.com>
>---
>Hi YD,
>I don't have this h/w for test.
>I'd appreciate if you can help to review and test this patch.
>
>Thanks.

We confirm the new patch, it runs well with the AMD Promontory chip.

Regards,
YD Tseng

