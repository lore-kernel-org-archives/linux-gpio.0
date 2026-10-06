Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3296854704E
	for <linux-gpio@vger.kernel.org>; Tue,  6 Oct 2026 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791251663; cv=pass; b=XgYd3oP6AkoNFkqLkymbjjWWszX9i/MQH3Bp/Wp6TArra8oa2JUKd/6R5mignpyz7Optby8VpL1L/gaqpMKmPHoeHbSPzezlBRlHePshZxTytcKXGxFpmD2EiZK889VuQFJZq9xAz9hMWCR2TuxgBig1kRTbttZDfGtRQR2+seQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791251663; c=relaxed/simple;
	bh=eQBUqOGyukbiWf4Q0rtSaIj1KSJ+rggeOIwQYuO5CQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8/BJYHBcenZRh6xpWk1qQUy0hXZuIu/91nhbtFkwuI2bq+FO4dEcwc8+z7WjFOlOgraRjgCl9znTV7ggfv2tTX20R4wzVfLJu7XrhyQVXOmJ31azxVK+osirFCAEm2qOLcGEtKgwR8XB4NN0oU1H2BBdAvmg7LegK/k1dUrqpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieKmcurq; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieKmcurq"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab3fd8adb1so23860377b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 18:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791251661; cv=none;
        d=google.com; s=arc-20260327;
        b=nSQ75c/sdZ0EUHtuROMwj1xcffGEL+yr62JWiH3/NUFKbgqmo8ydWkeKWrYKXOBGQp
         03WPEEd+z9ePbIoEnY3t0MsgixTek8ZgMKoCcxut3jUW/ABhTgpe08ttfyDNXIKJ/sZk
         YFLIE40yyu0sQKrxj1VBdqLodrbitUTsFrZK2VsvvP0LAx69H+PUxZvi7Rp7acJNjxaV
         BiBAi61ySYPMoCRXgZ1ex19Ek7EACAUFRoRF+UzETqejzqppqmnopZJCJH3IhXoSXvus
         DUeMl45hQxH6On1eyRe3pBurHksmeWO0450587jkst05DdhfqOm3M9L2SWd3UEDFXZqC
         F6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        fh=HgFyi1dfwTFnjqkrzyxdkH+3DBISnQwRNM4QS81/R5A=;
        b=KYg/zRjSrUygLOqmc39rYEZqSEkj04rNfhhiWx5y8wgjDJ5wp+t+eNXIx74WCnVUuf
         E/leJyOu9cAAr/FiraCVwYJuGuJVayowq2O8T0112j9RdaTsCTMxGiL20IPAN0lgSMQJ
         MF/UpN7a/18+vGzrL1bROoQOZy1Df0zKsNyXmCvNLsrVM0tjfIpgcPe/20LkYk45UhUy
         yxHYRMe/d7/EIU+Wmo/t0we/J0x5zFHViYkyUCVLhozAKW97CHVpH8rYZvQog4o8MtxW
         XJQZezkUmIxd3g1YGzB6y4kGpljeNobyCKwv2uW6J5GL/RqqQnDBKLWSwCP2O/m71RZx
         pLzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791251661; x=1791856461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        b=ieKmcurqvVOQtCM4PB72wAURTDVryJhSAnfoxsVHEkDxpofhygj2aGIaS8zra+baHw
         EmRYrcqCPdhb2cjDXWK0KSPnf4EjcK5bH6LW6/bFSWAmCfB8PgpDXesLTE3nSq3Fg9Nl
         wQHpImFbc0EojqU5HaMQtgoGHH3YBjbC8LIgNN5ey5bANInUPKsG3QSNm1rYYa+RM1hA
         DCbwEMkcPXsUkdveaBLqbDn7G4pKUV+Ovg68MUi13Gl4lyfAqSdnoB5X5+TmSb+fg3f4
         PsUBwEF+pS7hse4cGWwBQgx6ibGHeTH3AmG1HmPFEzXUmfFk0SD0JQCkSJiPmvaRlizQ
         55aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791251661; x=1791856461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkSBHDMAWr20ujdoo3JqdsvxzfCoeajX7hq4tGhn34A=;
        b=hfXX1qWu4KniIOQrDaCIeeDjH8RXCm1M7stO2oTQgTgtnfBhWszs6Jh0vBqAd3Qnz8
         dfAmhDrO5mv6gvqlZkPBtaJm9FKb+dQVId7SDmhkfl8/qjP36hX4ZGweQzxdkZER92Od
         k71XfO0GQc9ZSl286XXv1KUYxiRu63TaXHPiJMVnWhtyOhkTBTY9DGhGuQayhOfs8RSK
         EW+3hjSyKRMYtS80kVyNyshubMSGdyu0uWQUNFRfhkMWJ7y5QmQBc30V4B61JTPVXRPP
         QQAgbqAFovrNB2SBDcPrdpr0GNljF+hKEyCe1dqTeeviQnggXLts57GN/YjoE0tjqQeh
         jGNg==
