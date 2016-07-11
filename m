From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: merrifield: Protect irq_ack() and
 gpio_set() by lock
Date: Mon, 11 Jul 2016 15:57:52 +0300
Message-ID: <1468241872.30123.541.camel@linux.intel.com>
References: <1468231586-104167-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <CACRpkdY+AZ-Jg0twvy4GfA_bNChbKzPu1p9uf+hD6LBnRXQvNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:21039 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751565AbcGKM5z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 08:57:55 -0400
In-Reply-To: <CACRpkdY+AZ-Jg0twvy4GfA_bNChbKzPu1p9uf+hD6LBnRXQvNg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>

On Mon, 2016-07-11 at 14:22 +0200, Linus Walleij wrote:
> On Mon, Jul 11, 2016 at 12:06 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > There is a potential race when two threads do the writes to the same
> > register
> > in parallel.
> > 
> > Prevent out of order in such case by protecting I/O access by spin
> > lock.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied.
> 
> May I convince you to send a patch adding yourself as maintainer
> for this driver in the MAINTAINERS file?

NP.
And pinctrl perhaps?

-- 

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
