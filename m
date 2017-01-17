From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: davinci: Redesign driver to accommodate ngpios
 in one gpio chip
Date: Tue, 17 Jan 2017 15:52:40 +0100
Message-ID: <CACRpkdbXZ3ZCLAUz-2WfVvMx5H2kaDVCOoJAX=zHhNFv5z-zpQ@mail.gmail.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:33016 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751183AbdAQOwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2017 09:52:41 -0500
Received: by mail-qt0-f176.google.com with SMTP id v23so160948431qtb.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2017 06:52:41 -0800 (PST)
In-Reply-To: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>

On Wed, Jan 11, 2017 at 6:00 AM, Keerthy <j-keerthy@ti.com> wrote:

> The Davinci GPIO driver is implemented to work with one monolithic
> Davinci GPIO platform device which may have up to Y(144) gpios.

I'm a bit confused by the different DaVinci series since there seem
to be different series floating and I don't know what order to apply them,
it fails for me.

Can you:

- Rebase *ALL* your DaVinci work on top of the "devel" branch in the
  GPIO tree.

- Repost *ALL* patches that should be applied, in one batch.

- Include any accumulated ACKs etc.

Yours,
Linus Walleij
