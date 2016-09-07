From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Thu, 8 Sep 2016 00:15:55 +0200
Message-ID: <CACRpkdYwAwCs+L8OG5xBmqJ+1BwL8OyJyJuYuCB584jLxTxdag@mail.gmail.com>
References: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
 <85f4ae6f-2563-967c-1e75-28a864405f53@axentia.se> <44e8d692-832f-fbbf-2930-0cd7c140a754@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36204 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbcIGWP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 18:15:57 -0400
Received: by mail-oi0-f54.google.com with SMTP id w78so46000168oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 15:15:57 -0700 (PDT)
In-Reply-To: <44e8d692-832f-fbbf-2930-0cd7c140a754@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 6, 2016 at 10:20 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> To make a slot-in replacement, it misses the sx150x_platform_data management
> like the gpio version, I only made a pure DT version. It should be easy to add back.
>
> But I see it nowhere... is it really necessary ?

If that is not used in the kernel, don't care to support it.
We're not designing for out-of-tree usecases, and here apparently
out-of-tree patches would be needed to make use of it.

Yours,
Linus Walleij
