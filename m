From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH -next] gpio: Fix return value check in xgene_gpio_probe()
Date: Fri, 19 Sep 2014 17:40:30 +0900
Message-ID: <CAAVeFu+aVzSy1HaoeOyeaJ2=ArjOctgEOLdp-i7Q66muZ7E5tw@mail.gmail.com>
References: <1410477134-5556-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:49205 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbaISIkw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Sep 2014 04:40:52 -0400
Received: by mail-ie0-f172.google.com with SMTP id rp18so1037969iec.17
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2014 01:40:52 -0700 (PDT)
In-Reply-To: <1410477134-5556-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 12, 2014 at 8:12 AM,  <weiyj_lk@163.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_ioremap_nocache() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
