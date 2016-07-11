From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: ns2: fix return value check in ns2_pinmux_probe()
Date: Mon, 11 Jul 2016 09:50:36 +0200
Message-ID: <CACRpkdZEj_SLNy-czjCfBmvYz7+bPJ-QPT8AfwX9nfQ4DJHemQ@mail.gmail.com>
References: <1467807461-31096-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36464 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751421AbcGKHuh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 03:50:37 -0400
Received: by mail-oi0-f51.google.com with SMTP id n8so34734228oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 00:50:37 -0700 (PDT)
In-Reply-To: <1467807461-31096-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jul 6, 2016 at 2:17 PM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function pinctrl_register() returns
> NULL not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
