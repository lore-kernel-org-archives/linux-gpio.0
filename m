From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: drop irq_base field from gpio_chip struct
Date: Wed, 11 Oct 2017 10:22:35 +0200
Message-ID: <CACRpkdaLWUn-YkqDAZDpq1ym-YWCyMJQx_e0RD5uj8-nnzsCOg@mail.gmail.com>
References: <20171009221605.19108-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:48588 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755556AbdJKIWg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 04:22:36 -0400
Received: by mail-it0-f49.google.com with SMTP id c3so1967101itc.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 01:22:36 -0700 (PDT)
In-Reply-To: <20171009221605.19108-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 10, 2017 at 12:16 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Hence, the last user of irq_base field was removed by commit b4c495f03ae3
> ("gpio: mockup: use irq_sim") it can be removed safely.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied. Let's see what the build servers say.

Yours,
Linus Walleij
