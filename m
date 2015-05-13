From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: cleanup chained handler and data
Date: Wed, 13 May 2015 13:05:27 +0200
Message-ID: <CACRpkdajxws-NupdX3wZsAYavGYdzA6MhPjg1aD3+-PoutyJGA@mail.gmail.com>
References: <1431450743-25528-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33763 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955AbbEMLF2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 07:05:28 -0400
Received: by obblk2 with SMTP id lk2so26832489obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 04:05:27 -0700 (PDT)
In-Reply-To: <1431450743-25528-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 12, 2015 at 7:12 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:

> Clean up chained handler and handler data if they were set by
> gpiochip_set_chained_irqchip().
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Yep exactly like this :)

Patch applied!

Yours,
Linus Walleij
