From: Andrew Ruder <andy@aeruder.net>
Subject: Re: [PATCH] gpio: pca953x: fix gpio input on gpio offsets >= 8
Date: Wed, 14 Aug 2013 08:44:19 -0500
Message-ID: <20130814134419.GA17639@gmail.com>
References: <20130807215240.GA31924@gmail.com>
 <5208B8A5.3030702@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:46450 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759890Ab3HNNrT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2013 09:47:19 -0400
Received: by mail-ie0-f169.google.com with SMTP id qd12so12653007ieb.14
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2013 06:47:18 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5208B8A5.3030702@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>

On Mon, Aug 12, 2013 at 12:27:49PM +0200, Gregory CLEMENT wrote:
> Good catch. I forgot this one and as on my board I wasn't able to
> test the input I didn't noticed it.
> Thanks
> 
> Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Linus,

Any chance you can take this one into your tree?

Thanks,
Andy
