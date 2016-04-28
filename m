From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: move gpiod_set_array_value_priv()
Date: Thu, 28 Apr 2016 14:59:57 +0900
Message-ID: <CAAVeFuJHBb6qSVeckJdJQtJ93b-xvHo8CQoATsiE-TMGQxHVYA@mail.gmail.com>
References: <1461660663-17207-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:33269 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748AbcD1GAR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2016 02:00:17 -0400
Received: by mail-io0-f178.google.com with SMTP id f89so67725863ioi.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Apr 2016 23:00:17 -0700 (PDT)
In-Reply-To: <1461660663-17207-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Apr 26, 2016 at 5:51 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This renames gpiod_set_array_value_priv() to
> gpiod_set_array_value_complex() and moves it to the gpiolib.h
> private header file so we can reuse it in the subsystem.

Why "complex"?

>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
