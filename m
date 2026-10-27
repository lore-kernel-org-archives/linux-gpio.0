Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094117;
	b=BLfYrM6oKRtms9gpYNTPciMu0I7Pb3Us6dh6mmTcI39zaLtjtimN8edRpVCOPSbe8tx1
	 v6ykU7frAlU/EaWxfzMFab7YIkCZzOz8KCEAYiFbqT8aEJ0h5GpNavlArf7c2+fsoaf10
	 t2/ZA4iaiCPK3weMIDCd40tU8LlJjP9Q82g009z5QFJwCVO8yWfJprflIFkdKY+uwNgvi
	 SB+ea7ym/pHo2+eDmkmwn5sxOeCyhuyIM+XkU55yPvDeoCkLbC+nfDBbTe3O8jTY3WSI7
	 6Ikt4LAck/N0UQvF4MQBSW+Khy0qBsCHkm1cZO51QBGyGRTQWEvf04u8ocfXAPn8YGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
	b=imDnDMpItjU0fUvQ5kyiyvjSv87jcFiQBFTZSRVS9JmjkXDv1wTMVDZfTDiZ57nFmVYU
	 9jIag6dDVQwQBanBzoIYtck3OqdmBdzZFQe1CSdLGZQ3TXL0fOUMcarEC5FVYAqtzI+Uf
	 vcoS1XtnnWQN692bQvq0qIMS9Plx7aUUhmklWaBP/wMYbKuf4RB3dtWo0zDS9zvu9FcaK
	 qDRdPZ/lkhS4WYnuC0OjK8Kb32ZmYkHnJmQvvTWCZiEBGEqabzrRJuK6S4I8vOejkch89
	 KXKX6xWX+/KE0B4HjsnzkdNQ8Lzqg0PboVo1/RGelP8o5QC8XvKMH3dhJuPNolLT9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lrgqg8Sw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65606606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 09:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65606606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Lrgqg8Sw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18163735e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793094115; x=1793698915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=Lrgqg8Sw8B0MTFHOgBFBsZea8yJ5PGupCUU44KFrLSJFOaY7P+6n7vJiqmkm/ccK36
         mnRTBEXSzJjw7xIZDs+5PWEyIB3Wnj60O8VDRG9CRFrmAAqy0R3jrwSfYzp2RC+iR/da
         CX+EOdAr1Jmfgg5HdNz0YL53TuoXKnFmWUVNvqvRiGwB3nJhgXmXudPcUEBUs2LGCCW0
         LQyNCaOKCXuojR58IHPS9Xzm4UhEno4FBNeMmanacYHfeaoNrvJdsY835na+t3EpbJf7
         NUxkcOBM73+LfGKKxWz0wEGr7pjwv7WTp6KLUY4Dk+hm7tkmDbCofa1WaCwsvjoa4tVW
         RVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094115; x=1793698915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=tXAyqMAkGF2g8/VqWrV7oL6+tONc1jvcvrB8fBUT0lOcGxmFHyLSweQWnbHac7zyTh
         I4ypjHeFcX0fgmK5XqFguMec+qYj5TWAYHtskZ40L44qJEwQ1e/UhTvJ8MvONa2U1Uss
         jt+6RpsaXMURH01KNO4afaayEFBtVIlcuDqcQOVAj0jSPMij3w4ryAh8y/SPmsijiKdj
         5NBp5lvbqAR+LJ/2RIDRxOjPvSvBS454X0L0B8b7uKswnpEaS1DCCW6Qtus8TCsQKD8y
         7XYj1QsWT9QH43F8IyGdL1kkf+OHXU65/UUEk+J576Nxaku8NwZEV7KZCB29vb0C6p1v
         BLDQ==
X-Forwarded-Encrypted: i=1; AKwUvByhEMHHwu7hBCyVq0hEWqlZR0mqywwvpb/FskEVI8JJyNsxP12CR1Le0ikTT60RvkSwoLNgm5bxx4Nl@vger.kernel.org
X-Gm-Message-State: AFq9FYLmZEeqjkaiWx3thaSem9EH3kOqAVYN2oZt/x4ZEy5RVv79hKMb
	Y6/42rZgN15RDztZ/lnDwPTEvz0KZ+et5HVe2eS5xmBpZkwhWgfr0KbfBtWNKzX+5gg=
