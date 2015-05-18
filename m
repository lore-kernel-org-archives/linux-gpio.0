From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 18 May 2015 17:58:37 +0200
Message-ID: <20150518155837.GJ28127@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
 <20150518110214.GC28127@localhost>
 <5559E3C0.1040207@linaro.org>
 <20150518150815.GH28127@localhost>
 <555A0299.3030803@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f67.google.com ([209.85.215.67]:35520 "EHLO
	mail-la0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932272AbbERP6k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2015 11:58:40 -0400
Content-Disposition: inline
In-Reply-To: <555A0299.3030803@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 18, 2015 at 06:17:45PM +0300, Grygorii.Strashko@linaro.org wrote:
> On 05/18/2015 06:08 PM, Johan Hovold wrote:

> > How about instead of
> > 
> > 	GPIOs 160-191, platform/4805d000.gpio, gpio:
> > 	gpio-171 ((null)              ) in  hi IRQ209
> > 
> > you do something like:
> > 
> > 	GPIOs 160-191, platform/4805d000.gpio, gpio:
> > 	gpio-171 (<irq-only>          ) in  hi IRQ-209
> 
> In general agree, but i propose to do it as 
> 	GPIOs 160-191, platform/4805d000.gpio, gpio:
>  	gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>

I have no strong opinion on whether to use the name-field here or not.

Using the name-field rather than adding a new one could perhaps be
less confusing to current parsers.

> My intention is - this interface could be considered as more or less
> stable, so it is better to add additional information at the end of
> each line to avoid potential breakage of User space SW (test/debug
> scripts).

But if the interface is considered stable (and some people do) you would
not be able to add anything here. This *is* a real issue, but I'll defer
this one to Linus and Alexandre.

Perhaps we should just leave things as they are.

Johan
