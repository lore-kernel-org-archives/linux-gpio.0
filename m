From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: gpiolib: sysfs: high can be any nonzero
 value
Date: Sat, 2 May 2015 18:36:46 +0200
Message-ID: <20150502163646.GA16086@kroah.com>
References: <1429720786-6277-1-git-send-email-dirk.behme@gmail.com>
 <20150422171024.GF16828@localhost>
 <55380ECE.4040805@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42319 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbbEBQgy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2015 12:36:54 -0400
Content-Disposition: inline
In-Reply-To: <55380ECE.4040805@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Johan Hovold <johan@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Apr 23, 2015 at 12:12:46AM +0300, Vladimir Zapolskiy wrote:
> Hi Greg,
> 
> On 22.04.2015 20:10, Johan Hovold wrote:
> > On Wed, Apr 22, 2015 at 06:39:46PM +0200, Dirk Behme wrote:
> >> With the commit 79a9becda8940d ("gpiolib: export descriptor-based
> >> GPIO interface") the gpiolib can return any nonzero value for high.
> >> Not only 1. Correct this in the documentation.
> > 
> > As _gpiod_get_raw_value returns a bool, I fail to see how that could
> > happen.
> > 
> > Ah, that was fixed by commit 23600969ff13 ("gpio: clamp returned values
> > to the boolean range") in 3.15.
> > 
> > Looks like that one should be backported to 3.14 instead.
> > 
> 
> I tested that 23600969ff13 clearly applies to 3.14.y and I confirm that
> it fixes the problem.
> 
> Would it be possible for you to backport this commit to LTS 3.14.y,
> since it fixes quite critical sysfs API regression? Or should I send the
> patch to stable@vger.kernel.org ?

Normally always send this type of thing to stable@vger, but I've now
picked it up, thanks.

greg k-h
