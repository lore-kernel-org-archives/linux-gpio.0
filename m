From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 07/23] gpio: sysfs: rename gpiochip registration functions
Date: Mon, 27 Apr 2015 10:27:53 +0200
Message-ID: <20150427082753.GB27877@localhost>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
 <1429630951-27082-8-git-send-email-johan@kernel.org>
 <CAAVeFuLOwa53YgcHVj9uGa+KLpV2Et-iEAwKEK3vhtJgQSJH4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:32836 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752696AbbD0I1y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 04:27:54 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuLOwa53YgcHVj9uGa+KLpV2Et-iEAwKEK3vhtJgQSJH4Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 27, 2015 at 12:54:36PM +0900, Alexandre Courbot wrote:
> On Wed, Apr 22, 2015 at 12:42 AM, Johan Hovold <johan@kernel.org> wrote:
> > Rename the gpio-chip export/unexport functions to the more descriptive
> > names gpiochip_register and gpiochip_unregister.
> 
> Since these functions are related to sysfs, wouldn't
> gpiochip_sysfs_export (or gpiochip_sysfs_register, although the former
> sounds better to me) be even more descriptive?

I'm trying to get rid of the made up notion of "exporting" things. What
we are doing is to register devices with driver core, and that involves
a representation is sysfs.

Eventually, a gpio chip should always be registered with driver core and
this is not directly related to the (by then hopefully legacy)
sysfs-interface.

> The renaming should probably also cover the non-static gpiod_*
> functions of gpiolib-sysfs.c which are equally ambiguous. Basically
> anything non-static from gpiolib-sysfs.c should have that prefix.

This would be a different change, and some of those functions are also
part of the consumer API.

Johan
