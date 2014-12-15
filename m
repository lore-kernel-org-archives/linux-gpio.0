From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: vx855: Switch to use managed resources APIs
Date: Mon, 15 Dec 2014 17:49:49 +0900
Message-ID: <CAAVeFuJeg222ut_W8vzbPJYM+epetZZ-RFRDF2vE5PyH_7WHuw@mail.gmail.com>
References: <1418357861.1093.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:63480 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbaLOIuK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Dec 2014 03:50:10 -0500
Received: by mail-ig0-f182.google.com with SMTP id hn15so4685535igb.15
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2014 00:50:09 -0800 (PST)
In-Reply-To: <1418357861.1093.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Harald Welte <HaraldWelte@viatech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Dec 12, 2014 at 1:17 PM, Axel Lin <axel.lin@ingics.com> wrote:
> Use devm_* APIs to simplify the code a bit.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Negative line count patch is good.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
