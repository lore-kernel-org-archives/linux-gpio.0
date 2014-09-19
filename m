From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: remove remaining users of gpiochip_remove() retval
Date: Fri, 19 Sep 2014 16:40:13 +0900
Message-ID: <CAAVeFuLTFAvAfM7YOk=c7YKqBcWOaHrpSyp1BYqA1e_GsgMx2w@mail.gmail.com>
References: <1410905534-22650-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:53229 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688AbaISHke (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Sep 2014 03:40:34 -0400
Received: by mail-ie0-f171.google.com with SMTP id rl12so2914183iec.16
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2014 00:40:34 -0700 (PDT)
In-Reply-To: <1410905534-22650-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Sep 17, 2014 at 7:12 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Some drivers accidentally still use the return value from
> gpiochip_remove(). Get rid of them so we can simplify this function
> and get rid of the return value.
>
> Abdoulaye Berthe <berthe.ab@gmail.com>

Aren't you missing a CC: tag here?

Otherwise,

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
