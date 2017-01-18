From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 5/5] gpio: davinci: Remove custom .xlate
Date: Thu, 19 Jan 2017 00:24:28 +0100
Message-ID: <CACRpkdaUcrLFkP_Csvg4B_OaCnWcSTbfTahq00VMpZpKQPQ_0Q@mail.gmail.com>
References: <1484670554-6392-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:35370 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbdARXav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 18:30:51 -0500
Received: by mail-qt0-f170.google.com with SMTP id x49so37571886qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 15:30:51 -0800 (PST)
In-Reply-To: <1484670554-6392-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tero Kristo <t-kristo@ti.com>

On Tue, Jan 17, 2017 at 5:29 PM, Keerthy <j-keerthy@ti.com> wrote:

> With the current redesign of driver it's not necessary to have
> custom .xlate() as the gpiolib will assign default of_gpio_simple_xlate().
>
> Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
