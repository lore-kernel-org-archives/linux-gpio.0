Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702604968F3
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601271; cv=pass; b=BqgvL5puq9cJE5/uEWpuED86+LUEf4XLknsxsH6OHfTplDvsZ1uO0SuiD/aetbNxlGLT7VSN80ko0w56/QdFl8guf3xdu0QKPxqjjlWKb3TvORMG/qOvCsJC6QUOcgXYlIfEO0GsVjBpzXb97Kd2MSe14bScnU14hKE/PGIIBm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601271; c=relaxed/simple;
	bh=7FMXwn6+GHUh4aNYqqrblQkMwpNa3JC+tTZQDMGtYtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHN927YcNMCUZGBFqEh93CPcJuHR8alU2DeEicUimhUmoU59WG0vODcOwNA/hJfctufUDlKHvM1onMNU4W/8TgRZjZKn+v65gCGDHg2WqNAMaKbibMrEAo3x8qDFnYJLYkHA23I7uKBJZ8BKFzxcvq9krIbCqNc++lUmbuGjqqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oenhC3Gf; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oenhC3Gf"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso356413466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601268; cv=none;
        d=google.com; s=arc-20260327;
        b=aoYbovWtt6XyXKqSL/khn205NV6u4fZZ/nlr50pyPAjjDuQ4ltEAu2MrL7R7Q9gywr
         ASi8LS/KWBOLIGi/WELO7WaEw2uHcYLy/aVsNNzPO51Fn8jVUoMkQwl1VRYuyaN8VIfE
         yfPD1fjuAfrgn9t3Xj2zOvFrWZiqbMp1V+TpljjOBpEq7AkRuB1+OKlk3u14MUvkelNS
         orueRzV5xe8/LmdnQNgT30hiYbqNuwpw8U1zYc0HCes79GNu8UcmyPcTM9NHB5z/urLv
         HLAEuX5rd9uXHN6Lf8iw2bvPGWSstlXd/S6yFhOC6bibnApq7ao89ET5Ez02ga2jeijg
         Roxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        fh=HOT+2Pc3I8rCySFbmCwvBjw9vBd+G8e8/u005Z3wfEg=;
        b=IFyM58eK1Exz9AjGTLXi7sXHPe/35Qu4JK2OsHpUEpqXH2C8kPeT84ik2AKdMBHjRP
         UriVw4e8YTnZ1BgxH8p8mWemGJ87lLJmRY90qI1PXhEOgOd2oy97vBwv/s4wnySDA8mJ
         QnmaZnpsc4jNlyAELztszlhErU8M6mpITZzsF4CKp0FPZOuHapqx8grM0sSDZC43sa6B
         FGPOi0ptSsilSKY7ubvypQsZKC3Lc/1RDCnwSP3LNNx1dybUV5Pt8kZEc+u9pV2/6ULz
         N6IdrjnywdadyD4s57H5lEpl+oicDAl4ze5zsDig4RmoUQ7Hha1UoTEUhlpg3FoMqg/I
         t6Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601268; x=1791206068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        b=oenhC3GfofzeeGFTLIHtLq/IwCBUdsm7TKQCqAb8Ky0IGJc+B4rSMevqgq4sBh/hSH
         ACWLPlchPXG3EPgMCHETdKPTETxrkpDNXBPGu6at1uHPAf7Bs3H1/4l4rUO6C562cSAm
         P2zNaTDJqSCmTUOOJlLY1y1QcmtK4HokMD93701XwFP3Dwqx6g1UmsgpWayAwH139xPM
         Ln68e33cbL5FeRLkn3m/OD8Dv1SX/3MD8KUai5twDf8IoIEoiSfqO8E6XttctHe+IRId
         Vtu8rLoIPEQjr0vhsTnSEk0EiEAdfimrydaF/qCyWDy35bEgRmYP6PhdrPMIZZhDg8YT
         KXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601268; x=1791206068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhsZECsOB6gnXC6gOibbQkmy4eQeDXFt2prA07YbYQI=;
        b=nkzrXleg+5Hz/NmWLsVCNXTAh4FaNfiRcJ/YVSvFCasLDNpMkhyZd1wimm6vRzwQ+B
         Y6YzrTasHow/5xadnWIWpAb/hndpe5vgkpTbvx8vUVe8/X7coEUH9AEzgRtv+gIhYgsQ
         u15s+s0Zf1iia9OxQbwGid1ir+ITjXBdAkO5YsjkwsoEAPWIbiYxqXbvL/4xEV2Fjqw1
         9OTqTKXs1SrNDjZf1A+a5BRh2P6zd1nWGIZDatxUXP+SE9JW5W9UUeL/j2ru3uu/PIZF
         m4PjLaesZKq3bMkIgpbS2hTg68HxPLLk270vYdAHP14PKypE7K0dk2Lx7t9xitf9xEg4
         39VQ==
