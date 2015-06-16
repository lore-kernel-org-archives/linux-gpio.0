From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: single: support GPIO for bits pinctrl
Date: Tue, 16 Jun 2015 11:17:34 +0200
Message-ID: <CACRpkdZGqXc1+b0L==Oen54zX9SgD4kZfYC3LmdJEn_imDx3Bg@mail.gmail.com>
References: <1434097185-16464-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35485 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933091AbbFPJRf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2015 05:17:35 -0400
Received: by oiax193 with SMTP id x193so7236435oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2015 02:17:34 -0700 (PDT)
In-Reply-To: <1434097185-16464-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>, Tony Lindgren <tony@atomide.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, wan.zhijun@zte.com.cn, jason.liu@linaro.org

On Fri, Jun 12, 2015 at 10:19 AM, Jun Nie <jun.nie@linaro.org> wrote:

> Support GPIO for one register control multiple pins case
> with calculating register offset first, then bit offset.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

You need to send this patch to Tony Lindgren for review.

Yours,
Linus Walleij
