From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-adnp: Use common error handling code in adnp_gpio_dbg_show()
Date: Tue, 31 Oct 2017 10:09:43 +0100
Message-ID: <CACRpkdaz3QLYmA4AkUUZ1Hr0un9a0bub1isJ24Nh_JkwR=W3Qg@mail.gmail.com>
References: <1e2fb84c-9a5b-dc56-c93b-7eef03fc9b7a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:53870 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751409AbdJaJJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 05:09:44 -0400
Received: by mail-io0-f196.google.com with SMTP id 189so33454330iow.10
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 02:09:44 -0700 (PDT)
In-Reply-To: <1e2fb84c-9a5b-dc56-c93b-7eef03fc9b7a@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Oct 22, 2017 at 8:27 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 20:21:55 +0200
>
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

That's a nice patch.
Patch applied.

Yours,
Linus Walleij
