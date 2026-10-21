Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592572;
	b=NUr/5oZGzBShFSEhMkQIS23ZoE3xaKHvPAF+Q+IgKqMl6FY24QQfwvDRNT26tYjRd0ZU
	 8PWszukfc1rEqskwU8giH1ux8/xTm81iV/vgB4biE24sVDTbE8qmzowiI+ENu+TCxQ1Bn
	 JADUuaLT2RHFYYWgCqXYzTEjFDuF0/3Czqn8Q1UabmaaxvQbPMaUJ+iXzbDTbaXoW5W+W
	 V0Jr+vHvumqrmJ+1MbdruJHwMeay6i2mMvNSgCSTiql1t6YFK2Xs1gwv/Om3AR2j1Af1a
	 Kbk4opM1eWk1bJO1OyWIRM9EjXNxfYLJnZ35Sj9hVJenPEYrk45Ejvd/jGcxVkiSYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592572;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SgnsI9xvRVm2E2Nsl7k7rIHbcV39kvLE5MaE6MErPqI=;
	b=a39g50i9VGIyBds1BRqd6lfdzE1YUGS9i4Of0DF3+aIDeuumLEa8CQWrKofZvxzt/Xt8
	 /MsQ2nKqFx28+5iXG/9KZjGrnkIUMcA4oGm0MyDoPSigBCU576xIbUbuRLRvV0NYuXEAi
	 oCMm5AW2A9qFhX5oTdUFS7rZ0mk/0zvDNbz3LoUV04roG6/W/mTbIbYl3jwLc3gleipJ6
	 47UHxn3PrwdPPfI8SMxK1sAt6hTX3S1UJMq4Si/OUwAAMdtrJjb8qWXUL6aCnNaZcFrfX
	 0YxuCuVu92YU1GeSjVsroaZopLgIZpYMiVdgpboMIpUCEoFk/ZKupX2OSB+C7Th13dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A3A606A319;
	Wed, 21 Oct 2026 14:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A3A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJXD0-0008O8-00; Wed, 21 Oct 2026 16:22:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A39ACC0423; Wed, 21 Oct 2026 15:44:18 +0200 (CEST)
Date: Wed, 21 Oct 2026 15:44:18 +0200
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
Message-ID: <atjBsoY8mjGw9fQ8@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
 <as4tep73cAI57Yk7@ashevche-desk.local>
 <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
 <as44ROCHy-WeMdIZ@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as44ROCHy-WeMdIZ@ashevche-desk.local>

On Tue, Oct 13, 2026 at 04:55:16PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 09:35:43AM -0400, Bartosz Golaszewski wrote:
> > On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
> > >> On Wed, Jul 15, 2026 at 8:51 PM Andy Shevchenko
> > >> <andriy.shevchenko@linux.intel.com> wrote:
> > >>
> > >> > This is the finilazation of the work announced in the commit 61e1fd2abca4
> > >> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> > >> > small series we kill gpio_request_one() and leave only two legacy calls
> > >> > devm_gpio_request_one() and gpio_request(), where the managed one has only
> > >> > a few users and high chances to be killed soon as well.
> > >> >
> > >> > The series is supposed to go via GPIO tree (due to nature of the last patch)
> > >> > with possible immutable branch for others. Please, ack.
> > >>
> > >> The kernel is clearly a better place after these patches than before it, so:
> > >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> > >
> > > Thanks!
> > > Bart, anything needs to be done for this series to go in?
> > 
> > We don't have Acks from MIPS maintainers. :(
> 
> Hmm... Usually Thomas is quick. Thomas, can you give your Ack if you agree with
> the changes, please?

sorry, I was on vacation.

I'm fine with the changes, but I'm not, if they still apply cleanly...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
