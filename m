From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH 6/7 v2] gpio: dwapb: use a second irq chip
Date: Mon, 26 May 2014 23:02:58 +0200
Message-ID: <20140526210258.GA5967@breakpoint.cc>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
 <1395505004-22650-7-git-send-email-bigeasy@linutronix.de>
 <5331F6D5.7070809@gmail.com>
 <53427718.30406@linutronix.de>
 <CANk1AXSuBGj3vZ7knKmHTwDZLTkvVFT42Lt9ZTdk-E+sp=xQ+g@mail.gmail.com>
 <20140430111308.GA11829@linutronix.de>
 <CACRpkdY=oVyBCwRkppq11B0tkn2bMw+-h_fDhy538eatVUJ=pQ@mail.gmail.com>
 <537DC6A1.3090206@linutronix.de>
 <CANk1AXSAKhOYuBeNgVJRXnYV_9cEmAhy+DSR3WXmWwFGGe4y7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Chamillionaire.breakpoint.cc ([80.244.247.6]:41278 "EHLO
	Chamillionaire.breakpoint.cc" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751232AbaEZVDG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 26 May 2014 17:03:06 -0400
Content-Disposition: inline
In-Reply-To: <CANk1AXSAKhOYuBeNgVJRXnYV_9cEmAhy+DSR3WXmWwFGGe4y7w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On 2014-05-22 09:08:20 [-0500], Alan Tull wrote:
> >> - int err, irq;
> >> + int err, irq, i;
> >> =20
> >>   irq =3D irq_of_parse_and_map(node, 0);
> >>
> >> Notice spurious =20 and =3D encoding.
> >>
> >> Please resend in ISO8859-1 and take this opportunity to add
> >
> > doesn't "git am" handle this on its own?
> 
> Neither 'git am' nor 'patch -p1' can apply this patch.  When I was
> testing it, I assumed those '=3D' were  a product of my webmail, so I
> manually edited the patch to get it to apply.

I've resent the email now.
btw: I used mutt to save the email I've sent and applied to git tree with
git-am and it did not complain about the encoding. Then I looked at the the
I email I received from vger and it was
|Content-Type: text/plain; charset=utf-8
|Content-Disposition: inline
|Content-Transfer-Encoding: 8BIT
so I did not receive the =20 & =3D in it.

> Alan

Sebastian
