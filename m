From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: "gpio-line-names" property - issue with commit 9427ecbed46cc
Date: Thu, 14 Dec 2017 14:37:07 +0100
Message-ID: <CACRpkdY22=f0FYVw0AD7eYiyxa6dSNZA8aa6hbyzxZ1wV4bjeA@mail.gmail.com>
References: <f0bcfd45-a5ac-fce8-2666-ece34c0268ea@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:38530 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752108AbdLNNhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 08:37:08 -0500
Received: by mail-it0-f51.google.com with SMTP id r6so11132587itr.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2017 05:37:08 -0800 (PST)
In-Reply-To: <f0bcfd45-a5ac-fce8-2666-ece34c0268ea@c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe LEROY <christophe.leroy@c-s.fr>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org

On Thu, Dec 14, 2017 at 12:54 PM, Christophe LEROY
<christophe.leroy@c-s.fr> wrote:

> Why is it necessary now to set a parent to the GPIO chip whereas it was not
> necessary before ?
(...)
> Is there an easy modification that can be done to your new function
> devprop_gpiochip_set_names() in order to have the GPIO drivers work as
> before ?

I am also worried about this.

I have felt that the device property paradigm is too ambitious and assume
too much about the subtle semantic differences between DT and ACPI
DSDT. But maybe I'm just whiney.

Looking forward to good ideas on how to solve this!

Mika: is is possible to revert this without breaking something else, if we
need to?

Yours,
Linus Walleij