X-Forwarded-Encrypted: i=1; AKwUvByLW/Vi9PIApZ9FjScFVKCSjwITB2XJ9fq1BftNllGbyRBC0808ThcDkR7jOMJRIo4Hh3YUBX4UZvgv@vger.kernel.org
X-Gm-Message-State: AFuF++kdShmWZb+G1LNj8DQkSIXZihN4XNp6pduHAXxKkU1j7uFEzsD/
	7729xBvIFs1BzibdtWCvraVwJa1fc9bnjhItk86n04jqSGvdFA+wPW2Db3yn9eIww2J88qD6npC
	OdLb41cXPSPkgR6jzyB6a7TbibbQI5lE=
X-Gm-Gg: AYBFou1HpusiRl2FxmYTOiyxRPEF5EleF5T15Rerp1U5twajS+GTXdVp2yGwaGYmoIQ
	r1UwPOsiA1oIdJ2zuZoNMEsuRDMziMFk+AQGO8/py2lyXGxtUHyAXQBg7bl3foyJVyfpzL4bJwL
	1GYL4726+hes8oT1WgNjGSlYTf05VwmEsOoCzBaeyB6lwzULRSUbrps4ggvnuom6wHcaIBVaTmb
	osOWI86AnhPD9hK06SWllrw4z4VRERmtMhjpqKmmNBC3B0oImcLrd/gEEjCaJfrnRngcB3vBrvW
	MhgChEUcaKsSOsxEyvAqtEtnEyUEytchSMnho2byx1JuBZHKuIcrkVOzZCWUeYKvd9CtW5naqPZ
	GWpr6uZRSZ4gcQIasAxH73oPmXPFBiB88gLY0vV//9dFmT8ObC1P7Dzd1XJ/XY1xr0Dn9/u6V4Y
	9XAuTMhP9KH4z+8YhpPCXoFMCvgxKSD0iGsNn7G9c/
X-Received: by 2002:a17:907:e1c1:20b0:c2d:bd95:874a with SMTP id
 a640c23a62f3a-c2dbd958b3cmr281456466b.17.1790601268525; Mon, 28 Sep 2026
 06:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <20260928123446.GH106095@black.igk.intel.com>
In-Reply-To: <20260928123446.GH106095@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:13:50 +0300
X-Gm-Features: AclHuK--Ilfy_nPKbrnV7apmqqwQGd71tXmOohH_PP2JNPHku9hQX5r2VX8JdS0
Message-ID: <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> said:
> > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> > > >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> > > >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> > > >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski =
wrote:

...

> > > >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> > > >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> > > >> > >
> > > >> > > These are interesting drivers, not sure where to put them
> > > >> >
> > > >> > IMHO they should be there too. We are maintaining them both.
> > > >>
> > > >> Do you send PRs to Bart or you just rely on him to take the patche=
s?
> > > >
> > > > I don't expect these two drives to get too much attention, and they=
 could
> > > > be contained nicely inside intel folder and that would help Bart to
> > > > identify that these are Intel drivers. So your bandwidth would not =
suffer
> > > > even if these two are added there. Your call.
> > >
> > > I'd like to avoid a situation where we have Andy's Intel drivers unde=
r
> > > drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd =
prefer
> > > to move all of intel GPIO drivers into drivers/gpio/intel/ and have A=
ndy
> > > gather changes to them if he agrees.
> >
> > Okay, we have two parts missing:
> > - Nova Lake driver (I would need Alan or Mika to step in as at least a
> > designated reviewer for that)
>
> I suggest Alan to be the reviewer if that's okay for him :)

If he agrees, he can provide a patch on top of my series to move Nova
Lake and add himself to the MAINTAINERS at the same time.

--=20
With Best Regards,
Andy Shevchenko
