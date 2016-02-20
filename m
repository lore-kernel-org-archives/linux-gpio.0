From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix crash when gpiochip removed
Date: Sat, 20 Feb 2016 12:52:29 +0100
Message-ID: <CACRpkdas0VHy0YV2i0ubpWo+EXSejythrfiZG=meH0XaihvD+g@mail.gmail.com>
References: <1455945199-5068-1-git-send-email-bamv2005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33922 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbcBTLwa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2016 06:52:30 -0500
Received: by mail-ob0-f169.google.com with SMTP id ts10so14613236obc.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2016 03:52:29 -0800 (PST)
In-Reply-To: <1455945199-5068-1-git-send-email-bamv2005@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

On Sat, Feb 20, 2016 at 6:13 AM, Bamvor Jian Zhang <bamv2005@gmail.com> wrote:

> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> Commit cb464a88e1ed ("gpio: make the gpiochip a real device") call
> gpiochip_sysfs_unregister after the gpiochip is empty. It lead to the
> following crash:

Patch applied.
Thanks for fixing my screw-ups!

Yours,
Linus Walleij
