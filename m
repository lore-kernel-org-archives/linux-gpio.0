Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223813;
	b=Dv/FoxpWFNnW8bJN8PNYGxv8SInWAVVBgTtlUPutrJd1LLyUO5dhbAeYMfUM1iG9Vd6X
	 kvWR78cvFoBDTxGn31OXJZvEA7THQoiUwJQLYn1YxVUeBu9Hcl4oTXXjE06ijZXxia+Xb
	 6yaWu5WNt5RTvrndmHEGWfkTqs3SUkfEbpMz88a4F9H6N40Ch9ITB4r6KNWOLoW7vdlfH
	 FVGVogKoBY86CkGfe9kpA/LZXvoGzdOtMA1s4h6JE4lG3dnc5mEJ6FkcvtzfcS392SWcW
	 BR16+89SKeqSgPvIWk99yP+I6pTzToHt2Mys1yfFbpoV3yieuvrhKJ5SSWebeFZCW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223813;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type;
	bh=NS2SIbxhDO8ZQNKC6bcwrhTZ6qJAvFtsO8rW3FPBlJg=;
	b=qKTlWILJ/9QDRdINoS2Pxa3RvG83uYIP80KBvItx8oerw/ir4u1RYE9u3uGIwbUpLVvV
	 lNKv6W3Yk0WOrwZic2FSHLlWNZgAqCmn4K5Lv5l2TsD5Jk9ikO26pEaJTHH66aiwdvqhE
	 wJCTVSOeddWbRqFv4fQwPca7RaICSF9Xpdt9QPyIQ79Sq2PMpIdu0OH2vCGrS8SFJ3iey
	 fY5lC950BSiexHCPykJs9+oFyjo94VcIfKCZ+D5okcEA5TPdmnNf5D2KV546AgeP2QkBo
	 9nCr16LMIkXB81QnHf+jr3j5LGnwlBaxYEE1sbjNsaoqPjSbwn1S9EfZ3eBbc9ZRwbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRaPHDMh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEE606A325;
	Mon,  9 Nov 2026 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRaPHDMh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88901F0089F;
	Mon,  9 Nov 2026 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223812;
	bh=NS2SIbxhDO8ZQNKC6bcwrhTZ6qJAvFtsO8rW3FPBlJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VRaPHDMh6gCIKI3irhdM3HmzHAqDu2XKLgKpTNJOJzAjL8M1SUpEAw+zSzYb0kFM0
	 i0kqvBZ1XJnUd2wXS7QUePvm9+TJaLv46yKW4JYT55oN22IhgrjjxmQcYBRaTWWCLG
	 XAkYXUPk+FCklS1R/BpfWNmhknabQhGs7VX0ed4Iy9YQ59Yr9EwO/bUxts6qTZb+Hj
	 gBQPu8Y3SX4+UMMTPy4rgN7yVBUZ2xPZaaYAOoxFTKdhQ+mjARtTx0LQeJQG4mJNNB
	 CvdheQoSSVb5UaJh26+K6JBmNALxd1jadhgTykVM98BiDReURDrjsFfUZESbyrU4ST
	 af//p60qYBg7w==
Message-ID: <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
Date: Mon, 9 Nov 2026 12:30:06 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
To: Bartosz Golaszewski <brgl@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4gqc21xnnrPyxBe8xfFyJ7mD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4gqc21xnnrPyxBe8xfFyJ7mD
Content-Type: multipart/mixed; boundary="------------OxD0RAdXY0oat7PgffFRo5hz";
 protected-headers="v1"; hp="clear"
Message-ID: <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
Date: Mon, 9 Nov 2026 12:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
To: Bartosz Golaszewski <brgl@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>

--------------OxD0RAdXY0oat7PgffFRo5hz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Bart,

On 2026-11-09 10:01, Bartosz Golaszewski wrote:
>>  static const struct of_device_id ppc44x_gpio_match[] =3D {
>> -	{
>> -		.compatible =3D "ibm,ppc4xx-gpio",
>> -	},
>> +	{ .compatible =3D "ibm,ppc4xx-gpio" },
>>  	{},
>=20
> Uwe: is this in line with your recent cleanups?
The change is fine, I'd appreciate to also do

-	{},
+	{ }

at the same time.

Best regards
Uwe

--------------OxD0RAdXY0oat7PgffFRo5hz--

--------------4gqc21xnnrPyxBe8xfFyJ7mD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrxrr8ACgkQj4D7WH0S
/k5CkAgAhdoKe3erNvOVhVxv4sSIBhLVc9ZX7XxQ29dvyfavfOYBkh7gobXeuRb2
1o58H0apPhMcnk6I3bbXbBYVA0v0zqqRr1nW0wmSe3gLJZBH0oP5MGSs+uRMfXZu
t4k+qyqEZkrLUHmKr6H/vEzf9pcuAVfxyl8WzOkRCQfh1kzE1Fb4iwbX9unI/4wL
tCrxPSjVgO9Kh2P2PQzJtJxDXfve4cV/XjW42szf2B6krr6gmgNESatocqXg+q/j
NfRjSESARWj4oTftJ6Vqzkan0SEah09czSMarKiXrKgWabsdQ760kJ1R+Drj1P/L
fM0GKwlbx4SEHij//3NKOuZ0VJ+Xmw==
=yBUB
-----END PGP SIGNATURE-----

--------------4gqc21xnnrPyxBe8xfFyJ7mD--
