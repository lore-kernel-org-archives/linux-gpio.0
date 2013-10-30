From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: tb10x: fix return value check in tb10x_gpio_probe()
Date: Wed, 30 Oct 2013 11:28:43 -0700
Message-ID: <CACRpkda35LNNvBHYUHMMsA=rURjHkE2Zo639wg+xnM3VEifa=Q@mail.gmail.com>
References: <CAPgLHd8mw0-WGdqOdBRi=AWrn6OOgQ-DSiDqsPCMxpY9CrQS_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:41458 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865Ab3J3S2o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 14:28:44 -0400
Received: by mail-ob0-f176.google.com with SMTP id uy5so1877898obc.35
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 11:28:43 -0700 (PDT)
In-Reply-To: <CAPgLHd8mw0-WGdqOdBRi=AWrn6OOgQ-DSiDqsPCMxpY9CrQS_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 29, 2013 at 8:09 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR(). Also remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
