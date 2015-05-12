From: Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH] pinctrl: baytrail: explicitly set gpio chip base
Date: Tue, 12 May 2015 15:07:40 +0200
Message-ID: <20150512150740.b9250662ff44f2d4d35527e0@ao2.it>
References: <1430298162-20238-1-git-send-email-ao2@ao2.it>
	<20150430110237.GV1534@lahna.fi.intel.com>
	<20150430235141.2928e7fa8a193437346b76aa@ao2.it>
	<20150504104000.GZ1534@lahna.fi.intel.com>
	<20150504133646.391d1f3897ec2d51493ac28a@ao2.it>
	<CACRpkdabi+QbExbm2NFNKUwH+2rAeCKEstnQ=ffSnK+GBiNq+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp205.alice.it ([82.57.200.101]:54167 "EHLO smtp205.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932339AbbELNHq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 May 2015 09:07:46 -0400
In-Reply-To: <CACRpkdabi+QbExbm2NFNKUwH+2rAeCKEstnQ=ffSnK+GBiNq+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Tue, 12 May 2015 09:48:12 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, May 4, 2015 at 1:36 PM, Antonio Ospite <ao2@ao2.it> wrote:
> > On Mon, 4 May 2015 13:40:00 +0300 Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> >> Well, if you happen to have another GPIO chip (a GPIO expander for
> >> example) and it somehow gets loaded before this driver. It may take the
> >> range you have reserved for the BYT driver.
> >>
> >> Not sure how realistic case that is, though...
> >
> > Indeed, being this for the SoC gpio controller I thought it was
> > unlikely, however I do not have a huge experience on these matters.
> >
> > I have no strong opinion on this, Mika, so whether or not you merge the
> > change it'll be fine by me.
> 
> The ability to set .base is basically there for legacy reasons,
> and the critical legacy case is usually when setting it to 0
> for the on-SoC GPIO.
>
> In the long run we want to get rid of static GPIO numbers
> altogether so I prefer if you construct your userspace to
> traverse sysfs to get the GPIOs you need to get at,
> sysfs is horrible and unreliable for GPIO.
> 

OK, if the use of static .base is deprecated my patch is inappropriate,
I self-NACK it and we can close this thread.

Thanks for the replies,
   Antonio

-- 
Antonio Ospite
http://ao2.it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
