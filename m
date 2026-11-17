Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924655;
	b=LjX2Sc+715Fkglu8pY3mzndKM6zvhBIqiKSROpkFm2F1iCsP24sw4iaIxWGxQsffUTZ5
	 4KLkvg12sVWlDrSt8o5zrlSY4skMw97IirhJIIFVgFpqHDuMWGq0OMko+Gg9CpYjpaA2C
	 jb57Zf1V5Qk7en4Pq9jPHKHppKaSNbwNA/LegsfjS1R5HgLBQbQPF2VZKWoCL2Cruy+en
	 69AZiCn5SuOiF1hl1FYWbwAC1P9dJWaFp6osAbL+T34zXislIGlWqR1bgrH3qJfN8BKm0
	 mvGz6mFxhBIQH6KBdYMneLPjkXjG5Arkvjdd6AWUjyIUFeNHc17HH5hM35na7v3n7DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
	b=j7nk2ZXPIs9fktDbQdB19ZVbXiDkYkFWnZlu5oLWeTgvm+pfFRhBwmcTnQlme0txFRcc
	 aHvWeBnGT7EzV8pV1gkYfsJ8vuQ/5zfZJ1wnAw5ZnO/w3lR0F62DO8WMTV95bhVi5VfY4
	 WO+KaaNTVf63TumfQQjAOmfYee5n/1S7jWu4mFFfPzNAXZQoEZm5pOV6B2PqfB36tCjyR
	 iyNDFH5tZ/LXeIAafutUrbNsKoVMyEdEQP9WnaRn5OnfV2vjZ/MkFk1IT2yMSI1MK6vko
	 7pgrD295NMf2EstoywfX5oqfXCSj2NkVJNKsHpPuE8Mq3ZLV3qKTKjRlBETPmot2PQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985E606A333
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2985E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so50809795e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924652; x=1795529452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=d4Hvoy7pxpb1GN8453dYuj2x9rXEaWYlKEof1StTGBlLww33R9Lw6xoqKlcLrvYHEg
         YcA7WzHjoCBNwPefRW6wiWxxjZg3WmvXAVQ/y2CBvz/23FocTudxaF+7f3ww/6QDESZu
         MIWrhq6uVpRNeTJkq6Mf8mk8Flvjcq+dLp9jS5cXdjT+UGfOcdK6p5l8SGancjifHb4u
         +3MpGfW93IOtOsvzaQaIUIlUWOY8BM+V/MZdWKyoxOkFkn4wG4hazAfMG9pMzlgxN5tQ
         omoZTKXXn+yvRhWDzhmpSGiKLyGnkXMRCjkj2bq8cVcNbS5a2xYBqpyUUlW6h2KpiPmv
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924652; x=1795529452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=ksx5p/8E0TqJaE9qc7Cy6VI3InoDE8QgF36SCLOcUrfZUaH9/1Re4MhGVFPM5b5Uc7
         Zs+vCpMKQHpYD++sNfRMrz2tIB1d6+S5Oku6SioLGV9WCgZD+BcnrzLoNCv6rVDhmedE
         F1CoLLWop4P/8Pmo0q+/sGY27Z3+ow65B8K2FPLpiQ/+WPknmzBiOTLIdK80WTGzqcvw
         0+PuZSOXXJfMZlXSBmAmdwiUffpCxpNAMPTBTAIwqyhCK5JzNj7KZxMvALzr/+bKQ6mP
         SPh7oaxPM/+LQznTILub5Jiv9qPlITuQpr+PJSoa8GXjzMgGhAYcTxhVwljzuOnxOYu2
         YxsA==
