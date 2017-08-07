From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Mon, 7 Aug 2017 12:56:14 +0300
Message-ID: <7c73ec8f-c261-d92b-637d-8383d56750b1@cogentembedded.com>
References: <20170729180744.873303067@cogentembedded.com>
 <CACRpkdbLTr+zcwXaanr2HJHp=e-AauDx_hZ=dd4zjmAKsRdOtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:34297 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752656AbdHGJ4R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:56:17 -0400
Received: by mail-lf0-f42.google.com with SMTP id g25so27884117lfh.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:56:16 -0700 (PDT)
In-Reply-To: <CACRpkdbLTr+zcwXaanr2HJHp=e-AauDx_hZ=dd4zjmAKsRdOtQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 8/7/2017 12:05 PM, Linus Walleij wrote:

>> of_irq_to_resource() has recently been fixed to return negative error #'s
>> along with 0 in case of failure, however the ST driver still only regards
>> 0 as failure indication -- fix it up.
>>
>> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Patch applied.

    Again, not seeing it...

> Yours,
> Linus Walleij

MBR, Sergei
