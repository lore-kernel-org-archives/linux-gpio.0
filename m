From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Fix return value check in amd_gpio_probe()
Date: Mon, 15 Feb 2016 19:43:11 +0100
Message-ID: <CACRpkdaKhReWzQ_UOukD7AY=UFFVUOPVw7YoexM4k8YE2Zw+Nw@mail.gmail.com>
References: <1454770596-11299-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35668 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642AbcBOSnM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 13:43:12 -0500
Received: by mail-ob0-f173.google.com with SMTP id xk3so223508395obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 10:43:11 -0800 (PST)
In-Reply-To: <1454770596-11299-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 6, 2016 at 3:56 PM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_ioremap_nocache() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
