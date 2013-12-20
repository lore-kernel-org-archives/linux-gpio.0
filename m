From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sodaville: fix some error return code on error path
Date: Fri, 20 Dec 2013 10:23:41 +0100
Message-ID: <CACRpkdaZtxWBbvWhGCo-vOwH9Yuuo0x2+Wc7r+wv8A2h4+afXA@mail.gmail.com>
References: <CAPgLHd8H6_-RwiQDwSVYo-wmyBOEQnJP7TFXdJa3JuW-nAvNDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:46340 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755651Ab3LTJXm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:23:42 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so2530335oag.21
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:23:41 -0800 (PST)
In-Reply-To: <CAPgLHd8H6_-RwiQDwSVYo-wmyBOEQnJP7TFXdJa3JuW-nAvNDw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 16, 2013 at 6:52 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return a negative error code from the error handling
> case instead of 0.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.

Yours,
Linus Walleij
