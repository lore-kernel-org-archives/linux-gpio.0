From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tps65086: Add GPO driver for the TPS65086 PMIC
Date: Tue, 16 Feb 2016 00:09:45 +0100
Message-ID: <CACRpkdZETCvNX9azTH-e=4QsOgsqw3hRXaAtFMEPRTZ5OfH-uw@mail.gmail.com>
References: <1454775130-15995-1-git-send-email-afd@ti.com>
	<CACRpkdZqe6gBoPMq0otn13HFx0pHGij0em1KD6BS6bNLFE_Vdg@mail.gmail.com>
	<20160211092043.GF3782@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33111 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581AbcBOXJq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 18:09:46 -0500
Received: by mail-ob0-f182.google.com with SMTP id jq7so48522188obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 15:09:46 -0800 (PST)
In-Reply-To: <20160211092043.GF3782@x1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 11, 2016 at 10:20 AM, Lee Jones <lee.jones@linaro.org> wrote:

> Very well, applied.
>
> I also know Linus W likes dicing with death, so this is going into my
> main branch.  As this is a new driver, it shouldn't be an issue;

Haha as long as there are no collisions in Makefile or Kconfig it
should work out just fine I think.

If something blows up in -next we can set up an immutable branch.

Yours,
Linus Walleij
