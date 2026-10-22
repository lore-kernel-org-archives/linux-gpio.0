Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695277;
	b=zyx97YXQqvayD3in1MTealeZBbORPa4GQvAeRkC8qxvnRm5QiGNYXu/yfepIB4paeglT
	 i+9WDZLAbMNzWqzjhzp+zyInjCMFl9Ll9wekrkjXhGxyRaH/UH4Lj7rxfcVSg2auUCRi/
	 HxY6M/LOia5QiUkcSbiS5Gw2a56tMyWcDosf8uEVCBnOISm6Hy0X6BJqsgSHQyQOLZf+f
	 Vv9ZAT0tS4sQBVCtcGaO53uJvY+yyS6Nj6x0Z8bQLmeOz0/B5nr2mt10Cbw6cCB7yLmY5
	 LxK6itkUUctiDTd8t0GryT8SD9tc/pzOplt/lhqL5Sajd62gv8PZ5tS8NQcRVCSnlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695277;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FugUTfP6os2SMkrCz7l/ffuyz7L5QQqtjSQ2DNFJmTo=;
	b=NLJFidaU3XkbndK7tSfe3oX6yWzyr2b+by59ipd+hqP/Yw+a5tNp190hc7Vqy4TAk6py
	 oomgF7RD5c/J65fbC7/l8+P3Urzi1iDdJS/CX+5S9GcdBEmmqocZHlafsAb58qWw6EDWO
	 pWETx8upRHvX+iKfpOEkxAEawSjoEJfwXt0Nkxxwosz5PaSndq+ibfvFQ98CSZ+5LmP1Y
	 1FdefoFMJAhjxMLPN9Twr4GOmszFWXrCOEQ+PuBkh22BNGtt1qwE1DdmjD4sIePB+nRyj
	 tDLo2KviY4A+XGZYWvythYYSn6B6uj63a/qtdTpFJdQ7rBJo9YMcBxrsJgUl1oR2feQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA83606A31E;
	Thu, 22 Oct 2026 18:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029b-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8312BC0AA8; Thu, 22 Oct 2026 20:51:45 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:51:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Message-ID: <atpbQV_qEoLyAG2J@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
 <atjBsoY8mjGw9fQ8@alpha.franken.de>
 <atjbpKxrW7x7Ohpq@ashevche-desk.local>
 <atjfOrjsxnKe80zh@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atjfOrjsxnKe80zh@ashevche-desk.local>

On Wed, Oct 21, 2026 at 06:50:18PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 06:35:06PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 03:44:18PM +0200, Thomas Bogendoerfer wrote:
> > > On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > > > > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> said:
> > > > > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> 
> ...
> 
> > > > > > Bart, anything needs to be done for this series to go in?
> > > > > 
> > > > > We don't have Acks from MIPS maintainers. :(
> > > > 
> > > > Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> > > > the changes, please?
> > > 
> > > sorry, I was on vacation.
> > 
> > No problem, we now have more time :-)
> > 
> > > I'm fine with the changes, but I'm not, if they still apply cleanly...
> > 
> > Can you provide your formal Acked-by?
> 
> Maybe I misunderstood you, but FWIW I have applied it on top of today's Linux
> Next and there is no conflicts.

ok good, I probably mixed things up :-/

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
