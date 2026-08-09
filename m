Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36A3B3C0F;
	Sun,  9 Aug 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268608; cv=none; b=aTkUwLVWKZNMgLnM1JS1l8Xd+QtIP6j7GBWTULwsFKfW8JhKHN0VeNLDqXBppV1UPwLk6JfwqkKJSIH4jiJnxPNwhxcw0KaLeOBCXa0c3fLer1PgELcAHlodjmakbbGohto58kQ04G74TWLx0OqY5IjEWnQQsur1dceytm+EEic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268608; c=relaxed/simple;
	bh=aQnvBKTkEiMX3rxlz+/DiIhL/4xHaH5LdGAIChHO01M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thLGbwpPBqVgmgPi2GUp2oa57Xay2lrr0085HO3ygb0gllvEImq7cogBytVKuyy/7KekOCDj1nJFal69Ytd1UT/K4Yjts9p0QJbb6rydQnnS5dYnAaLhBs/d3tiIqvNP5TQe0dPQI7vfFQy3IUKqpx7/tw/HqUS0FzbljgEEIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1W7GFney; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1W7GFney"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aQnvBKTkEiMX3rxlz+/DiIhL/4xHaH5LdGAIChHO01M=; b=1W7GFneyTR+K9iQbkgC9h9Ck0g
	fOZI14liwQ4hgLTWRSey8gFHN9sdlZswm3Ao9Hbvv5PD6n4WlIjbHs4u5VDyDytZ3SHgGnlW0IulS
	vqF1ZB2zJihz/WVGuTU4jtLhcag0Gi0wwBWMNI692R4v1j86hnk1bIk9oRThCT00FGjRW5AUYiMmp
	TJy7IS4UzJCHOesKOn1jo0dHN6pwg1rkLgyRI0ovrP6YX/W+P5gkC0TsqgE2zfWkC9Ugplo7bdzMG
	CHNHs79twMyMsB9V9tfHylPztJ/QK2ms+0uF3TEYYXa9WDt26whX0QHtWpHrKKasAMoe8YTKOvTd2
	G/nY2MIw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Sun, 09 Aug 2026 11:43:17 +0200
Message-ID: <19061465.tv2OnDr8pf@diego>
In-Reply-To:
 <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
References:
 <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 29. Juli 2026, 15:27:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


