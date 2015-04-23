From: Johan Hovold <johan@kernel.org>
Subject: Re: gpiolib, gpio removal while a gpio in-use
Date: Thu, 23 Apr 2015 09:15:00 +0200
Message-ID: <20150423071500.GA1136@localhost>
References: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
 <20150422162933.GE16828@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:35259 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755617AbbDWHPA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2015 03:15:00 -0400
Received: by labbd9 with SMTP id bd9so6310555lab.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2015 00:14:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150422162933.GE16828@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Frkuska, Joshua" <Joshua_Frkuska@mentor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 22, 2015 at 06:29:33PM +0200, Johan Hovold wrote:
> On Tue, Mar 17, 2015 at 02:59:08AM +0000, Frkuska, Joshua wrote:
> > Hello,
> > 
> > In 3.18, the upstream commit e1db1706c8 made it acceptable to remove
> > gpio chips that were in use in exchange for a critical message. The
> > reasoning from what I gathered from the mailing list was to avoid
> > handling errors in the device remove handler. The justification was
> > that the error seemed unused by most drivers and there was a compiler
> > warning when ignoring the return value.
> >
> > At a higher level, this is a gpio handling policy shift. Previously
> > the behavior was to result in an error and disallow the gpio device to
> > be removed. Then starting at 3.18, it becomes ok to free a gpio device
> > regardless of whatever the (possibly critical) gpio may be doing as
> > long as a critical message is displayed.
> 
> It still isn't acceptable to remove a gpio chip with requested gpios as
> it will lead to memory leaks (even though the most pre-3.18 crashes have
> been fixed).

To clarify: the memory leaks are primarily related to sysfs.

The major issue is of course the crashes when attempting to call into
chip drivers whose device state is likely deallocated with descriptors
and chip structures that also have or could have been freed (e.g. as in
your i2c example). This only affects in-kernel consumers using the
gpiod-interface.

So to summarise: Using a requested gpio post chip-removal is not
supported.

Johan
