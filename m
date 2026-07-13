Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA042E019
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954219; cv=none; b=FLaDQoX1udHfuUMyEc89+9npfS2FCHlOyORIjUdUwOCWjkPV+TbJXnlv4tK/S+YUwIvueosHpRfq1+44/RvFFM36361jsghJi5oBstvqEkyllBjVM8Ju2v2Qtv9+veqUqoZWuCWZt8nooT4JGSiDRin++WNq332DeC3iMv2IQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954219; c=relaxed/simple;
	bh=Xcd/do+xvqGyt7l7LhBbgFpZdp6/A+ra8TikIp/CivI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9jzIcvJm7i+b8xN20xuRR2VbO2NlYvBfHjZ6gyysAjyaQVJQqiievby4cwjXuDuHaLBMAs7+9u/MXCDUwFNYNR7TpTT1c6Vb0PDq3DjumRVmBDrOxyNupODxIZDz+aNLiUIV4Wd7Hmq706IYUqwMcl2yVMq4IlpJkiW9DzAqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EBZLW1Hm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EBZLW1Hm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ra6R
	DpbJc/+pCiiy5iSsUgRgX45ZA7jHJ1CdoYshOIE=; b=EBZLW1Hm6nwlf8E6V71p
	/HyScUdL9auTtDtuU/99dxGgxMRaJLYr2zbT71dtU7XyrQUQYNSLK2AiO13YfMra
	qvz/WqtWTVwKEwMZHssovChJlIasOrI/p2ntTarhE8ZGRCrzE0UrvFVQevTbvNfh
	tz/CV5Moxj5uSYzGfaXO2NZxTX/Pza/Yn+GnPo8i19Iy1QM4KgUmgllPi0rzbvX7
	l0AO6y7u9VgOgwH5iRvHC2lyyp7k1c7xFoL6+3Ys6jrbjwytZtPSCQpYqTuGph5W
	IyNma7uq1Ql6PnzQzBOdJz9OQ4u0194NYNiF+OuKj8XcSZOuiyDC6jaD6Tgv+k1+
	gg==
Received: (qmail 2678472 invoked from network); 13 Jul 2026 16:50:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 16:50:11 +0200
X-UD-Smtp-Session: l3s3148p1@+n4VNX9WQOQujntq
Date: Mon, 13 Jul 2026 16:50:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <alT7IvHFDSCw9kE1@ninjato>
References: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
 <alNd92hOOETILWG-@ninjato>
 <rraksab74pmllyp5zqr3tlbqe65twqgan5362hitk236mxguci@uhcrd2hzdi5c>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xNzZbAT0VPa7Im/Y"
Content-Disposition: inline
In-Reply-To: <rraksab74pmllyp5zqr3tlbqe65twqgan5362hitk236mxguci@uhcrd2hzdi5c>


--xNzZbAT0VPa7Im/Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nihaal,

> What I meant was that after the priv->blob.data is allocated
> successfully in fops_buf_size_set(), the subsequent error returns in
> gpio_la_poll_probe() don't free the buffer, but directly return (since
> all the other allocations are device managed). And so I feel that there
> is a leak possible here.

This is actually true. We should fix this.

> If you prefer, I can remove the return code check for theh
> fops_buf_size_set() call and just have the devm_add_action_or_reset()
> part for releasing.

Yeah, I would like this. I think this part confused me a little when
reviewing. I will accept the patch with the retval check removed.

> We are using a prototype static analysis tool based on LLVM, which we
> are building for a research project.

Well, you got one success report now :)

Thanks and happy hacking,

   Wolfram


--xNzZbAT0VPa7Im/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpU+x4ACgkQFA3kzBSg
KbbfmQ//Q+SnypjpgBA+iX/2lfkbQeGdoGc/gWHsU+HHjgpE/DlgDZ7+tUs9cquM
JIHrB3NCqIPGFiT/PCCjpHBYhFCWPaXbGL+e2tObo9RnO+MRnpMCshMigWKea8u5
71HJU0QKDzpi5n8gNIjTZn6q1MiklktTl3dWQxTfFg3yZvs3K4CvR1X2IbCvxGoB
oXj0jjRBRWj/wppBF7DyYaMlzmCT/LkK1i+77x379WTVTau/MoqonYntzRIvxtXw
BIe5Ws6OppI4ENzodhKz4vtJsAuw1e+Fr/ujh8Z1igf55sGgvIAe1Fe0hNu6/NtP
xGSt3n6PnS5sTltR+tWcARcOCa5vcR6mJlZwergO/ACfg0f0BcPuJMaf1/vzzqTA
hN81dlGEkfsKMClSWStUbRypTLkgNilH+oZRL4gLGw+tIWCaUwTbfFg00iBChu0r
X1aMfUHgbX5Au0RSMcnNN+HbyfRT6ioXpBKzrFAisrYcg0N150uRRg575lGmplHb
YG339QX4fEUfh1mnBVCHWietLaro2jpol3G62pqHnvG8mOUAr8yhmBAH5Z7j+iH7
7anwp4wa7TawizuIfi2RZkadRvI4ejgGvTVYi2l8UX2FIBmpxYyQV9w02DNKdhxx
5H9kugD/6nBMFrXu/1p96ycG/JN21mweWA4eLpSSDsnF3COQkuw=
=hrae
-----END PGP SIGNATURE-----

--xNzZbAT0VPa7Im/Y--
