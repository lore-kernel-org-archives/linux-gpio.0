From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: "gpio-line-names" property - issue with commit 9427ecbed46cc
Date: Fri, 15 Dec 2017 13:31:54 +0100
Message-ID: <CACRpkdZmGdRdkBZpe=67gEbzk5MU1BosUFwBNrb=e7BYOos-yw@mail.gmail.com>
References: <f0bcfd45-a5ac-fce8-2666-ece34c0268ea@c-s.fr> <CACRpkdY22=f0FYVw0AD7eYiyxa6dSNZA8aa6hbyzxZ1wV4bjeA@mail.gmail.com>
 <20171215100827.GU22431@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:46974 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755073AbdLOMbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Dec 2017 07:31:55 -0500
Received: by mail-it0-f41.google.com with SMTP id t1so19103805ite.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2017 04:31:55 -0800 (PST)
In-Reply-To: <20171215100827.GU22431@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Christophe LEROY <christophe.leroy@c-s.fr>, linux-gpio@vger.kernel.org

On Fri, Dec 15, 2017 at 11:08 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Dec 14, 2017 at 02:37:07PM +0100, Linus Walleij wrote:

>> Looking forward to good ideas on how to solve this!
>
> I think we can fix this by passing struct fwnode_handle to
> devprop_gpiochip_set_names(). Then the existing drivers don't need to be
> changed and we update of_gpiochip_add() to call it like:
>
>   devprop_gpiochip_set_names(chip, of_fwnode_handle(chip->of_node));
>
> or so.
>
>> Mika: is is possible to revert this without breaking something else, if we
>> need to?
>
> It breaks ACPI "gpio-line-names" users but I think we don't need to
> revert if if do what I'm proposing above :)

OK let's try that!

Looking forward to your patch. (I hope.)

Yours,
Linus Walleij
