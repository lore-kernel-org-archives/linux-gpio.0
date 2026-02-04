Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3740F8D7;
	Wed,  4 Feb 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214285; cv=none; b=f3wbyLIKoTfnq5SFIPVWyHcw5UAY6JahPXUcNEYHjAYD2HLu6wlGlLdxWHku1H0/APJIjhwRSSzik+vEE0DB/s1nCtasoWQUYflPL9Lr5zdvHrq9os+LF0UOf80B6jG9meoSJ8SgzybbUP3VkJykL+tghOORZ0toEKe+gTNedyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214285; c=relaxed/simple;
	bh=WH5QahUO7WVTbnWGYJja/z9xS/7meXJGhqhU/1bxuok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSPuFRgOaIOSNCtYwBBORBQZfmNlQZk+wKS0nH9Bpt5u0+VGVwfgKYmHGRq7Kl7XDOzl98njodNFHcs0Mwg2kj7NrUR4NbmihKSTa8vPfWbzbqxMR4WHSQq3X4tcCp/jB/wUfnxipn8YPQ9stoRrqJ5srGd5NEi9wMvUzKHkbjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e70dhP5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e70dhP5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DABC19424;
	Wed,  4 Feb 2026 14:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214284;
	bh=WH5QahUO7WVTbnWGYJja/z9xS/7meXJGhqhU/1bxuok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e70dhP5CPwYeTcgaf+EAe9PXl3GthoEElxicQBwIn1zimM81lqnxpEyYqBS2UZhhJ
	 pAg7k0anT/V/3hIxzVpnV7OL1zI8yXzVrRIZyxSRVkGevzVl7RHg3zGZZ2GdK9pVks
	 uDETtkjHc50NNZbm4O3Yo6haP8kdVGw0TG/e97c/+qN7CAOeBzoqYv507E5XxmFACV
	 bpUTSxpvj94cMsNAuEflKlfGyYyltq/wUICXhgHhIjjP0AmndGqOoLjtb0aMEPmDy/
	 ehVaUHq3oMJJ4PiBKsU64PsDkCaSjL9n3LulOznEOALfPXLNU2ByzJC6u/Xj++qN3M
	 xsIx6VEakYydQ==
Date: Wed, 4 Feb 2026 14:11:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [rfc 0/2] pinctrl property checks
Message-ID: <20260204-twentieth-facedown-55eca3d3022c@spud>
References: <20260203-device-unwashed-ed24f8592d79@spud>
 <CAD++jLnz1r1gnE3B_0MCr0JrfEdT-74nM7wL3ErdrmzHOrnovQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1CSrqGD1uvf0jDND"
Content-Disposition: inline
In-Reply-To: <CAD++jLnz1r1gnE3B_0MCr0JrfEdT-74nM7wL3ErdrmzHOrnovQ@mail.gmail.com>


--1CSrqGD1uvf0jDND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 12:30:30AM +0100, Linus Walleij wrote:
> On Tue, Feb 3, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>=20
> > Finally got around to sending the property stuff that we were talking
> > about. It's definitely not the best thing I have ever written, but I
> > think it does an okay job of warning about setups that don't make sense
> > while adding fairly little complexity wise.
>=20
> I like what I see and I think we should apply it for the v7.1 kernel cycle
> post v7.0-rc1.
>=20
> Are you ready to send a non-RFC version by then?

The rfc tag is was more because of the point in the cycle we are at than
the question on the driver patch. Sending a non-rtc then should be no
problem.

--1CSrqGD1uvf0jDND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYNTiAAKCRB4tDGHoIJi
0rO1AQDg2EjTzYP8wXL3AM47YYwKhhkjEFNhP7YVRUnka16L8AD/XkHcx6LuEzeF
qVo9fhZVhLDlgsnridoejiLDPSQkLgo=
=icK+
-----END PGP SIGNATURE-----

--1CSrqGD1uvf0jDND--
