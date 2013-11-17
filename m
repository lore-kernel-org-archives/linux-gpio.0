From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Warning masked by BUG() when CONFIG_BUG is enabled
Date: Sun, 17 Nov 2013 00:26:51 +0000
Message-ID: <20131117002651.GX16735@n2100.arm.linux.org.uk>
References: <87a9h4559j.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42998 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752984Ab3KQA1i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2013 19:27:38 -0500
Content-Disposition: inline
In-Reply-To: <87a9h4559j.fsf@natisbad.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>

On Sat, Nov 16, 2013 at 11:52:08PM +0100, Arnaud Ebalard wrote:
> I was kind of curious not to have noticed it during kernel builds for
> armada 370/xp targets. The reason is the following: on my Armada 370/XP
> builds, I had CONFIG_BUG=y which makes BUG() call panic() (which never
> returns).

You're not the first to spot this, and you won't be the last.

Some very experienced kernel hackers have tried to get this fixed and
failed.  It seems people actually want the CPU to fall through the
BUG() sites when people disable CONFIG_BUG - which I think is idiotic.

Arnd (and myself) have worked on this problem, and we came up with a
very nice solution which didn't increase the size of the kernel and
didn't make things unsafe.  However, it went nowhere.

It's pointless trying to get this fixed - it's just a complete waste of
time because of politics.  Find something else to attack.  Just ensure
you always have CONFIG_BUG enabled if you want a system which will
produce some kind of report when one of these sites gets hit.
