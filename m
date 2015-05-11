From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: gpio-generic: add flag to read out output value
 from reg_set
Date: Mon, 11 May 2015 11:50:52 +0200
Message-ID: <CACRpkdbw_Gy5Qswp=90hwL=iOfxQSHBEk6rSRLhBKWoP6Le+LA@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-3-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35156 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752398AbbEKJux (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 05:50:53 -0400
Received: by obcus9 with SMTP id us9so66125575obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2015 02:50:52 -0700 (PDT)
In-Reply-To: <1430321701-13758-3-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> The change introduces BGPIOF_READ_OUTPUT_REG_SET flag for gpio-generic
> GPIO chip implementation, which allows to get correct configured value
> from reg_set register, input value is still get from reg_dat.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Looks reasonable. Patch applied.

Do we need device tree bindings for this?

Yours,
Linus Walleij