X-Forwarded-Encrypted: i=1; AKwUvBzF+U1Oada42lSqzRBIMFonP7usO26llTKt7/wdGEhXyjHCNPJLrtMh5mETJngXbHXbDBLzVSa4Ee5i@vger.kernel.org
X-Gm-Message-State: AFq9FYISkG8jOVLvOysF3vFMfR2qrI38oXIukC1zB7jN9KPSqnBzyDiu
	LrtQbs+vTHI0sdbM7mDrttz6oRyUKVJ/o0NJYJqR17dYPUipBQufC1LMAKG9yqgjNAU/aY4FMSO
	F7N9Pz9v+B3lQUiRonnsenrocHpYlfS91fuA/
X-Gm-Gg: AYBFou2WoV8Fp7ds4kgA8FCqurQRzRUv2JJY6lPoI9vUrkrBTTsMshEUP+HkO/xfJzw
	aw1i6TJn7B0FKS0n+ZYclF7thBYepzlZcH8NFu0pZKn5D5deSbS3OGSwYIWOf4pMb4o5T4gVCu2
	AswWesJOpeUUZtqYJjmVVIsZGh5qfYdCOF2k9baYRANv9mQR7xX/9KJAslQ//etBF2Bpg5HX+Nw
	9mUwtYoTxqi9+zYT3GjyAhcepsnZidg6pU0gAa9wYD9anM0eij2p3D7kjduoZlajVHIoq5O99zA
	QEnzmiXt6+l02vuyk6ThFIHcvCdEIK/IZb4+JpgcLh5jJPALCtVQqFGZrg==
X-Received: by 2002:a05:690c:1c:b0:8ac:4b34:6082 with SMTP id
 00721157ae682-8ae95af37f7mr32992497b3.73.1791251661017; Mon, 05 Oct 2026
 18:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
In-Reply-To: <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 6 Oct 2026 07:24:10 +0530
X-Gm-Features: AclHuK-Bp0TStH-ztm8tO-ezZOGxNIzT501802shaVBj9EoaYz799U7UGfa0dyU
Message-ID: <CAMFFDGgv0+sUL4V4itKw3pezB4MccYr1rGwrS6F0qwD=0HLB0A@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the guidance. I continued with a private B650D4U experiment.
The experiment now reproduces the exact vendor sequence:
SCU4BC idle:                        0x0e000000
SCU4BC transition:               0x02000000
GPIO123 pulse SCU action: cleared
SCU4BC restored:                0x0e000000
On real hardware, OpenBMC now successfully performs:
- Host power-on through DBus.
- Power-good assertion.
- Graceful host power-off through DBus.
- Power-good deassertion.
The private implementation is intentionally B650D4U-specific and is
not proposed for upstream as-is.
Given that THRU1 and GPIO123 are mutually exclusive, what upstream
subsystem should own this temporary transition? Should the
power-control consumer coordinate GPIO and pinctrl states, or is an
Aspeed pinctrl extension preferred?
I would appreciate guidance before preparing a generic implementation.

On Mon, Oct 5, 2026 at 8:33=E2=80=AFPM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:
>
> Since THRU1 claims both pins and is mutually exclusive with GPIO
> control, should the power-control consumer acquire GPIO122/123
> normally and select a temporary pinctrl state that disables THRU1
> before driving GPIO123, then restore THRU1 afterward?
>
> On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:
> >
> > Hi Prasanth,
> >
> > On the AST2600, the THRU1 pass-through and the GPIO123 output share
> > the same path and are mutually exclusive, they cannot be active at
> > the same time, so having the pass-through pair also controllable
> > through gpiolib isn't achievable in hardware. This matches both your
> > observations.
> >
> > Could you help us understand the use case? If the pass-through
> > already handles the host power path, why is switching to GPIO control
> > needed at all =E2=80=94 rather than simply keeping THRU1 enabled throug=
hout?
> >
> > Thanks
