From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: clear irq handler and data in one go
Date: Thu, 19 Oct 2017 16:32:23 +0200
Message-ID: <CACRpkdaF7NNApzOEHP8PkLQD1BDEFgx6536tJJM+SeX1EOp0xA@mail.gmail.com>
References: <1508344367-572-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:52067 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753711AbdJSOcZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 10:32:25 -0400
Received: by mail-it0-f68.google.com with SMTP id o135so9972906itb.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2017 07:32:25 -0700 (PDT)
In-Reply-To: <1508344367-572-1-git-send-email-martin@kaiser.cx>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Oct 18, 2017 at 6:32 PM, Martin Kaiser <martin@kaiser.cx> wrote:

> Replace the two separate calls for clearing the irqchip's chained handler
> and its data with a single irq_set_chained_handler_and_data() call.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Patch applied.

Yours,
Linus Walleij
