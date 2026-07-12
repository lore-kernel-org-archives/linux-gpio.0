Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB83770B
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848444; cv=none; b=aFpn06aEn90U37rgyI6wgkqiXk5e962KNYjxtP/1W+ZaMDSFddtSu4Hyj5j1tqPnCHrXjhvYYR1GU4z3Xs7QOaPMS2fkSjPXxHYgzAJEY7wfg+lL1HJRsCABU9VF1ivZ56OOtRf4uPNjZYclb5OHT/WeBeeqJjRdWLfay1rd3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848444; c=relaxed/simple;
	bh=HGEhgo6nwKWERdeZN3j/7g/1mXMipMryk6U50sgalao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZqeIj8gSsPL8yo/klAwICag/VEj5uRSJjKs9xdYKhWu9JiASukrrRrAobONcCXfhKyVY3B7gy4nLehPhcM4zviEqGQ6tCLXzEZ47Ef9Umce7eubjzdOcBxzZRodUA2lYfPJRRWUzxsvsuxrD/ZDCO/j1bmsFIti2oxiRrIq6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D76ALQco; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D76ALQco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HGEh
	go6nwKWERdeZN3j/7g/1mXMipMryk6U50sgalao=; b=D76ALQcoJrmzHsBZ846w
	8FTMwX8JWXTp/Sfkp2m6wroXM5+NdcxFrmNi/ohaHaeSgPHn6VgnU9eohuDx8oY+
	SWMRE+8Wcai9u0XACKHVdTKmAIc1oGc6CPGT1TW9eNbA6WuGmoCVLD4WWGhX7sY+
	/cOYxTwJxvkyqzK5SrI933+ZnJ9ai4Ru9cmLBjl9blUFdgKUsEZ8CyKt/EvEmqWG
	/uU8bpIHl40ia5Xr6D5dXor4b4cmNwL8C9Dg581NA0CQQChtI4ed+YMN1PK8Hm5l
	uYCY6txvzmMJPfeB2ufwrB1On26Bw1AZ1zIKJnH46uW+k8mtqQwRUHrOh63AHlxv
	qQ==
Received: (qmail 2178118 invoked from network); 12 Jul 2026 11:27:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:27:20 +0200
X-UD-Smtp-Session: l3s3148p1@vpaWlGZWwLQujnun
Date: Sun, 12 Jul 2026 11:27:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <alNd92hOOETILWG-@ninjato>
References: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDHTHxDTxpMC5KsV"
Content-Disposition: inline
In-Reply-To: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>


--CDHTHxDTxpMC5KsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 10, 2026 at 12:18:36PM +0530, Abdun Nihaal wrote:

> The memory allocated for priv->blob.data is not freed in the error paths
> that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
> well as in the remove function.

There is no memory allocated at that time. Hmm, maybe I should add a
comment explaining it.


--CDHTHxDTxpMC5KsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpTXfcACgkQFA3kzBSg
Kbbm8w/7BuU3C2v20yqERaoi5yj/MvUjL3d6rsVNj3Q6ubRu8306g7nh4DzbVEvM
64AAl9HXU74qAxrZ5Le/4GFXTSkLpEbxxbitCCIXRNB7eug3/RX1EGbM7XO2LzKl
3n+yAMsZM9YID95TrxEBsA4d2o0wkkjBH60DicOOITJfw9f8cxMU3Pne3UqXCOS4
edQwjKDdpjNsvKL1DQgV8c8+P/f22odgPhY521APFEJzBAWDULXGc1mt/PQd+Ftb
oB5sp/MsDN2Vjypt2f2TWZzPL7B5rObvWT+21aNj+phrxfQerCyjngftaAoqsONE
/qwrEoWwzDGauoPWIQt/T85TtZ2LMdkFhJDe4PX+XczXATEggaEq0wI6oPra+EvE
YFD6lCvkCLocn67dRtOUJCgKCGqeuofhn373v39c+py96jFrYnNftazqFMZl3DVg
rcxgFCu+3COsyBqb5x79uwVSHgBtE1b+OdHdnU8e/tx78eNPublExKhmnKOrwnTO
IxdJKYV06RIlgxx3nEEaMzxKSJ7kxeMqP8SMKa3Sx2yBKfxHXNQzQouaizZMdUfl
qnEDWmzZU6BbhIMr9sAO/N+Azy5AycPJobfrnBXWWJhlncDPJPqJ9XE87YInxZ90
OGy0dqQJPZZXlwJCvWlXP46mp3iHYDIyXR2KuzN5PspObWFurUA=
=0WDL
-----END PGP SIGNATURE-----

--CDHTHxDTxpMC5KsV--
