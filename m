Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0484E4337;
	Mon, 19 Oct 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413716; cv=pass; b=VDNKGgqUQjB8lFPu3WJ1xCE4wIjx/uETZWWGlcgcshyCskh/mQPp+E6NTtimg046JKiwD9nQ3EN8TjGmf59bFYGkSBeqhwppApHsI3Gv0JhOKBwvp7f2lj5+5GBVx2LWqaEb8Woeca9pRy6XK9ED0ttV6ujhm13mSt8zjni9Ehg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413716; c=relaxed/simple;
	bh=0NuY3a75HcCQ7IPa8iglc1jzEisWpxEbkTT8w0sFB6o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TfinmF3GmRlaUYs25Wlsbzy+5YttNGPK8gD9p+QccX+tRinkprKt6nxx3b8lNhReZ7AiPQOS67D3AX0YmUsD5MI0BZ/5eEQ+oE6ooyDoco6RmTqB7NnlbOejxzQInEoQ6ROK6FAnRUt/iFbbllrTUQFc94oTGzjnq81eHmIxI44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=JRjEXmHW; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="JRjEXmHW"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BE321201709;
	Mon, 19 Oct 2026 14:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792413707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Zzuai6oJ6ACrhDJFkbjLUZQn835v/bzke/d1PjvRVI=;
	b=JRjEXmHWey3MM5mpYiI+KVCcSmLUwsLUjZ1DsS9Mf1UCEKTp7gMBk18bAF3gCePS7tXc2/
	wdOkuDUiM+l6M7IDMByEEUJoRYkUZXEgvzFnhX5BozpTtcwADEhQxYXutGVXpGVt4lcq6y
	7BDKl1ZPHdD3e0waeb3SEz3ij9+iQ/ThTLZ3roumD19se6JjcnlhipIGWhHErE23UTovzc
	NWLogkVYT92dEYVu9qTWIido5w01mY5evCX8UE/faJdx93CAsnSo0TDtIwhtVKl2VJR5l/
	S2SQvrr2T9+b7vZ7twzLnlotBRFBEfQNcTJLR+vCYr2gXljfIEzHkm1aiBpgVg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792413707; a=rsa-sha256;
	cv=none;
	b=EQi+qfP19kjv9MHBKKzjHasBcdXSjVkS5Fh4HM1wSquYC+rWh/ngPrCt4Tnzah8w5ff5Pu
	CHzVW7cnE8NP6Hca8tGtNOwU1PkkpAK2nxAiFdOss/laZ0IbpYGQDCQ5KaIQf8rqNOzB7O
	P9WTgzSyTS9AI1ooHanxRTDm/g7SyR9/+CY9dSeCrj+gXH4ItglhBCxImsivcXVTO+LQnG
	3pdxLJtNs3JTzB7WQXIwyT/FC4geJBYCQJyYR/Boy39PNUYAxVd2Ntq5Dc62l5op5gRtF8
	A4Azjc++1WjBLff82pN2fwRIR/qzXrhlKdpfDWEdSaPCZJfVQvuuWv441ajNLA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792413707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Zzuai6oJ6ACrhDJFkbjLUZQn835v/bzke/d1PjvRVI=;
	b=BQp/XuC2uLOPBv7qYrfTqpH1neVWTlQYpcSKZd2kIR5ydZFq9FDdUfE1awILAtTTBJNTxa
	Ia2f5KNnpk8EgT5DOq8JJKUBkEAkRC0G5d+jVhqdFCPBjFYYNP05sHhgQfZ1prr8Oe4PTe
	F3XeCibxaAyfib/L/iRDdLXmSyecXSAQqvEVX1lyqCsT1JVF45RLBoOi26U49OxcGjnM2l
	w2NqQlG/xSjAnTjsyU9BDEwBWzDZTUVhndRzYGbG7uP7GodsUbzvq5bMgqWSkQ/405qavI
	V8v0EI8MR/j7VR8aE1993FSGUCI0UrjkgYWiS73v4O+WGPZ02eH2x+C5hrBU0g==
Message-ID: <709ddfbbc57ce8f666fc8ebd7fe48dafed39ef33.camel@pengutronix.de>
Subject: Re: [PATCH v14 5/5] reset: Leverage revocable for accessing struct
 reset_controller_dev
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>, Linus
 Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>,  Danilo Krummrich	 <dakr@kernel.org>, Johan Hovold
 <johan@kernel.org>
Date: Mon, 19 Oct 2026 14:41:47 +0200
In-Reply-To: <atYEwbTCcuYa5ShB@google.com>
References: <20261011121246.162759-1-tzungbi@kernel.org>
	 <20261011121246.162759-6-tzungbi@kernel.org>
	 <CAMRc=MeWy7UQrGEr7MG5KT1b_NeLeEc9cYb+sAWuzU3shw620A@mail.gmail.com>
	 <atYEwbTCcuYa5ShB@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-10-19 at 11:53 +0000, Tzung-Bi Shih wrote:
> On Thu, Oct 15, 2026 at 05:49:11AM -0400, Bartosz Golaszewski wrote:
> > > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > > index 38e189d04d09..788a235c3965 100644
> > > --- a/drivers/reset/core.c
> > > +++ b/drivers/reset/core.c
> > > @@ -24,8 +24,8 @@
> > >  #include <linux/property.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/reset-controller.h>
> > > +#include <linux/revocable.h>
> > >  #include <linux/slab.h>
> > > -#include <linux/srcu.h>
> > >=20
> > >  static DEFINE_MUTEX(reset_list_mutex);
> > >  static LIST_HEAD(reset_controller_list);
> > > @@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
> > >=20
> > >  /**
> > >   * struct reset_control - a reset control
> > > - * @rcdev: a pointer to the reset controller device
> > > - *         this reset control belongs to
> > > - * @srcu: protects the rcdev pointer from removal during consumer ac=
cess
> > > + * @rev: revocable handle for accessing the reset controller device
> >=20
> > Please call it "revocable". The name "rev" does not indicate what it is=
 at all.
> > Same elsewhere if you call it the same.
>=20
> Ack, I initially used "rev" to keep the lines shorter with the revocable
> APIs, but "rev" alone can indeed be confusing.  On the other hand, I feel
> "revocable" is a bit verbose and doesn't indicate which target object it
> protects.  How about calling it "rcdev_rev"?

I strongly associate "rev" with "revision".

I'd be fine with "rcdev_revocable" (in struct reset_control and
"revocable" in struct reset_controller_device).

regards
Philipp
