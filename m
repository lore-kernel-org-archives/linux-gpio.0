From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] gpio: generic: clamp retured value to [0,1]
Date: Wed, 5 Feb 2014 23:08:11 +0100
Message-ID: <20140205220811.GG20094@book.gsilab.sittig.org>
References: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:35366 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026AbaBEWIb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 17:08:31 -0500
Content-Disposition: inline
In-Reply-To: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Evgeny Boger <boger@contactless.ru>, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Feb 05, 2014 at 14:14 +0100, Linus Walleij wrote:
> 
> The generic GPIO would return 0 for low generic GPIO, and
> something != 0 for high GPIO. Let's make this sane by clamping
> the returned value to [0,1].
>  
> [ ... ]
>  
> -	return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);
> +	return !!(bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio));

I've asked this before, may be too picky, but certainly want to
make sure.  Is any language lawyer around? :)  Would be nice to
get a definitive answer on this, before the pattern gets spread
even more and still does not what callers expect.

Is there a guarantee that "!0" will result in "1", and not "-1"
or any other non-zero implementation defined bit pattern?  I
always thought that one had to write "val ? 1 : 0", or else the
result may just be another kind of "zero or non-zero".

Remember that the return data type is int.  For bool you would
get exactly "true" and "false", but for int I would not be sure,
and would rather err to the safe side.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
