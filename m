Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB13C2BB0;
	Wed, 29 Jul 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320550; cv=none; b=UaQkEBf5jktE1SEjfgLne+ARpojYhzFXA2W79dHgH6NqYIk56/Zb4ik+OWGuM032nCrqvUFAcGOEA+5ncUL+WPfSwgT18CHrcNy8pmQt2YCTFm8a7sp3N55jux6GKBuvWjdZR6ftRHrqVQrFGh34Oqin2myN++7X50qjTfila9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320550; c=relaxed/simple;
	bh=X0Ou3cti2nZ+lei7jUHnYP6r65E3olkMwoazGqJ6vwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHq2MQZkv6GVkes2eBWGmBhbuOOB3cqFf8FDcHO3mavDqMYmWCTBQUc539kpkUuTuZZg7VKcJGVOaT9BpUk5RwnapN/NfSxPUOsadAJmfiSZGsDj5VP8t0IM5hgwnIwkh5pL12dc0D/Icg0J9p+PffjCLuOJWi5WUWJE6JgIMMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WzlDx4Sj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WzlDx4Sj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=X0Ou3cti2nZ+lei7jUHnYP6r65E3olkMwoazGqJ6vwo=; b=WzlDx4SjVZV00n9O2n9t83GIN7
	4Py9ad600bdDcgR1nKuMH8N9BS3EqooCtm0SHmDk3U1dxoWmIKkhnm9aBI+UvwjDY/kGaZYCku//M
	TwHfxg/YTGBkNNoKWZNnhGpd/4GTPySagtPwCLD4OFBZFV/qc7b9UtlFlTrI1vPMTV5ZkRbW5XzHR
	af6duw8MrX1Ohw1xgLMDQz1CPKTIz/kbJX4vAAbvJpD6JX6raOEJqcVLyqY+/IqjkRaSHtCfpKulj
	4e4h/ljmMkkkC9ILsikLCIEAXAA56JtMOidBPo/RXvAV1jRiNX6IXtLj/8f1UP/BvU+kCAmedZ/qu
	TBwqLPDQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: hugo@ahdrone.com, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
Date: Wed, 29 Jul 2026 12:22:19 +0200
Message-ID: <5689456.tWeucmBOSa@diego>
In-Reply-To:
 <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
References:
 <20260717075918.1869879-1-hugo@ahdrone.com>
 <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 25. Juli 2026, 00:13:39 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Linus Walleij:
> On Fri, Jul 17, 2026 at 9:59=E2=80=AFAM Hugo VALTIER <hugo@ahdrone.com> w=
rote:
>=20
> > The RK3308B is a silicon revision of the RK3308 with a different iomux
> > register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
> > GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
> > the original 2-bit fields. I believe the bootloader enables the new
> > registers via the sel_src_ctrl bits, after which the kernel's writes
> > to the old iomux registers are silently ignored. Whatever the exact
> > mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
> > SPI1, I2C3 and other peripherals on the affected pins are
> > non-functional without this series.
> >
> > This is a continuation of Dmitry Yashin's series from 2024 [1], which
> > was never resubmitted after review and got dropped. Following the
>=20
> No reactions for a week so patches applied.

=46or the record, looks good.

Too late for the git history, but nevertheless
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Heiko


