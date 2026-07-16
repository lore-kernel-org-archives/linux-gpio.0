Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A017343D75
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231946; cv=none; b=TuyVuQQWGOomkjY1kH5+kDopsNv7Y9mCHWq0S2wMksknx+JP4JkqRs6NcqvpWPFndaNyehLAqFoENnhhsrGLrNEQADcMhy8RLr4X5JkjDMLwHFYcnaabKaXSspq8/fCARMN/qKLK1HrbqSYidfKkyMTt+TkZSB6LkY3rVcziVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231946; c=relaxed/simple;
	bh=R1baLxCQCKRPO/bG+l1tOT3SxEBoZkIFD+lf/R0Dxvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWOBpAhBuFqDIYNCh2On/hIOgzW4c2ec7PJWiOxq2iGugdlth7PcsD//pzKJ4+24AOi57FYh3WvojyP+DMYN8XBSlr4AYS4MPrkHaOcP4qmtajItZCnEq6aWT7lNpD0psHu1vIaIp7AiSPR3zKMojeHOMlWhpxG5H2OT5hGLIZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SgD34G+P; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SgD34G+P"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b966dd74so28766665e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784231943; x=1784836743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R1baLxCQCKRPO/bG+l1tOT3SxEBoZkIFD+lf/R0Dxvw=;
        b=SgD34G+PYcxQDN55MTr/JyNJMk2ZhdQLZM4Fhwhvv6un5u0OVWeO8Vu4e9zPSnz78J
         3M8H90JsaaCpgL0CaGMOW+HJCrnWCxpA+W7bV1O0k8/Iz5zUPaqg9IlsluyFHFfo2mqy
         9UzjD5HFERFcH7wPR4dpGibK0grCp3v93rBm05kj2hFh9eNHk6cUq+dDIdImYWvFCIqM
         ilKPaQax1fkEHf1cjUGYIDGwZvKIsBIUj7oKwF+MCzUwZEHBkhodKtIUZg5VtM9qpJt7
         Zsvk5zid4GOr56ajMSt/Gg9Pq4pxgV1LDlCeC4CXyjkoGE9RS/0QSsemVoU6ytROfE7p
         RvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784231943; x=1784836743;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1baLxCQCKRPO/bG+l1tOT3SxEBoZkIFD+lf/R0Dxvw=;
        b=gJbH//CXRi6tTBQAdTRzmMnYj23knNXp2kR4URsmyqWqOuvMabYQnMJreXpNisqUGk
         PEZ/9/FmdHNSlwf4g5PnILskRtlWzo23Md2C5JzxTNpqT3zG8MOkzlK4gSMLTjW+iPSk
         q+LSHnh3p78S6H1GbRDYmKQDExjE1IJScXy9MbPR5L8OdwgeSEJ5HGlT008DbkE8qEjw
         SiIqI2QenX9Q0HzHOjSiFsNti2Ylg8TkOyWxDKxqYfHHDYG2ZkigLYRHzTc/Erl9KA//
         VjsLk6g+/d242fHStcGfz0qAwN/BxIkVsqGJbulK803RKuR5NI3dbaek3P6Ofh8bg58H
         vNjg==
X-Forwarded-Encrypted: i=1; AHgh+Rqp86OycO7FjT+zXQZ2Sl2lzP9liIXlUqt8YOq/juqAQk132H86RgsFajFtYABbfqv+3FipVS5iAvbo@vger.kernel.org
X-Gm-Message-State: AOJu0YwpHXUt9x4sEo2qqCimPPectLOcPsfm0jr+5imEzQ/6pYiDZIDI
	fGg6cP+kmflo/X1IiHDxzDtbih5k3LAG/YnxHcFvtQNnS9h7si+xlE/RGgx7hIY6OGY=
X-Gm-Gg: AfdE7ckUxEIsptISCszxlSz9T7pRT99EnDK1szZU78c7q+ajKzJUw/8PkV0rzB/ETFy
	o2q+/B4dDkjvOwQ4KNLPVVRHW6drMth86xEizk7MKK0DeKgliIiL7uZKr0ZlN1ZDP/fUSOev/JP
	dMT8LbEfw6OoXJjhBZeZQmgHbkMwiBcYw+0MXgspWudj+fK4zOihQ/2V44n05aGPcaeQD7bpspr
	Oksg4u24fU8dWpd+MfVUFjrUDVnPWMvGSiqGQYhzIxG/xc6nULInfiiWXcEuUBBjQIKBjybbYJ1
	gouomr0kWLpZ70FSSAWC+W1+Qof2E2mPZ7yo9JS+OyseV90cdOZnDyGGBVay5NAKfSu8fq7z9gD
	5JyJ1IBFMAhZRAHBcIiRlQoHgeb/sNv5hTWp5gvxewurRQSejkc5bvegvA10utF5e3kXq4CYjbV
	NfnHDtqKM=
X-Received: by 2002:a05:600c:6b67:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4953c28b651mr72345965e9.28.1784231943123;
        Thu, 16 Jul 2026 12:59:03 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c70f99dsm112399255e9.2.2026.07.16.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:59:02 -0700 (PDT)
Date: Thu, 16 Jul 2026 21:59:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Michael Buesch <m@bues.ch>, Andy Shevchenko <andy@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Robert Richter <rric@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/21] gpio: Unify style of pci_device_id arrays
Message-ID: <alk3rVVM6bqsJEu_@monoceros>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
 <a5c6484f2ff045068b667e3c08e8f98fd31cbbc6.1784133987.git.u.kleine-koenig@baylibre.com>
 <alkYFLPlMOT-8EH1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2gzgalo44cdbe5b"
Content-Disposition: inline
In-Reply-To: <alkYFLPlMOT-8EH1@ashevche-desk.local>


--r2gzgalo44cdbe5b
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 20/21] gpio: Unify style of pci_device_id arrays
MIME-Version: 1.0

On Thu, Jul 16, 2026 at 08:42:44PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 06:55:25PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Update the various of_device_id arrays to conform to the most used and
>=20
> OF?!
>=20
> I guess you messed up with the patches in this series. Two mistakes I can=
 only
> explain with some bad rebase happened or alike.

Hihi, this was already wrong in v1 and it didn't stop you to send a
review tag: https://lore.kernel.org/lkml/alXyfR6BKsW6tEAo@ashevche-desk.loc=
al

Will fix in v3 of course.

Best regards
Uwe

--r2gzgalo44cdbe5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZOAIACgkQj4D7WH0S
/k4uJwgAsy+kffBwD+5pLPj9Aj+1HOmL7H8T6Q9GQEWzGj2gZ1R9ytrmsknPUkDZ
pQlWa8wYf4zJMn5lqVIdeOlcQy4gBJGF76hjVr1MGo1DLsK6DYcHKoI1y4GJi5h4
lw5qBJKk1vkPq9SxwFFo1yx8kN0EjVN6wLJJii6yHyErGJvXu+cW/CJg7r2gf6x/
9ynLqIXEpye38Q5p/xWLbk1OKCypYZBamwZKhTNWeTBkcd9ldugk+i5wV1Rj8JwF
9/reCQ3rUCKp6gimRazQPstwKpyGebPAWK/uy3wBPg4i0GbF10tNfms+GlL1j+kC
ax9fP2qeysiVdbKVVE2HlXcGJzRwdQ==
=kvqJ
-----END PGP SIGNATURE-----

--r2gzgalo44cdbe5b--