X-Forwarded-Encrypted: i=1; AL+hErGhckXYtIu6euMvKxkfJvWU72uuSJk+ilC9pWc/Lm+0MH3P7m0OccGMLYgjWi5RwrscFbsFpuN0D/Pi@vger.kernel.org
X-Gm-Message-State: APuU4Z/AU+XhtDn0emDnVz4bXbZsPR+iQRbAe7kkelqwX5pKmKVhFviO
	acf1c9e6WhTqe4RS9VOSy3PqUXfH8T7cExeMwCOb+kWGpv1TL0DmAkjlGLq1wj9Qg0Y=
X-Gm-Gg: AYBFou3Wyw9L49gJwVo6xzh/l9H4ZWFcVi9sSWKWf/AUPikSo28Z5aQ/cVWyy+wCx8A
	8HiCSyfZ69NIOSWmJ23nldT5azrUTqfvE2+TPnddZo5QwyGKbE8bloRduk+5n9FHadpePnmIV15
	C2Fi2+CEdysgMHSxCSGuMLC8Ikryua4No5BA20VeUX5mFF2ZYfN9tadyiEIW+z6VWvvm0cA+9K2
	mZ/AEH2BZqxCDC1C8gUO5N4LOzgioPds3rYFMnvY8k87Zi3oAT9c6baAx8PY3J//wYvNq4UoiD6
	vwBaiO37bmVBiyVTj8W5POW07Fjbl3/dSSru6oiN5Jz9AuOCwmM7wwi6ygth6J5VkZbvND1rhts
	KaGCIL3C9obfwOhHACC8SsU1Z++3+RycEHQrRv6dLcw6M3ytsJS4Lz7Jyn6OuRUsbxw4fGqSM9P
	lhTolPzgm3EAy9kh5BkpZ5/QNYgtgKKi6bLOGsb+T8FSEmIV/5v+e12MbkI+4YbIcSPa+OuPXWN
	Yqp8mcqACyfh2UH2sYlEc0r+TXBLodi7QDy1cWktjDjqpwuZ9+/YJ1NYPUWsO3J2ju6Xe+uxwEU
	mXZ248khfyUupy6HWS9HfoVmdrGvUYXVecfOwRxIOEyhfqc8sb0H3LBSJnDHf4rl5ecrWIlOcgT
	wNFozm0e9IDij4fo=
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr196643105e9.20.1794924652481;
        Tue, 17 Nov 2026 06:10:52 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb78386902sm78143685e9.1.2026.11.17.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:10:51 -0800 (PST)
Date: Tue, 17 Nov 2026 15:10:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: CL Wang <cl634@andestech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Message-ID: <avxgGQL91z0ezLFH@monoceros>
References: <20261116040914.368298-1-cl634@andestech.com>
 <20261116040914.368298-3-cl634@andestech.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyuwbzqgdey2ihm5"
Content-Disposition: inline
In-Reply-To: <20261116040914.368298-3-cl634@andestech.com>


--cyuwbzqgdey2ihm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 12:09:13PM +0800, CL Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> adds a lot of unneeded build dependencies. So
please drop <linux/mod_devicetable.h>.

Best regards
Uwe

--cyuwbzqgdey2ihm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YGUACgkQj4D7WH0S
/k6Nbgf+OnbjIDFyQv3zYIqcwE/Un//NPGHrFQ9idxBn0sOWRA4bwsWkktGVG/ci
m4eZ7fh6kVNQ/S75Ab8pg4+r2nges3azKBvLpjUB0w8W7GocXMcVhVGgtnEs7NhX
x/C6fVqVxbFKcc515ipiVvs5MMQ/WyFf+AXuRea4KgAhVBdsSznpQ9MSYx5S5pNf
LOXxIrMnnkzVHODUtFQqnUBvRheMhndwVSTKSO27i3jV5Ru2mjYMx9U1alrty93N
LEhseOe4f6Ug+BRa8c0+x51EuARRVFxGNSf6b+uuy7zgz+hR3My9bhyu9JFieWmA
lDkM4htuy3LfAAWTUW8eTCDBChFi7w==
=Nh9T
-----END PGP SIGNATURE-----

--cyuwbzqgdey2ihm5--
