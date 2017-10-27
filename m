From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add edge both type gpio irq support
Date: Fri, 27 Oct 2017 21:39:59 +0200
Message-ID: <20171027193959.GB2385@lunn.ch>
References: <20171019131003.9684-1-gregory.clement@free-electrons.com>
 <20171019133828.GC6615@lunn.ch>
 <87a80c4ukf.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:60250 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932143AbdJ0TkC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Oct 2017 15:40:02 -0400
Content-Disposition: inline
In-Reply-To: <87a80c4ukf.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Ken Ma <make@marvell.com>

Hi Gregory

> In the end I don't think it is a problem.

I think it should be clearly documented somewhere. Hardware which can
do both edges in hardware won't have this problem. If i'm using this
generic feature, i want an idea if it is mostly going to work, or
always going to work.

   Andrew
