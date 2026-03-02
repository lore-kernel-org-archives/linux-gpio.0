Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CB2FE044;
	Mon,  2 Mar 2026 20:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483034; cv=none; b=GViKallTvftKiO5wWljefzxwk5rHKd/Yl3BhzB4SE4/6w1b9kuJBCqanXMOMS+O+8kgwbZGo3HNcZEw9q0tsyVjVLrCCHQLhJ08t4v+G020R/o7KPi5dXN1O1e3oWc7RwOQAy2/veY1DNgeGoHGjL+eIyLDqAIUD5I/YlS7We8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483034; c=relaxed/simple;
	bh=nfZjio9mqzPbmGBKPpi/HAe2lojuaXWKi2yE0BlVa5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6bXiWuCfKIe9UbaK2/2w6aOEFEgc+pxKII+WjOcfnGVPGEn3GAciy1cG0nHECVaM9Ot7hbXd3vDe9sM2bDP1T4EukI1P7jYRwLFoqpRc4nYsxnMi4mn7YykG6qE7N4fn9X8R28oo7eIC8cLOlBsWqrLznFbjZ+fEZSXaGlTX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=pass smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=dnhyJLq5; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stdin.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="dnhyJLq5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nfZjio9mqzPbmGBKPpi/HAe2lojuaXWKi2yE0BlVa5U=; b=dnhyJLq5x6ZfAp3Ai6T97W1vWi
	p0HFQU/awWI9vje3s9C6j1fL2IAn3Nx2pkoKmdwT+CZEWpOi5dALC/S+1lwA9+KGhAeoEexIT0Rag
	M6dbR6PYtKPN57PTjIzYhCdSfyob8DJ1+SOQj6+IBA3ddrTpNB6ncoLrNyp9bovM25Ro=;
X-Preliminary-Spam-Score: -3.6 (---)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1vx9nv-00HGhp-0K;
	Mon, 02 Mar 2026 21:23:50 +0100
Received: (nullmailer pid 2619430 invoked by uid 2001);
	Mon, 02 Mar 2026 20:23:46 -0000
Date: Mon, 2 Mar 2026 21:23:46 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RESEND] rockchip: Make gpiod pin control work and add
 gpio-ranges
Message-ID: <aaXx0ez9-F-ObJhO@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260302202121.197288-1-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="stVqFOw48iOWV2+/"
Content-Disposition: inline
In-Reply-To: <20260302202121.197288-1-matthijs@stdin.nl>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--stVqFOw48iOWV2+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The second patch is just because I was messing with this code already
> and had a test setup ready. It makes gpio-ranges explicit for the rk3308
> instead of relying on the (possibly fragile) legacy workaround in
> gpio-rockchip to add them automatically. I tested this be removing the
> legacy workaround from the code during my testing.
>
> I think the first patch might be a good candidate to backport to the
> stable releases, since it makes a userspace interface functional that
> currently silently fails. However, it is not a clear bugfix and I am not
> super familiar with the rules for -stable, so I left out any stable Cc
> tags. Feel free to add them if this seems appropriate.

W00ps, seems the patches got reversed, so swap "first" and "second" when
reading the above paragraphs :-)

Gr.

Matthijs

--stVqFOw48iOWV2+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmml8c4ACgkQ6ZMxy91t
JYwJNRAAknhHzotXj0k4496wmeitnuquO75epkGmensDC8x7HAYlyTTxt36Qix98
w1e5EaCjwTqpHLkFsJmwu08N58veJbR5xn1oLY9vtta6KQvi+sw3FkL/PIh/eI4x
J6Q/aZNt4T3jX1BuKYHfJ++4oOQ4O0b1Yjox/D7yC8lnjnwL/hI4Eoy6MRe7q3Qo
fCT0P1YeUGo7stcqJmsKdkduGBluwJRpSrOm/+I24Rx95t+UAlQ2F9LBda/wOpXQ
Dubtzjvli8KeKWn6/dE5czbq6ufglhmnAQKa9hr03YDl4+ffdaq/7Q5Sv1DVRFla
I3dPtbvjwYLm9v+Nta7TXMPbsx/BRlOZd6PpZEl2+re4ja8HI98qTwae+Yk9gYrJ
l/zvNVQAqzi8QqJUTPJJmSgRV7f1H75xthbGeAbKYWZD5aAfNQXBileZ9rTIbjq1
UwMHlXLNLvpIu1ZC8DiD4cvIZ5PBjwHnQwe0sP9rONe84bDCzHy+Jsjbv4wQF4S3
wjiknPlarYuh8XKQAoD/jQX32sZCEKDx6eC/Uw3Y4T5Z1jiuMMr3C5a9/hFAWdZr
O7NgUdel42dYb9Eqq0xkB48Q8aetZJlC2x1AG0IcnSP42qSynxe7GTbwlAjS7wrQ
d2yTP/TWvxGCG6l4YVYmBkaLaMRqCpap0waXWlgK8C7mlvqSQbo=
=gQkS
-----END PGP SIGNATURE-----

--stVqFOw48iOWV2+/--
