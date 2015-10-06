From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Tue, 6 Oct 2015 15:09:19 +0100
Message-ID: <20151006140919.GF25143@localhost>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
 <CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
 <20151005100147.GB25143@localhost>
 <CACRpkdZBw7ayenkRTtpQH==G64TGNEXv6DgzdRAZxCCHJUZuRg@mail.gmail.com>
 <20151006091316.GK19355@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35994 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795AbbJFOIB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 10:08:01 -0400
Received: by wicgb1 with SMTP id gb1so167278055wic.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2015 07:08:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151006091316.GK19355@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Oct 06, 2015 at 11:13:16AM +0200, Markus Pargmann wrote:
> On Mon, Oct 05, 2015 at 01:07:09PM +0200, Linus Walleij wrote:
> > On Mon, Oct 5, 2015 at 12:01 PM, Johan Hovold <johan@kernel.org> wrote:
> > 
> > >> I think it is ABI-correct: it uses desc->name if that is set, and
> > >> currently that is only set from chip->names[] so status quo.
> > >
> > > Yes, but this work was aiming at generalising the hogs so that they
> > > could later be requested (and exported), right?
> > 
> > Yeah something like so... thinking about it we should indeed
> > takes the names directly from chip->names[] for this, so we
> > can use the name field in the gpio descriptor for the "real"
> > chardev interface later.
> 
> So what is this "real" chardev interface all about? What are the
> requirements and features for such an interface? How is it supposed to
> work? Was this already discussed somewhere?

It has been discussed in various threads, often when someone proposes to
tweak the current sysfs interface to cater to their specific needs.

Several people have expressed ideas, but no more formal proposal for a
new userspace interface has been put forward yet. Since this will also
become ABI we need to get it right (this time).

> Any chance that you both are at the ELCE?

I'm here, but not Linus. I'll see if I can spot you.

Johan
