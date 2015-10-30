From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] pinctrl: baytrail: Serialize all register access
Date: Fri, 30 Oct 2015 08:26:59 -0700
Message-ID: <20151030152659.GA29070@kroah.com>
References: <1438689794-14355-1-git-send-email-mika.westerberg@linux.intel.com>
 <1438689794-14355-2-git-send-email-mika.westerberg@linux.intel.com>
 <CAKi4VAK0WcoP7CHZCrB=r_T=ywo8bcKt=_iA=Tb0mQR64HCoWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39373 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752247AbbJ3P1D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 11:27:03 -0400
Content-Disposition: inline
In-Reply-To: <CAKi4VAK0WcoP7CHZCrB=r_T=ywo8bcKt=_iA=Tb0mQR64HCoWw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Fri, Oct 30, 2015 at 12:48:38PM -0200, Lucas De Marchi wrote:
> Hi Mika and Linus,
> 
> CC'ing Greg.
> 
> On Tue, Aug 4, 2015 at 9:03 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > There is a hardware issue in Intel Baytrail where concurrent GPIO register
> > access might result reads of 0xffffffff and writes might get dropped
> > completely.
> >
> > Prevent this from happening by taking the serializing lock in all places
> > where it is possible that more than one thread might be accessing the
> > hardware concurrently.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> 
> Now that this is on 4.2, can we get it on stable branches?  I was
> hitting this bug for some time on MinnowBoard Max and this week I had
> some time to take a look on how to fix it. Good timing, it had already
> been fixed. Applying this patch the issue is gone on top of 4.1.12.
> 
> I'm using these patches from Linus Torvalds' tree:
> 39ce815 pinctrl: baytrail: Serialize all register access
> 78e1c89 pinctrl: baytrail: Use raw_spinlock for locking
> 
> 
> The ones to Cherryview could be sent too but I couldn't test them.
> 
> Leaving the patch below for reference.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