X-Gm-Gg: AYBFou3PaE3my3IawzfWo7eTBFyvjEb3HDZaPb9A9Ps9udazKO5RubtL+75ZKParxzW
	R8Tftp7JIEkMUofM+i8wa6hqmo+xpOR4wmEbVaduRAiZdwCHoaVWtMl9xknFNWPgYEfF8Eyu/PO
	TVAUO8iOH5K3Q1AaEGYmg0J5Zt0vheUvDsb2QmpQ6IGk23c5qF5RtJGwJHzJmuAPRf6wHJnOp2P
	aFR7J5Z8TE3ih306NFJ0A9Cu/4r6P8ccgzGN3ZLK4Wm8bMbkjRzgQ53jFEM7mIGyvCc7uJYrLVP
	6FRl5Lj0upqzyhDir/V4A9VWYb1HGIOXDG4dQTgJwXHtfQXH8WX8Q5C46t33AG3Zzqx6RfY/Qlw
	i2DaiGAXTpozNBKPP8Ptop6Fjiyy3Mgl3itve7CTZmYuICp3fM/FAcX6Dt1Cxmh5tkKHSQ9JrGq
	OGrlOVvh2Z4QaKNBh94RqIqCCY4mTulAbTcpStgSmmY8KanvYSjUJocryqLPgS9uhhG/WEAJNsc
	rrt5MY2p7wUrHEx7NF2t0LCp0dmXyR3m3L2z/wmXicURcp7eoKqZDTdg0legrzyyDMsUE5bGd+f
	xFZkxhvB3jvMaurRpjJF3qeillkSbOIs3XbCHFf5d1w=
X-Received: by 2002:a05:600c:8a08:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a47a8dc93bmr110335135e9.9.1793094114509;
        Tue, 27 Oct 2026 02:41:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm263939065e9.15.2026.10.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:41:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
Message-ID: <auBxfVzkveb7KlEk@monoceros>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <at-CGVq5jVsMQief@SMW015318>
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
	protocol="application/pgp-signature"; boundary="qlk6jmpzfns64bdk"
Content-Disposition: inline
In-Reply-To: <at-CGVq5jVsMQief@SMW015318>


--qlk6jmpzfns64bdk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
MIME-Version: 1.0

Hello,

On Mon, Oct 26, 2026 at 11:38:49AM -0500, Frank Li wrote:
> On Mon, Oct 26, 2026 at 05:28:11PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > [...]
> >  drivers/gpio/gpio-imx-scu.c         |  1 +
> > [...]
> >  drivers/gpio/gpio-mxc.c             |  2 +-
> >  drivers/gpio/gpio-mxs.c             |  4 ++--
>=20
> For all imx part:
>=20
> Acked-by: Frank Li <Frank.Li@nxp.com>

I'll apply this to all patches touching the three files left in my
quote.

Best regards
Uwe

--qlk6jmpzfns64bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgcd0ACgkQj4D7WH0S
/k4RSwf+IK0Zg4d+0uYc5szRXc18DV2GOQKuWytvc6Mb7rb8wBUlhLcCzHXfHJw5
GKyFFUIrW1GHu/p4aSlsaOLm8RjGYbgR1RTnxQySdf79td9IxG/EXqQcp6FcxSH5
30Ema9IFNIy1Z1fLQlqcQWR4FaujBuohFx12psbgjzkhMn3OY0x3w6FsZddRxBu6
hjb1B8M89jP2R7VcM2CC+KYKqlxNoQYiS/XOiE7oyKj9CqBRDIrGPNwKtLxUelaD
kKhTCJUSL4uTa26RZDC42xIr79ip8u0RW/+hzEwjtlicpsH0uFemsO1TO74xS/ol
PbKbBRoQJlRhoDMBJ7sTb6K4gJHPEA==
=KSfn
-----END PGP SIGNATURE-----

--qlk6jmpzfns64bdk--
