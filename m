From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: fix missing first irq for edgeboth irq type
Date: Tue, 20 Jun 2017 13:34:49 +0200
Message-ID: <CACRpkdapkjs3UtKmhJPzNrdav4T=cHzBsThWV_T11N+bxf+W=g@mail.gmail.com>
References: <20170601232715.2788-1-xgchenshy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:35000 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750925AbdFTLev (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 07:34:51 -0400
Received: by mail-io0-f169.google.com with SMTP id k93so82464587ioi.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 04:34:51 -0700 (PDT)
In-Reply-To: <20170601232715.2788-1-xgchenshy@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Xiaoguang Chen <xgchenshy@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Jun 2, 2017 at 1:27 AM,  <xgchenshy@gmail.com> wrote:

> From: Xiaoguang Chen <xgchenshy@gmail.com>
>
> dwapb_irq_set_type overwrites polarity register value for
> IRQ_TYPE_EDGE_BOTH case. If the polarity of one gpio is 0
> by default, then it will set falling edge irq trigger.
> and the gpio may requires rising edge irq for the first time,
> and it will be missed.
>
> Do not overwrite polarity register for IRQ_TYPE_EDGE_BOTH case
> can solve this issue.
>
> Signed-off-by: Xiaoguang Chen <xgchenshy@gmail.com>

Patch applied with Jisheng's tested tag.

Yours,
Linus Walleij
