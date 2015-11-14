From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: do not allow to insert an empty gpiochip
Date: Sat, 14 Nov 2015 12:03:37 +0100
Message-ID: <CACRpkdY1uMrEdbMYNGd1vrwntRd2GgvwHWi5Qe1S2M0YVqC+Qw@mail.gmail.com>
References: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447490336-10209-3-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33427 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbbKNLDi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 06:03:38 -0500
Received: by obbww6 with SMTP id ww6so91993653obb.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 03:03:37 -0800 (PST)
In-Reply-To: <1447490336-10209-3-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Sat, Nov 14, 2015 at 9:38 AM, Bamvor Jian Zhang
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

> +       if (chip->ngpio == 0)
> +               return -EINVAL;

Print a warning with chip_err(chip, "tried to insert a GPIO chip with
zero lines\n");

Yours,
Linus Walleij
