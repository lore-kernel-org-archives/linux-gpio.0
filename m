Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A7F355048;
	Sun,  9 Aug 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786269133; cv=none; b=NfVWbXEeUoDGOJVXoAGJwjOPQ0SSAkYhBWX1+6p5BkY+MuSE/BtDf/psYcyU3epjPFraV/SKf6TNnH6UUH1SAC0s5CGkqRtA016l4l1olKYb927ck/WiYfvy0wxSWU7EXaTZR5kIDQWG1xVyW+9cWdqb4O2DJrL4lQawCG7A55U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786269133; c=relaxed/simple;
	bh=cLkXAt7OGH8Oo/NH9UiNt6x/1vsL4WiOEANljYk0/Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDYqxWLlW3Y3gmHUrZnKCk9ROkUwKGPEL1bkVJH7IZinmvdS7GFrRyZVEkfrOE/decRdv0XtrgveMdYxoJd2WAq9ijVpcqyk28eXtz8k6qFQIyeXsKaM9L5vZ+4flpEeI85QyNejOXAFnH3dVBrqssEdhi0x3njnkeYp6jsAUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EeMU3u0Q; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EeMU3u0Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cLkXAt7OGH8Oo/NH9UiNt6x/1vsL4WiOEANljYk0/Ww=; b=EeMU3u0QzmIlGOIG+RqLB4XfG3
	CyfD4gxnEYqrFB8u5Onuh09iiMaDy5zTeoaTVRANFgLSgRmN/9B8V0gdrrjxtVU9jByUn3y0j942v
	hXuwiS3e19GRpBgjFCjfzAt4Tz4z0vkBRRrkL4ahZ6/f6n5aKKEPzxXpnIPAXxyoQMO9XZ0NzWfL0
	90WYdvSnvYAQoUgylNS0vEiHrG3B4446MmvMd690Su08KBxltdedBPqrcE6HAuiX14BS2GE2rCyGY
	k8MiDLLUmJudtsZ8q0aDUXS7FUy5H11GjZ6XqZfL0jkib58r6Hg5dq6Ze71mSALwS9sVRsIr1dc18
	4/ysp5AQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Sun, 09 Aug 2026 11:51:56 +0200
Message-ID: <12961763.rMLUfLXkoz@diego>
In-Reply-To:
 <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
References:
 <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 29. Juli 2026, 15:27:28 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add pinctrl support for the Rockchip RV1106, based on the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
> register block, referenced by the rockchip,grf phandle of the bank
> node; the register offsets are relative to the bank's own block. The
> drive strength uses the RK3568-style exponential encoding and only
> pins 0-6 of GPIO0 have drive-strength registers.
>=20
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>=20
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

apart from the new per-bank pinconfig wonkynes Rockchip introduced,
this is mostly a standard pinctrl-variant addition.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


