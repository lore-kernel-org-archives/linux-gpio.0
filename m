From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Mon, 04 Jul 2016 23:30:18 +0300
Message-ID: <17900570.or1ekOzmja@avalon>
References: <1467563525-30227-1-git-send-email-johan@kernel.org> <CACRpkdYZCO9vaegXWVtbRB9pF3294FxZR3XseyXNMiHcTKZUSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34599 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725AbcGDU36 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 16:29:58 -0400
In-Reply-To: <CACRpkdYZCO9vaegXWVtbRB9pF3294FxZR3XseyXNMiHcTKZUSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday 04 Jul 2016 15:16:40 Linus Walleij wrote:
> On Sun, Jul 3, 2016 at 6:32 PM, Johan Hovold <johan@kernel.org> wrote:
> > This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.
> 
> Laurent, can we have you comment on this?
> 
> Getting close to v4.7 final so we need to quickly see if
> this is the solution or if it will cause further regressions on
> your side if I revert it...

Given that the offending patch dates from October 2015, why is the v4.7 
schedule an issue ?

-- 
Regards,

Laurent Pinchart

