From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] ACPI / gpio: make acpi_gpiochip_parse_own_gpio static
Date: Mon, 31 Oct 2016 09:21:52 +0100
Message-ID: <CACRpkdb_dgQEkhMtvLAeRXxSVFGCOv7kmQ-F1qVoxWn2vXZtGg@mail.gmail.com>
References: <1477757592-26645-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:33668 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762152AbcJaIVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 04:21:53 -0400
Received: by mail-qk0-f180.google.com with SMTP id v138so62856538qka.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2016 01:21:53 -0700 (PDT)
In-Reply-To: <1477757592-26645-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 29, 2016 at 6:13 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Fixes the following sparse warning:
>
> drivers/gpio/gpiolib-acpi.c:863:18: warning:
>  symbol 'acpi_gpiochip_parse_own_gpio' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
