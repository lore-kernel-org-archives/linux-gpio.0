Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A543634B;
	Tue, 20 Jan 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932309; cv=none; b=B/MnDVp0WjB4DLycLILjOtbzt0Rx5vLLQ3Bx6cETQIFqqM91WmpYg92qKFaiLWgXJClThra8j+FQgsCzCF0DT2Q6f6SzGgbr0TlST6BhhdYpTGFqsauU305K4/XsSLWhXWJKsGf6iWpciR07cvwhY2o78msFmL60rdNxlg9UqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932309; c=relaxed/simple;
	bh=XQmS2kPpeKX0VHtoWiz/3XMk2cOzgvJPzSee+Ir9Ap0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXjJ/92gSlRiyqDwZP57i3sbF+u2wujWNV4DGuAIGm5CAm8qc3x/pAejbhvcSSrq6+iKqt2JfTf1FidJzs74CecR5qwWDQ6/xsxSwDBFI/XFW5MD4QW2mqoGc4yvXqQg3TaG40WShrRWxT+qExZhl3JNbReDurW55eCXp+PQX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkCZO1v4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkCZO1v4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65322C16AAE;
	Tue, 20 Jan 2026 18:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932308;
	bh=XQmS2kPpeKX0VHtoWiz/3XMk2cOzgvJPzSee+Ir9Ap0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkCZO1v4exqk4GpedTDx04NjYU2VgqKsJ/lO1OAYc9CCLwz6CjsIxwc+C7WXooQ7r
	 M0EelZTSlY93r5H+U3gOQsWX1Gi2rWFboQ7qn7trp3TPEjN69zuIxehZcaJYquhlle
	 lzblPsw0/sdLjvmkJnHyGrMtVqiFe2bYPE1zdXu99KS0NBQr483OnPa2ieVqCUqQP0
	 wJdnyUIWG6vk8zXUQ1lR4w3E5j3RIRaqo4KU1LRjPQ+CjJNn/eOWNSLJ/0U0IClXO7
	 u2ROjtIVVsSPu2BWaurK8OLCLVEn1hMXOk0+Hm8b+GJR1HNQQ9NjJRBYciMpJmNt2Q
	 V2derN1L4f/hQ==
Date: Tue, 20 Jan 2026 18:05:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v3 0/6] Microchip mpfs/pic64gx pinctrl part 2
Message-ID: <20260120-deplete-headgear-6bfec966d312@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
 <CAD++jL=i5o5JbqD_7jhFY5cR-420Vb3hnNXv5nrTd6-FHon5Dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJWRsDVAgMp+UCTJ"
Content-Disposition: inline
In-Reply-To: <CAD++jL=i5o5JbqD_7jhFY5cR-420Vb3hnNXv5nrTd6-FHon5Dw@mail.gmail.com>


--sJWRsDVAgMp+UCTJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 12:45:05AM +0100, Linus Walleij wrote:
> On Mon, Jan 19, 2026 at 12:04=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > v3 here, with the rfc dropped. I've still got the property checking
> > stuff in my todo-list but not tested it sufficiently after the changes
> > to add generic string properties yet.
> > I only moved my drivers into the microchip dir, I'll come along and do a
> > pass on the rest if you're happy with what's here.
>=20
> Looks good!
>=20
> I could not apply the patches because I have Johans patch removing
> the default y in my tree, could you rebase on my "devel" branch?
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Ddevel
>=20
> Pls make sure patch 1 does not re-introduce default y...

Oh, I didn't notice that patch. Guess it went in over Christmas - I had
a month off basically and barely read the lists :)


--sJWRsDVAgMp+UCTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/DpQAKCRB4tDGHoIJi
0ummAP4+Ga+fgyvHW+/bnVu1GLYzB8cNCJD/okQn3jUk829+KgEA58I0iM5kBbTl
k3B/5bFc/D4LueRK3I18rRJBZQWpvgY=
=HDit
-----END PGP SIGNATURE-----

--sJWRsDVAgMp+UCTJ--
