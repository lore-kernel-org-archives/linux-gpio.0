Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585435;
	b=V4DMTmHRVjMRPq08wo4hphkRWEIqhUb4hUpakKjxTn57e7MnDftaEYlBeurFarsZAXN0
	 zzih0YMF9eF8cYMwExgi+h7TtABEfNDM0sJO1uq7UWfKMYPSJWMAaaP8ayQE/+LgyeT6l
	 Gb0wJQt8AltLlJ5FDa+04eWxoHy7m0Tz4U5lTKRJFc/h3ejKC3q480eEQZscvLvs3fMR1
	 iVpgyo38WnSes9wJ/2KqkiCTVjWilvzaqWXSOWs6QSdkcCEWQQpXq+M5/X1Ka4PxiKIBC
	 WlZ9ESJZyeIo4PyhMFNNehJR3AsWlDheRnWw5yU5VQGEt/Pj8VZUEn9A4zXqDVowUHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zi5M0mJRg4p1dAWm4YTJ7EMr2E+1iUxREBzU5bap0i0=;
	b=G8qUQSvUhQ0sz2yXc5WtrwhtV1XPAi0/acN8vg67BEUwYfsZjuXoUJ4BgS9McIuqCnRZ
	 hSkUVJbzRzv7UXtiMG97YSkwDEjq8L8hxTlAp8W5L7ECJZX0H1o+V7AtaCNr+xeRaAdZQ
	 KBGP2daSS8lEyEvEUVI45h7aZPVWpLtmlFDl1fEvRy/pN0HKJ8fYlvugnk4Z0P0A6z4A7
	 L2imB+tn15AvLhjHbfwA25ujdHLc+9zBIfG0rmEcs94mlBEXQSv6vNLUoulXDgFpsHLvb
	 5d0lEe4FS+xkSKBS5U5yFjmf6+zdU1OXXxIwei4Ngl4y4GVR3PyYWMi9H0ILDVxUDzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYzRKokd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1260A5BC7;
	Fri, 13 Nov 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYzRKokd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E622E1F000C9;
	Fri, 13 Nov 2026 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794585435;
	bh=Zi5M0mJRg4p1dAWm4YTJ7EMr2E+1iUxREBzU5bap0i0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYzRKokdAy0SKdI3tHkcUnLg2d5e0Dy3pz1ZIQVdt0oawFgHydT3qbQNSj+XnWsnz
	 aGPsQLAdL7eJQxkgFJtYcKywI1njTS5Ub+JPXBmOyTFgPZvbEEBOiYvQzxQSGx1mBC
	 zpKbCF6sopgEMIyIQREAjNMgwCiUtx8HXO9/8LRanb3m492b33ct9forUlp6L+QIx7
	 f3ZNttCIdZ5hVvDXRV1W+s3cPifDMIhnM8tzcvlY8TlsqUweNi9q53VL+qdq+8WXyl
	 yuslHhT2FR0cWenBZhnRd4aznkmfGbMtsPvLgQNfNKB8aGneqODkP/F41gkw23h/4x
	 IkWgXu7b6fFnA==
Message-ID: <sashiko-outbox-213132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] gpio: shared: generalize most code to firmware
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-fwnode-for-each-prop-v2-10-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
 <20261113-fwnode-for-each-prop-v2-10-4edc23d5cf50@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 15:57:14 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] gpio: shared: define __free() fwnode in one statement in
  scan_property()
--

commit 78d07ba961e7635e708d83665d68a4604d21cd5c
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: generalize most code to firmware nodes

This commit converts the device-tree scanning code in gpiolib-shared.c to
use generic fwnode APIs and guards the remaining OF-specific entry point
with CONFIG_OF.

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 44af3bc1494e4..edd61d16f065f 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

> @@ -131,157 +130,159 @@ static int gpio_shared_setup_reset_proxy(struct g=
pio_shared_entry *entry,

[ ... ]

> +	for (i =3D 0; i < count; i++) {
> +		struct fwnode_handle *fwnode __free(fwnode_handle) =3D NULL;
> +		char *con_id __free(kfree) =3D NULL;
> =20
> -			ret =3D of_parse_phandle_with_args(curr, prop->name,
> -							 "#gpio-cells", i,
> +		ret =3D fwnode_property_get_reference_args(curr, propname,
> +							 "#gpio-cells", 0, i,
>  							 &args);
> -			if (ret)
> -				continue;
> +		if (ret)
> +			continue;
> =20
> -			np =3D args.np;
> +		fwnode =3D args.fwnode;

[Severity: Low]
This isn't a bug, but fwnode is not used before
fwnode_property_get_reference_args() succeeds, so it can be defined and
initialized in a single statement as:

	struct fwnode_handle *fwnode __free(fwnode_handle) =3D args.fwnode;

rather than being initialized to NULL at the top of the loop body and
assigned later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fwnode-for=
-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com?part=3D10
