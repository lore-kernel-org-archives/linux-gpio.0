From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix uninitialized variable warning
Date: Thu, 24 Dec 2015 10:07:55 +0100
Message-ID: <CACRpkdbgepNZtjyE1Y_5KXjR+d7hakTSecqk0VWX+kMeFhOcAQ@mail.gmail.com>
References: <1450907177-31529-1-git-send-email-ross.zwisler@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33919 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752948AbbLXJH4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 04:07:56 -0500
Received: by mail-ob0-f177.google.com with SMTP id iw8so181096849obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 01:07:56 -0800 (PST)
In-Reply-To: <1450907177-31529-1-git-send-email-ross.zwisler@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ross Zwisler <ross.zwisler@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 23, 2015 at 10:46 PM, Ross Zwisler
<ross.zwisler@linux.intel.com> wrote:

> Commit ef7c7553039b ("gpiolib: improve overlap check of range of gpio=
")
> introduced the following compiler warning:
>
> drivers/gpio/gpiolib.c: In function =E2=80=98gpiochip_add=E2=80=99:
> drivers/gpio/gpiolib.c:193:20: warning: =E2=80=98iterator=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
>   struct gpio_chip *iterator;
>                     ^
>
> Fix this by initializing 'iterator' to NULL.
>
> Signed-off-by: Ross Zwisler <ross.zwisler@linux.intel.com>
> ---
>
> This was found in next-20151223.

Several people reported this and I was waiting for a proper
fix from Bamvor (as it is a false compile warning and doesn't
really indicate a real error) but now I'll apply this to
get rid of all the reports and patches filling my mailbox...

Merry Christmas!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
