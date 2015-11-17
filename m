From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 2/2] gpiolib: do not allow to insert an empty gpiochip
Date: Tue, 17 Nov 2015 15:16:14 +0100
Message-ID: <CACRpkdY6_V6_CtW7zoZUJPrKGhuE6gGL9S8rBzSkAdSuhL=cOg@mail.gmail.com>
References: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447650167-29070-3-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36476 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbKQOQO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:16:14 -0500
Received: by oiww189 with SMTP id w189so5354291oiw.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:16:14 -0800 (PST)
In-Reply-To: <1447650167-29070-3-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Mon, Nov 16, 2015 at 6:02 AM, Bamvor Jian Zhang
<bamvor.zhangjian@linaro.org> wrote:

> We need to check if number of gpio is positive if there is no
> such check in devicetree or acpi or whatever called before
> gpiochip_add.
>
> I suppose that devicetree and acpi do not allow insert gpiochip
> with zero number but I do not know if it is enough to ignore
> this check in gpiochip_add.
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Patch applied.

Yours,
Linus Walleij
