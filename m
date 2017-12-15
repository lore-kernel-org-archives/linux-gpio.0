From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: "gpio-line-names" property - issue with commit 9427ecbed46cc
Date: Fri, 15 Dec 2017 12:08:27 +0200
Message-ID: <20171215100827.GU22431@lahna.fi.intel.com>
References: <f0bcfd45-a5ac-fce8-2666-ece34c0268ea@c-s.fr>
 <CACRpkdY22=f0FYVw0AD7eYiyxa6dSNZA8aa6hbyzxZ1wV4bjeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:43634 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756229AbdLOKRP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Dec 2017 05:17:15 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdY22=f0FYVw0AD7eYiyxa6dSNZA8aa6hbyzxZ1wV4bjeA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christophe LEROY <christophe.leroy@c-s.fr>, linux-gpio@vger.kernel.org

On Thu, Dec 14, 2017 at 02:37:07PM +0100, Linus Walleij wrote:
> On Thu, Dec 14, 2017 at 12:54 PM, Christophe LEROY
> <christophe.leroy@c-s.fr> wrote:
> 
> > Why is it necessary now to set a parent to the GPIO chip whereas it was not
> > necessary before ?
> (...)
> > Is there an easy modification that can be done to your new function
> > devprop_gpiochip_set_names() in order to have the GPIO drivers work as
> > before ?
> 
> I am also worried about this.
> 
> I have felt that the device property paradigm is too ambitious and assume
> too much about the subtle semantic differences between DT and ACPI
> DSDT. But maybe I'm just whiney.
> 
> Looking forward to good ideas on how to solve this!

I think we can fix this by passing struct fwnode_handle to
devprop_gpiochip_set_names(). Then the existing drivers don't need to be
changed and we update of_gpiochip_add() to call it like:

  devprop_gpiochip_set_names(chip, of_fwnode_handle(chip->of_node));

or so.

> Mika: is is possible to revert this without breaking something else, if we
> need to?

It breaks ACPI "gpio-line-names" users but I think we don't need to
revert if if do what I'm proposing above :)
