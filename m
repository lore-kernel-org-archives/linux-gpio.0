From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/3] gpio: sysfs: fix gpio attribute-creation race
Date: Sun, 25 Jan 2015 11:16:41 +0100
Message-ID: <20150125101641.GA2465@localhost>
References: <1421150406-20255-1-git-send-email-johan@kernel.org>
 <1421150406-20255-4-git-send-email-johan@kernel.org>
 <CAAVeFuLNZuM9V+pd4HNLcfh0Levd6a5bJUOm2yKBG8YXD8h+TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:47914 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752517AbbAYKQp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jan 2015 05:16:45 -0500
Content-Disposition: inline
In-Reply-To: <CAAVeFuLNZuM9V+pd4HNLcfh0Levd6a5bJUOm2yKBG8YXD8h+TQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jan 25, 2015 at 06:33:48PM +0900, Alexandre Courbot wrote:
> On Tue, Jan 13, 2015 at 9:00 PM, Johan Hovold <johan@kernel.org> wrote:
> > Fix attribute-creation race with userspace by using the default group
> > to create also the contingent gpio device attributes.
> >
> > Fixes: d8f388d8dc8d ("gpio: sysfs interface")
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Same, this one does not apply to Linus' devel branch. :( Too bad
> because there seems to be good stuff in here.

All three patches are already in mainline.

Thanks,
Johan
