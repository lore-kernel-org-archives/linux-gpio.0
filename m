Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8551DB11;
	Tue, 29 Sep 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684160; cv=none; b=ZvBI8rw74VZTUfXvupxhwSr3Y9fgFH1B8bOpQsgiNStlNiOUXz0ExOg1+XSvDB+U2cMRkgtiGbCaxoELK6sjPwRh7PHHfhNqshWERB9cO4bSrKP5R9Bv4udRI0wkPbpqYL///nRxd5EqI4FT7Vv50VqkYQ2D/wRJIylSf+CoCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684160; c=relaxed/simple;
	bh=kg4B29T9vnz91O9cjKfwlelYqgit8u1kzPiFRCFG/zk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9mCQbkBKyRTG+6ZM3rWne8FidHzuA1vcD0B4ZpNOy80aqEAQTUf6ev25Lydy7NPrQ7ucFKHkNamPGNNtoTHkJLaF0TWdoRYGLx8O7hX2WCiAgWiK4ZQLiYcnBoBqKUcvOxhxKFbIW6XgI0XKYhrKlo4Ua+ZvFnVLDbWacnGIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PohZre7s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PohZre7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790684156; x=1822220156;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kg4B29T9vnz91O9cjKfwlelYqgit8u1kzPiFRCFG/zk=;
  b=PohZre7smGIigu+Qe1fOh4QF6g2fKTHO/5AKOpsWR62tyafxxbRx6YvL
   PONYDkrmLg8USFSruFcTO6WyVoztwpiZWM5QS62OI33SNSOa6wXf/+p4m
   Lc0Tda5E+850Os7A5WjPu+7qiUPsxoeL5n9biTbZHYV2Te6LlCOyPgAvs
   nLZNDJOLXsK2dXEKBcsDv3g+g1rwn91BcjFATzrWrAUzQZP4EgioSGURQ
   tE/RU53G2sG7Foq3Uqej7/RqDXZLqZl79CyCSVblOrYbhEQJcbgzoScIC
   5jawFvIMoJGKvkmwrKs0oavRkKWmsRsf72QEuQRSJm7R6xcfwGBa0gEVj
   A==;
X-CSE-ConnectionGUID: xCkhQz7dQ9K7N/99KKirDA==
X-CSE-MsgGUID: LJyzJ5hFTea8L30S5E9+CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101970284"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101970284"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:15:53 -0700
X-CSE-ConnectionGUID: I5AgwFApSqe8U2sqddaxdg==
X-CSE-MsgGUID: bayTf2WMRseXeHF5l9RY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="280084486"
Received: from aborzesz-mobl3.igk.intel.com ([10.237.140.166])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:15:49 -0700
Message-ID: <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg
	 <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bartosz Golaszewski	
 <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko	 <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu
 Zhang	 <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mika Westerberg <westeri@kernel.org>, Israel Cepeda
 <israel.a.cepeda.lopez@intel.com>, Hans de Goede	 <hansg@kernel.org>,
 Kuppuswamy Sathyanarayanan	 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Date: Tue, 29 Sep 2026 14:15:47 +0200
In-Reply-To: <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
References: 
	<20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
	 <arZRZfa7AmDxmwoJ@ashevche-desk.local>
	 <20260925125433.GY106095@black.igk.intel.com>
	 <araGjQoaffMhDMLz@ashevche-desk.local>
	 <20260926100727.GB106095@black.igk.intel.com>
	 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
	 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
	 <20260928123446.GH106095@black.igk.intel.com>
	 <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-28 at 16:13 +0300, Andy Shevchenko wrote:
> On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski
> > > <brgl@kernel.org> wrote:
> > > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > > > <mika.westerberg@linux.intel.com> said:
> > > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko
> > > > > wrote:
> > > > > > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg
> > > > > > wrote:
> > > > > > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko
> > > > > > > wrote:
> > > > > > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz
> > > > > > > > Golaszewski wrote:
>=20
> ...
>=20
> > > > > > > > > =C2=A0drivers/gpio/{ =3D> intel}/gpio-graniterapids.c=C2=
=A0=C2=A0 |=C2=A0 0
> > > > > > > > > =C2=A0drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |=
=C2=A0 0
> > > > > > > >=20
> > > > > > > > These are interesting drivers, not sure where to put
> > > > > > > > them
> > > > > > >=20
> > > > > > > IMHO they should be there too. We are maintaining them
> > > > > > > both.
> > > > > >=20
> > > > > > Do you send PRs to Bart or you just rely on him to take the
> > > > > > patches?
> > > > >=20
> > > > > I don't expect these two drives to get too much attention,
> > > > > and they could
> > > > > be contained nicely inside intel folder and that would help
> > > > > Bart to
> > > > > identify that these are Intel drivers. So your bandwidth
> > > > > would not suffer
> > > > > even if these two are added there. Your call.
> > > >=20
> > > > I'd like to avoid a situation where we have Andy's Intel
> > > > drivers under
> > > > drivers/gpio/intel/ and other Intel drivers under
> > > > drivers/gpio/. I'd prefer
> > > > to move all of intel GPIO drivers into drivers/gpio/intel/ and
> > > > have Andy
> > > > gather changes to them if he agrees.
> > >=20
> > > Okay, we have two parts missing:
> > > - Nova Lake driver (I would need Alan or Mika to step in as at
> > > least a
> > > designated reviewer for that)
> >=20
> > I suggest Alan to be the reviewer if that's okay for him :)
>=20
> If he agrees, he can provide a patch on top of my series to move Nova
> Lake and add himself to the MAINTAINERS at the same time.

I agree to be the reviewer. I have the patch ready, I can send once
your series is applied.
