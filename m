From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: tb10x: use module_platform_driver to simplify
 the code
Date: Wed, 30 Oct 2013 11:26:52 -0700
Message-ID: <CACRpkdaNcOXx3L4cSbiNwZ5Tj6N6ZqhnCqfcX4-kYx82ceH=gw@mail.gmail.com>
References: <CAPgLHd-sfR=W6DV=eu4VsuWN0b6WxBvXPnSuWvWZVbAGTXAaWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:36539 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865Ab3J3S0w (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 14:26:52 -0400
Received: by mail-oa0-f48.google.com with SMTP id m17so1891293oag.35
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 11:26:52 -0700 (PDT)
In-Reply-To: <CAPgLHd-sfR=W6DV=eu4VsuWN0b6WxBvXPnSuWvWZVbAGTXAaWA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 29, 2013 at 8:08 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> module_platform_driver() makes the code simpler by eliminating
> boilerplate code.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied, thanks Wei!

Yours,
Linus Walleij
