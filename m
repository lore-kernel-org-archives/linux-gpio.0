From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Sat, 29 Jul 2017 22:15:14 +0300
Message-ID: <4c03d43e-b10e-77bc-841e-f98a13d0d84c@cogentembedded.com>
References: <20170729180744.873303067@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:38681 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750847AbdG2TPS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2017 15:15:18 -0400
Received: by mail-lf0-f47.google.com with SMTP id y15so101322702lfd.5
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2017 12:15:17 -0700 (PDT)
In-Reply-To: <20170729180744.873303067@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

On 07/29/2017 09:07 PM, Sergei Shtylyov wrote:

> of_irq_to_resource() has recently been fixed to return negative error #'s
> along with 0 in case of failure, however the ST driver still only regards
> 0 as failure indication -- fix it up.
>
> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

    Forgot to mention that the patch is against the 'fixes' branch of Linus 
W.'s 'linux-pinctrl.git' repo.

MBR, Sergei

