Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D82459C6;
	Mon, 26 Jan 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458049; cv=none; b=dLDYw8yZ45raFuI6fjWFraydgzmjfDzwqTxqaiHtcfQ7cjnPZBcqC1KkVO/DPTRCZdswlDM2IymYtK04lLg4XQfmB4OmXXa6FRNsJIhGI2RTdi1kWhcr5ApKgiYYqyUpE4mk3dUFprGc5STgpecgVbKE3PsJxYwbdi/Pk8SJtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458049; c=relaxed/simple;
	bh=FdnzFm6no4nE3j39ly/IUKINcFapB/yhhMb4QWZ2BOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/A0Q4LFmOOu0VEh4Vpaxg92VjLOUn26/b2Ivnq5FloiTOo4VHg3opZh2Ft/SyJw2rkDX3cSFFCIt6jHPrPt9QnNFnSnETZUoNMdV9FArWkupLclhGAJZM6K0htbOtotue9ZnY5nvPrPRQtV2L/I3ZOkF9UkVcLTdG3TP6Af3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO9sDej4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO9sDej4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A2DC116C6;
	Mon, 26 Jan 2026 20:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769458049;
	bh=FdnzFm6no4nE3j39ly/IUKINcFapB/yhhMb4QWZ2BOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO9sDej4xqSTt6fnjp+UMomgNVjc9U8J2DFTPuPfWLpArkG33oyH3EE+TSSpOwkwh
	 YMs6ALmXP6qirqO93GSw9HfWYUsrhDDvjP4dw+yJTL6cMSZQCfdPLW3Gfpo7l0slLE
	 szY/Q4fNJpI8xg3TskqW3rX1wSe15QyRRA+EMoH8j3M5t5ZykdL0mPuzm9rrd758ux
	 cv33lZEe/HI8fgLZZ3wQFUciv9MxQixos9RiIg0Lh7x+7dPR4ZD6JMWjB8pvHwx9rA
	 n9glKtg+dqR99hQcezDDeLbHwm6O8Eu1uAetFp1ydXOXTT+fqY+zCawXIHtvVjqxj9
	 JolbtmkYCC5NA==
Date: Mon, 26 Jan 2026 20:07:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: fix
 'usb32_drvvbus0' group name
Message-ID: <20260126-reassign-puzzle-b0059b256215@spud>
References: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p8k/SuctRE63kbtD"
Content-Disposition: inline
In-Reply-To: <20260126-armada3700-usb32_drvvbus0-fix-v1-1-9dcdf68f5fbd@gmail.com>


--p8k/SuctRE63kbtD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--p8k/SuctRE63kbtD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfJfAAKCRB4tDGHoIJi
0nKrAP9KuUwIGAJubQ1yi6QGeA5rw9pRSGKj7AUSfgaNXKop9gD9HxE9XQtuplb+
WxPF8+WWPIaoICmtzKFHwZNdMp+LWQs=
=aYbG
-----END PGP SIGNATURE-----

--p8k/SuctRE63kbtD--
