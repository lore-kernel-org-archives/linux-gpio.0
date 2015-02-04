From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Configure HiZ pins to be input when
 requested as GPIOs
Date: Wed, 4 Feb 2015 17:37:56 +0200
Message-ID: <20150204153756.GJ18758@lahna.fi.intel.com>
References: <1422528288-84076-1-git-send-email-mika.westerberg@linux.intel.com>
 <CACRpkdYBnE18CJ6DZDnRQxJi9XEpVdE3UTcAqwCgrb8ewPR3jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:63930 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966573AbbBDPiA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Feb 2015 10:38:00 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYBnE18CJ6DZDnRQxJi9XEpVdE3UTcAqwCgrb8ewPR3jQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jerome Blin <jerome.blin@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 04, 2015 at 10:01:49AM +0100, Linus Walleij wrote:
> On Thu, Jan 29, 2015 at 11:44 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > If the pin is in HiZ mode when it is requested as GPIO its value cannot be
> > read (it always returns 0). In order to cope with the Linux GPIO subsystem
> > where we do not have such state at all, turn the pin to be input instead.
> >
> > Reported-by: Jerome Blin <jerome.blin@intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Patch applied.

Thanks.

> Since putting a pin into GPIO mode start poking around in essentially pin
> control registers, we may need to revisit the issue of the pin control subsystem
> not denying simultaneous use of a pin for a device muxing and GPIO.
> Maybe the "strict" setting forcing a pin to be either one or the other on
> a per-driver basis would enforce a better policy on this driver (and some
> others).

Yes, something like that sounds reasonable.
