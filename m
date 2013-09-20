From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: ucb1400: Can be built as a module
Date: Fri, 20 Sep 2013 22:21:56 +0200
Message-ID: <CACRpkdZ3Q2UZW94d0svS5W2TnbLLr1vL9m0bVZ6yokyFG1MZUA@mail.gmail.com>
References: <20130913214148.317c8b20@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:37962 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755034Ab3ITUV5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:21:57 -0400
Received: by mail-ob0-f178.google.com with SMTP id uy5so1150121obc.23
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 13:21:57 -0700 (PDT)
In-Reply-To: <20130913214148.317c8b20@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 13, 2013 at 9:41 PM, Jean Delvare <jdelvare@suse.de> wrote:

> With the recent code cleanup from Marek Vasut, driver gpio-ucb1400 can
> be built as a module, so change symbol GPIO_UCB1400 from bool to
> tristate.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied!

> I know the first attempt to merge this caused some trouble but that was
> several months ago, I think it is about time now.

Yeah, we have changed our routines: I have the kautobuilder swearing
at me if something happens these days...

Yours,
Linus Walleij
