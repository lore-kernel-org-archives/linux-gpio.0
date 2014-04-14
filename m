From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
Date: Mon, 14 Apr 2014 17:34:14 +0900
Message-ID: <000a01cf57bc$50fefcb0$f2fcf610$%han@samsung.com>
References: <1397460641.23515.3.camel@phoenix>
 <201404141021.09250.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53206 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004AbaDNIeP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Apr 2014 04:34:15 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4000E21IH20NA0@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Mon, 14 Apr 2014 17:34:14 +0900 (KST)
In-reply-to: <201404141021.09250.jbe@pengutronix.de>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, 'Axel Lin' <axel.lin@ingics.com>
Cc: 'Juergen Beisert' <jbe@pengutronix.de>, 'Wolfram Sang' <wsa@the-dreams.de>, 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, April 14, 2014 5:21 PM, Juergen Beisert wrote:
> On Monday 14 April 2014 09:30:41 Axel Lin wrote:
> > From f52622585aeb4cf785c78548e440993a1e9625b1 Mon Sep 17 00:00:00 2001
> > From: Axel Lin <axel.lin@ingics.com>
> > Date: Mon, 14 Apr 2014 15:20:15 +0800
> > Subject: [PATCH] gpio: max730x: Remove kfree(ts) in __max730x_remove()
> >
> > The memory for ts is allocated by devm_kzalloc now, so the kfree is not
> > required.
> >
> > Signed-off-by: Axel Lin <axel.lin@ingics.com>
> 
> Good catch.
> 
> Acked-by: Juergen Beisert <jbe@pengutronix.de>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> 
> --
> Pengutronix e.K.                              | Juergen Beisert             |
> Linux Solutions for Science and Industry      | http://www.pengutronix.de/  |

