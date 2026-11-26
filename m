Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734687;
	b=wW3LZu30JqZBAI1w5PybKFGla2/h0MR2YmazL3bsqTzCDowqmakYH1WsVomTTkZlNOtu
	 mmHEqvtIQlXg1C1yoki4zdPMBJEW7VdE6t2vcZNYEQvcY0N4iFbaMKYK3Vri+/b13rwK7
	 pBLAiNsKbY2lNZ5LAj0mDhTOC5OOVEP/qIOTH67QqrjikHyn9W+Hm2nUkKkEFH1TGika6
	 eEX73+JXQIkFLGahck25nhDF4kdg2mVZD8pNxbvX1Lwefhmh/R+6aYcm4mnNyTd5swco6
	 meLfyr3rQXQUfcoIBoL7uxqpeqhtN7uAVUcAtDyFcyaKaWKWN+9h77+K3f0Tnn9OadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734687;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=FgnmKyRD83LLGEWyCykRou31U3vHdZMcJrl0VNsYgBE=;
	b=AEFh2RC8Ftn+V1bjlHzHVqWx5H9ZU9FXATAGurfRNX0Lo6PeN+Ebp1fx53xUhViNtcBT
	 4h65VmoXi/weSaJibGUmLimlapVSsOP8J5CenU+DwWOklaa3UJpGjJf+oGHvxpFw7rrs4
	 v7mhPv9GWV1ZeWQNcNm9NteE/KJddjFiUYYRiwQteLBltMGCBYgpUZOlYlegnX4nmkmet
	 vhsQTe33GrK3tKC7aDvfwi5C4kO1/Skq0J4gmK/3RVgHE/ZYYsLBHVAJAABMoSJtHDmlB
	 sshNPX056FPnb3Lc1jOREY7ZtTpRKJSlMQ8Gij77+p3OKbREU/GHmPYHvKK3NiGYRGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjO8H1ny;
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A968606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 23:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A968606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjO8H1ny
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OFk/33AZgL2b1+f3ha2elENhd1aKhKZnsNw7dCkoNMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795734684; v=1; x=1796339484;
 b=hjO8H1nymqyLkGKmYIgaZwXm0lOL5YzEOM5jrRHREccOGK08OoE1PjKoO18WtSd3TirwGjyo
 WbtFZW7kF52B4HLb69ADBrl7Y6rpTdhpYZSVDiqmHYHC6yJk9Z8y9xQ9pOKkBT3Sz1OAZmY5sSS
 SGff7cTCWad4f4SQLwbupLcQ=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id efa1e852fab11779;
	Thu, 26 Nov 2026 23:11:23 +0000
X-Mizu-Trace-ID: efa1e852fab11779
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 23:11:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <82cc8eec748b2d3e7fac306652966353ec9d763b@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: linusw@kernel.org, paulmck@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <ybhhwqv2xgg4g3ormfcc7lncbo75irefvdk7yn2vsctjydefyz@n65bjszpepbm>
References: <20261126084233.17381-1-qiang.zhang@linux.dev>
 <20261126084233.17381-2-qiang.zhang@linux.dev>
 <ybhhwqv2xgg4g3ormfcc7lncbo75irefvdk7yn2vsctjydefyz@n65bjszpepbm>

>=20
>=20On Thu, Nov 26, 2026 at 04:42:33PM +0800, Zqiang wrote:
>=20
>=20>=20
>=20> The srcu_dereference_check() already evaluates 'srcu_read_lock_held=
(ssp)'
> >  internally, so passing srcu_read_lock_held() as the extra condition =
is
> >  redundant. all callers of gpiod_get_label() hold the desc_srcu read =
lock,
> >  so replace it with srcu_dereference(), which provides identical lock=
dep
> >  coverage.
> >=20=20
>=20>  No functional changes.
> >=20=20
>=20>  Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> >  ---
> >  drivers/gpio/gpiolib.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20=20
>=20>  diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >  index 5dd4d142cf52..47ce89bfb578 100644
> >  --- a/drivers/gpio/gpiolib.c
> >  +++ b/drivers/gpio/gpiolib.c
> >  @@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *de=
sc)
> >=20=20
>=20>  flags =3D READ_ONCE(desc->flags);
> >=20=20
>=20>  - label =3D srcu_dereference_check(desc->label, &desc->gdev->desc_=
srcu,
> >  - srcu_read_lock_held(&desc->gdev->desc_srcu));
> >  + label =3D srcu_dereference(desc->label, &desc->gdev->desc_srcu);
> >=20=20
>=20>  if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
> >  return label ? label->str : "interrupt";
> >  --=20
>=20>  2.17.1
> >=20
>=20What is this patch? A v2 to the one it's replying to? A separate chan=
ge
> (in which case it should be a new thread, not a reply)?
>=20
>=20I'm confused by this thread.

This are two separate thread, I sent them together at the time, but it se=
ems
that the title was lost, sorry=EF=BC=8C I caused your misunderstanding, I=
 will resend it.

Thanks
Zqiang


>=20
>=20Bart
>
