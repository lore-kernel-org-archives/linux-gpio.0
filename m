Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B203CA49E;
	Tue, 17 Mar 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753910; cv=none; b=D0t1dzDWHgPocXaAqtRwmXipX+QJTL/mfZ4KiCZ5z9daguUjt929RWkDVS6BxfwVbmGgqD17FuCUEv7DEzeRgIZJyZ7fVFj/ZoSnLTvVwvypE+ZDGrTk26vHBOxJgO8ifKH/pTttLmNA058wJf49tSxA+WCnFUOnQfwO+kGYJTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753910; c=relaxed/simple;
	bh=gKPRMfXZ3YG7FxBevXwWXdSYxmwBwhrb4p/dtdO5t3E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WRH/ezEq438y6KuvL5VwxR/waNwgVHZ91ioRAsPVUtMIBJaD9X734PHWCOndMfU8RmG8M10/BiLyPoFecdmxwQhnrJ0GgVTrBd2W+zPb7pWWiNtbMpR5OSa+2xSJojjjFpO1FnNSxVq2YDiASEg1ZDUJuVjXsmC1MA3Dqo4wbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBhdK5H4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBhdK5H4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753909; x=1805289909;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gKPRMfXZ3YG7FxBevXwWXdSYxmwBwhrb4p/dtdO5t3E=;
  b=gBhdK5H4rC6dcyJRhn3srd7emKEHOyXjdr+DrY64/1O1yJcmAhfrFYmZ
   02sYlt7BxkcbURjMR76MYyfrWHYio9vXZYB/VtYUwr1yBwN59fUeQgicY
   ZvYS65FepnVZvRL/utMznCoqZGzaaPdvw52u7QYHe1LEzH5/N39Fw4w+Q
   OnW41DoByg+nE/w1PPulzITkEFXn6v8o/gI5d6+QaT0DiVcq36dLpzjzD
   nRi1RWYKMuNZzte/mR/w11IVS7gw40TfwNKpz4DwIT/XjXNJsUst0EhoK
   tmgxw9akz2rfgZEuLx0k2HG/iQ331JpAPqX4Chh2E49+W/i05Lu2edLEK
   A==;
X-CSE-ConnectionGUID: LepJcEXDQY25dUF2p5Pm2g==
X-CSE-MsgGUID: wVfwQ75CTJK1P9T0/AaBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73962688"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73962688"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:25:09 -0700
X-CSE-ConnectionGUID: g7EXoQEgRICVjRYii8PoaQ==
X-CSE-MsgGUID: 198r0ModRxGyUfKp2zdmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227242232"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:25:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 15:25:02 +0200 (EET)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
    Peter Korsgaard <peter.korsgaard@barco.com>, 
    Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
In-Reply-To: <aa-3e_Wjh5J5XFi3@google.com>
Message-ID: <a8602563-dd39-93bb-115d-24939c41d1de@linux.intel.com>
References: <aZYn_xDxBXn_Ijem@google.com> <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com> <aa-3e_Wjh5J5XFi3@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-953307849-1773753902=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-953307849-1773753902=:968
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Mar 2026, Dmitry Torokhov wrote:

> On Mon, Feb 23, 2026 at 04:11:10PM +0200, Ilpo J=E4rvinen wrote:
> > On Wed, 18 Feb 2026, Dmitry Torokhov wrote:
> >=20
> > > The GPIO get callback is expected to return 0 or 1 (or a negative err=
or
> > > code). Ensure that the value returned by p50_gpio_get() is normalized
> > > to the [0, 1] range.
> > >=20
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform=
/x86/barco-p50-gpio.c
> > > index 6f13e81f98fb..360ffd8505d6 100644
> > > --- a/drivers/platform/x86/barco-p50-gpio.c
> > > +++ b/drivers/platform/x86/barco-p50-gpio.c
> > > @@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, un=
signed int offset)
> > >  =09mutex_lock(&p50->lock);
> > > =20
> > >  =09ret =3D p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_param=
s[offset], 0);
> > > -=09if (ret =3D=3D 0)
> > > +=09if (ret =3D=3D 0) {
> > >  =09=09ret =3D p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> > > +=09=09if (ret >=3D 0)
> > > +=09=09=09ret =3D !!ret;
> > > +=09}
> > > =20
> > >  =09mutex_unlock(&p50->lock);
> >=20
> > A simpler flow would be preferrable over all that nesting. Is this=20
> > logically correct:
> >=20
> > =09guard(mutex)(p50->lock);
> > =09ret =3D p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[o=
ffset], 0);
> > =09if (ret < 0)
> > =09=09return ret;
> >=20
> > =09ret =3D p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> > =09if (ret < 0)
> > =09=09return ret;
> >=20
> > =09return !!ret;
>=20
> Yes, but I wanted to minimize the amount of change. Maybe I should send
> a followup patch converting to guard()?

Please do. I don't want to be adding into complexity when we've a nice=20
solution to simplify it using guard().

--=20
 i.

--8323328-953307849-1773753902=:968--
