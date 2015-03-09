From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: simplify BANK_OFF macro offset calculation
Date: Mon, 9 Mar 2015 14:42:12 +0100
Message-ID: <CACRpkdYotRboKeJ2zTc8ikEGoo=4QyaBQQ_f8VkCu+bP7g6_qQ@mail.gmail.com>
References: <1425331858-6018-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:44533 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019AbbCINmN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 09:42:13 -0400
Received: by oifu20 with SMTP id u20so29233773oif.11
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 06:42:12 -0700 (PDT)
In-Reply-To: <1425331858-6018-1-git-send-email-robh@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 2, 2015 at 10:30 PM, Rob Herring <robh@kernel.org> wrote:

> The macro BANK_OFF which calculates the base offset for each GPIO port.
> The macro is needlessly complex and unreadable. Simplify the
> calculation to a simple math operation.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied, thanks Rob.

Yours,
Linus Walleij
