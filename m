Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80246AEF0
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760292; cv=none; b=kXfFkcOVPGyN5OUT9Fza792BPNzT/IClvWwIP23gqoNesYhT0pIbOb67Rtqxa0IWjjlw+lm5yCU8nJJdktjvufioyUgDH3cKmhaWLnK/ErThKyDZbWA3rdAYE8tI6STPFWWKU8KaN2qiBC+wLmzDTTvOKs3pJNriV6qc5TnXoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760292; c=relaxed/simple;
	bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjzovGgf+Ku0A5aOp9+1T0QqmNRLzqwEhsVhjISjhQnNvHXTGGHnKzk/wbLr8E9IWis1tTp2BAD88c1I/3BWHL1qqb6XzX8MzMVbYXnD5X7AZdPTDPX8wDV7QTSqPhPOAVYnDatEkfQ2UDb/fXbyj/rU3n35LRvQKB9330WfXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QuV2objZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QuV2objZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so9363315e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760288; x=1792365088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=QuV2objZdNMY0dEzcP0JaP8ZY/vWdWwrtV7R4BuVdH3LhLVks2r9qWYsXJkmoF0qAQ
         /mvU2hL38Tdqu2rPh7ZICkW7C4VWwpSPW0a/RGK29H36ZQiREb0hzXBMcBq8o5kfBpbf
         hvfIpbzhQO3Qbdkc1w2TGzSELOPgK0BrJpKVeFI4irryT9NzM2ei3XEN2KAGAn3hOofr
         h+X1VbAFLYgbc5BybjZtVFCw9l+0WKHuTs3Sutfu/5pDpCzLE/0mzomnUHmqE44S6pq6
         rVYqG4jPeBVzz/06zGTtwDEA83Q8qU9/m3CwILIc2lCHXlKDXdAQRWNpAmB1RuyjbvbO
         Ai/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760288; x=1792365088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=h+4MOlS1YNsYhkcu4RytFH/xkQUzkpg12hV6/XULJVpt0h6xIL0orat8SgghgrskOR
         PxDttNNZ1QvzWLE0koUYdBeL20aCfTiW0vLXk3xRkwe7rTmTr2EiBHpGZMmmSPAph8tA
         k9rSNdCUXts2za3ZO0msrofzpItXC4+LxGSP1NCsDUD3y17laiVXRKymVKl3vqZ6P2Fy
         0/rKqkH1xPLo7u61+AO/Qg7E74BX9lCU6QeRPFsIKayCFVfO0dRKTcVm8jQlUO7ltk9G
         /IjsEhWYWA+/bYEBHTZ42SotHq5VbKSn41cipXvkKQHqMJ/erEOF8wiBApH8OKLbYfiL
         +4DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkxI0Bx0SQ8EqF8Tm/PTo2QvX7AwJIoUk7BzX3umF+q5COZy15X3h5rMPYmbA8yCzKfx85ROazTB9s@vger.kernel.org
X-Gm-Message-State: AFq9FYJSE+1g4GpeWNuRb12ilAJS/Fa3Wafv2Erjk7WNKOYAXJKWRxsh
	zj2iiuYJISqhj4+28rMYuHvyV7c+hDBh4RczrOhwgQ1UVUziwuSMDf0scX/S31/XrUs=
X-Gm-Gg: AYBFou0mkpxQWSoriH5m5ZjnhrIKbcSvQf7TBBZdBssR0BsrtXgJcw2M41NkPUQvoI+
	eIsGCqbyqnOoLcLlXIEkw4YTnvksAVod8diXNjQXkdYxhFwbUvMru54Sd68aX9oMahk2I0fvSNh
	OGSKK1yTOhrggNCSifo4bvIHSNvpN203gtHQQCCSJA3uLSwjMkzmhXMBCoBw3bJld1tni7IWGlE
	LaNLpFuDPiLf2Cc30jg6wUP2l9W/du75La9VZtEGRK6xnODb2IOdgkt7NUCF9lASrUarNi1DBs7
	BV0Hhg+bny9T5xN5W0GdA8XE35bO3F/eRG76Sz2w303JhiHlwzZvOuKfLOLtQZvVYExMUIqcqw5
	K6DM72PscFYO8Wlbz+eXJfEooOP3NEDluXMF7BhWTfY6+TP1XSzVOl5luWmVmeuapHVcBkNkv2G
	K1/zalDUb0C2V87pb82+9125kGD7O8OcndZMSmBa0WrqO4JOp4BB0i65H42y/1DUrMRBGNvGjqE
	Gt/MNb3MBTQlA==
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr139639115e9.10.1791760288052;
        Sun, 11 Oct 2026 16:11:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea0f1csm352115565e9.9.2026.10.11.16.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:11:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:11:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
Message-ID: <aswXWWBwo22nQ4RR@monoceros>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m3vlfuk6zzwkmzl3"
Content-Disposition: inline
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>


--m3vlfuk6zzwkmzl3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 02:50:19PM +0530, Yemike Abhilash Chandra wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users of this header. You can rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--m3vlfuk6zzwkmzl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMF5kACgkQj4D7WH0S
/k5XkggArZvlARZhA+GPe6GOSLEsUCLiZ9etxb/qZsK3L9ZqKC59PFOjjYYllhoU
Cb0aqC3Bn2PpmjIClk9jpm0jPp4vVz/n2rrV4yD3oR47HhZpd2sUiiMe/zdYzRIm
KH62ybWOVhC9iTey6Mdo6IJT/JCrqAFXlfVz7e7Oew/Rb5O2y3+MJgfWIdSceR2Y
Fx8ivfkzuGIRMLgM6a8uMX0alVKR8l7FpGG8fOK3WV1rTupg2D6XNra2hLdzfmzQ
nTzggHLzsSEeYMzHd5JJgOkDCER4OzXP5RXhysvmggxiKieNcxD+fTuJnd5FW+at
cIgmrrozCEzvFk9S0gyyeY8VGLLV0g==
=ctLP
-----END PGP SIGNATURE-----

--m3vlfuk6zzwkmzl3--
