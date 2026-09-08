Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1D5583ACF;
	Tue,  8 Sep 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887024; cv=none; b=TXRcLLVnD5RJCJW1ifDVEWYFONfMyoMVCScHC//HTBHGz5Vprex/rP2FGVxi8LoihEaukvqL5ZVydAs1Pcf/kokTT1mX1WjBBjoxqnY6ZqmwmlYoq7LRpESvuQDDOtju6xp4AIbT8OQnH5ZpwPni6FOveWdfkGRe/RDCES1y2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887024; c=relaxed/simple;
	bh=3BQMzu3ugMZ6g4f160YwvxH0HvU2r7QQo94h7vyc/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3kXslrNMti+RmFsEBxbZxsZ2mnjXzzPqy5YPl+aM36Aeq5LxWZKzxxrqO+190BEr+HUQUQssq9aS9PYQ6WYr5iHjjCUREOkwsBhbksgLutI5KYrMe0p7HT89Rsitq4JEOGCKee5mWUqiUePU0gp0RoMRW5YTlnlGdQDRenBf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMazRXlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMazRXlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86511F00A3A;
	Tue,  8 Sep 2026 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887022;
	bh=3BQMzu3ugMZ6g4f160YwvxH0HvU2r7QQo94h7vyc/xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMazRXlCaqgQX/aCRM6oEinu5o4VhEXbaRsGKfVa7dfe3CwGtpPW/lWboJ2rxcfR4
	 mzfzJqgM3DiPrJtLHkXzu+HDoL83YHUGc+ezqjTQ/60G5rBzvJbj3siEPLrqhkxZGP
	 9TklLIo785KtX7en0AyhVTBq6n484T7ibMUJHfWKw+5X11op4OVAYkWscXaquLl9bw
	 n81UVBDrtAaoIJI+iMa2LXS21h/Lz2NOpOqTa4AaVXpKmC68apT7fWTKI8/1GSWnNt
	 laBS3xTjafNm6NvlRWWPCw37+9ujYom3POQRdKbR7zleuhOS+JJx9y4keR5oFRpGcm
	 5dpByqvubTuog==
Date: Tue, 8 Sep 2026 18:03:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Message-ID: <20260908-applaud-dallying-9027d7a8a598@spud>
References: <20260905000919.155694-1-rosenp@gmail.com>
 <20260907-unnamable-geography-d04f61df0fe5@spud>
 <CAMRc=MdHUpmoFDtmXdbXnbS+_4ffBQcFLo9XjdO=jMom+getpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vjiUG8PBMbT8beL"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdHUpmoFDtmXdbXnbS+_4ffBQcFLo9XjdO=jMom+getpg@mail.gmail.com>

--3vjiUG8PBMbT8beL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 12:37:21AM -0700, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 18:54:12 +0200, Conor Dooley <conor@kernel.org> said:
> > On Fri, Sep 04, 2026 at 05:09:19PM -0700, Rosen Penev wrote:
> >> The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> >> expander and is register-compatible with it. The addition of the
> >> compatible in the driver missed the documentation update.
> >
> > The commit message makes it sound like this device should use a
> > fallback. Why doesn't it? Either it should, or the commit message needs
> > an update.
> > pw-bot: changes-requested
> >
>=20
> Actually commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
> pca9655") added this compatible to the driver back in 2021 but it had rem=
ained
> undocumented until now. Unfortunately there's no denying I signed off on =
it. :(

Ye, but if patches like this appear for things that were undocumented
but ended up in drivers we still try to get the bindings correct when
they do show up. The commit message is basically telling me that this patch
is wrong and that a fallback to the pca9555 should be used. There's no
impact on the driver, so I don't see any harm in getting the binding
right.

> This commit should probably contain a Fixes: tag pointing at this commit.

Perhaps, but I'm not convinced that binding patches should ever have
Fixes tags citing drivers.

--3vjiUG8PBMbT8beL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqA/6gAKCRB4tDGHoIJi
0kG2AQDOo/oX8jcsUDelIaVes9qwAh5b9nS4DBsp1+sHCdAoEAD/ZQJ89Wz4fHJA
yf0QrlvhwkaD4bsXqsxmJuI7vruffw4=
=8wzL
-----END PGP SIGNATURE-----

--3vjiUG8PBMbT8beL--
