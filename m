From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Cocci] Warning masked by BUG() when CONFIG_BUG is enabled
Date: Sun, 17 Nov 2013 15:47:52 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311171547130.2013@localhost6.localdomain6>
References: <87a9h4559j.fsf@natisbad.org> <20131117140627.GA6744@katana>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:44223
	"EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753482Ab3KQOr5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 17 Nov 2013 09:47:57 -0500
In-Reply-To: <20131117140627.GA6744@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Arnaud Ebalard <arno@natisbad.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

> > As a side note, I noticed quite some instances of that pattern (switch
> > statement w/ a 'default' calling BUG()) while more carefully looking at
> > compilation output. I may get slapped for this, but just in case this
> > is indeed something which deserves to be fixed and can be fixed
> > automagically via some semantic patch, I have CC'ed Coccinelle people.
> 
> I don't think this can be fixed in a generic way. This driver, for
> example, should IMO return -EINVAL when hitting default in probe and
> simply get rid of the other BUG() calls. No need to halt the kernel
> because of a broken match->data.

One could nevertheless perhaps use Coccinelle to find them, if there is 
some possibility to fix them.

julia
