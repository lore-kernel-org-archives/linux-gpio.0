Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44939412BF1
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232060; cv=none; b=AXi1oTJSBGN9CFqRcMC2bYDcdqL9EjgqSrCgKCuvLU/T1HQ7+Yciy/g4RwkQdU7g3h0zbfmd3/WTHzE852GxlIxYBbsjlGOwFw9EMf/UuxrlYIjO/im3fqkKdGuJThEtf73T6wancCqc1CQENsuphTkOEw+uMFEB5j7ufXVvJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232060; c=relaxed/simple;
	bh=6kUKDM3LAWi6Ms2P5rB0ZAM7Uhop62+6ZOylrJ7Ka14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uboad3tMreFmBbPybeeUZZPiOydRxKdwM4DJrR9UAHaSt486M0NOjSENoXrZnzpXCGeI+w3S6Xd4ycY8L+Py/2AMAorooJht2jKpz5DyI0ErJJgJSp4A6PGizfs+4Mdq0gn3vRBohbpPGyFM6uGUUdYqT3ZAe79PThFLBL2DB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hacVNq53; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hacVNq53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wYym
	hOwFAcy7kgHr2BMyZLZqh5bRPPlXor33+Mp6/eQ=; b=hacVNq53hnJP+29Hhzwr
	NeZbf4Zyz91iIGYjDlsELgL20B66gwC6dDEvFjsKVTdkt2SPecZCYxVB4AzH6njG
	HHfMpL0QGMW/LKOVPccuPlxp/hqJWxX6l3QvSjE4fgjarhz3MErflDXDt+OdakNV
	lGmEDwM9SQnhxP7ew2GO26wVUNrQZgZbUV0L8/xZ6D3Cgh7TgJuBur8CeMhpChb5
	oYEIYptNsiu3Y+9yZ4/A5ltkL+10jZ+o1VVqbuAVSgCckoMC/BnNfCBYv4iZZtSj
	REOeTo/YG+Lvn7yxrIv4K41Z0kb2VaUx2YQHs/5b7jB75UlAwv+yEQGEZd8T2ae/
	tg==
Received: (qmail 918794 invoked from network); 28 Jul 2026 11:47:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2026 11:47:35 +0200
X-UD-Smtp-Session: l3s3148p1@DS+EuqhXENIujnsk
Date: Tue, 28 Jul 2026 11:47:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cengiz Can <cengiz.can@canonical.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: fix use-after-free via
 debugfs trigger on unbind
Message-ID: <amh6txid90mJjd62@shikoro>
References: <20260727231026.470146-1-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQXs0T8rdew9pL8r"
Content-Disposition: inline
In-Reply-To: <20260727231026.470146-1-cengiz.can@canonical.com>


--lQXs0T8rdew9pL8r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
>  	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
> -	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
> +	debugfs_create_file("trigger", 0200, priv->debug_dir, priv, &fops_trigger);

What about removing the other _unsafe calls as well? TBH, I can't recall
why I used them. Doesn't make sense from today's perspective.


--lQXs0T8rdew9pL8r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpoercACgkQFA3kzBSg
KbZTbBAAl8lD0ZaYIS0xE9qghmAFaUtmCNpnOEzGTpGus3+4eMcitGSq/UcDOKMz
50vSFArOXOJNJP49zJIp7IGMwX+qLgmFdu1LiE4dUNZLXu+98TsO5U22GtdoszPP
L8xxPfaKLWLKq11NWUs+EpnRbk/1NMgKIPLVSlXkq12mOnKoMlyKpUDnNZLtzuqy
01GKaCo2BKNFKpYrpzFsZVc72Kc8LFRyhq3GYY5eOHJAsIEbuI762LHGuRL4op8E
fPpkKUS3+EkZqglPpStvR+kpqnVztDO0WfVlmINfU5BNB+U06LEf+rkeLkH08D2Z
zUnx/TeB2QNhcBIkSDBEh4Y3W19T8xShkmds8EyjdVmQuRPvIGFi7InkQhp448lk
HlRIpLXeMaHsBlKy7koxGFXQLZFiUPIRsZRVHLxVd3Ll2RTCHsJ1fE3Nb2gBHYZB
K0tB1Em+tvjF4Ek+VrqVZ0vf1/jqUNc+JE5NmrmeOQfpwpSM67jLP9dUESTSGqR5
nNqCZRPAZAl+ccNnPvbo5n3LLAovtEUY8z8iBBVCrWjD9190TKjp60Bg1/YOyIPX
4y/gzE0JK/bzLu99rQXxFaTK0EHOE9zAlExGxbSBcbht+PaTOW4wm506FxHhKiHO
W3HnUtLPRO3xKxFl+qOScS+SImPm1NEYUBBvzlz+tjgQ1M3GUhk=
=jBkq
-----END PGP SIGNATURE-----

--lQXs0T8rdew9pL8r--
