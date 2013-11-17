From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: Warning masked by BUG() when CONFIG_BUG is enabled
Date: Sun, 17 Nov 2013 01:36:52 +0100
Message-ID: <8738mvx3rv.fsf@natisbad.org>
References: <87a9h4559j.fsf@natisbad.org>
	<20131117002651.GX16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:58179 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753558Ab3KQAhV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 16 Nov 2013 19:37:21 -0500
Received: from smtp.natisbad.org (unknown [IPv6:2a01:e35:139b:9f90:221:70ff:fe55:8f78])
	by smtp3-g21.free.fr (Postfix) with ESMTP id EE35FA6185
	for <linux-gpio@vger.kernel.org>; Sun, 17 Nov 2013 01:37:10 +0100 (CET)
In-Reply-To: <20131117002651.GX16735@n2100.arm.linux.org.uk> (Russell King's
	message of "Sun, 17 Nov 2013 00:26:51 +0000")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, cocci@systeme.lip6.fr, linux-arm-kernel@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>

Hi Russell,

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

> On Sat, Nov 16, 2013 at 11:52:08PM +0100, Arnaud Ebalard wrote:
>> I was kind of curious not to have noticed it during kernel builds for
>> armada 370/xp targets. The reason is the following: on my Armada 370/XP
>> builds, I had CONFIG_BUG=y which makes BUG() call panic() (which never
>> returns).
>
> You're not the first to spot this, and you won't be the last.
>
> Some very experienced kernel hackers have tried to get this fixed and
> failed.  It seems people actually want the CPU to fall through the
> BUG() sites when people disable CONFIG_BUG - which I think is idiotic.
>
> Arnd (and myself) have worked on this problem, and we came up with a
> very nice solution which didn't increase the size of the kernel and
> didn't make things unsafe.  However, it went nowhere.
>
> It's pointless trying to get this fixed - it's just a complete waste of
> time because of politics.  Find something else to attack.  Just ensure
> you always have CONFIG_BUG enabled if you want a system which will
> produce some kind of report when one of these sites gets hit.

Understood. Thanks for the explanation.

Cheers,

a+
