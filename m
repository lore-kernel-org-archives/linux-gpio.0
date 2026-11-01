Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565252;
	b=T7OT7Cweo8XZdylxFvUCQWIXlb/PIVPO2fECTqI3jEMMCMvRvbSvJdetD239i+2j6Bko
	 n8fcXZ1BFA91JuBFFOK0JWxggxAo+U9wRAap6bZGfFUhDMgPyC+OzWzir3ZWgWLxrBRo/
	 j4ui7r+GldUqzx9Pd1AfksxjnHVKihRX0xJz9nBh5iICuXiM2p3iviaU+DWXcEOkTYvL+
	 bBkkAQ3hUgxqv9tXk6W9KlXZ2ECttpycWakRrIdKr9LHoLT1U+ca6TaBs48EvY/amNd+p
	 cSBPsjIRPRcW9onvMZzeq6dgehTGjTkp15OHg6UiWUmKAGiEOZgMC2MX60hx8og9fHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565252;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WEcinyzXvpzdrQbdmzGRVBkMmzuM3NlP9qlzk0r7u+M=;
	b=K9n8Q1nrCH3S1L6O9BhRQP0mOlWAvFJfP7iy13JNQszzUCpFQwi7IEGgh6yePmAX0Wt5
	 7R+7Ei0tSQpFC701zhXVS5g3gzDNuoz0lOQQWdqF84b4yxhXKJCy0/h6xjai1Ue+YTVlM
	 nsbNhm5vXnr6F0Gcfru006sDibhKGzw0r4WSyENXpFgWiPbGJX/HDfbBD76J438TlHcmv
	 52ZBbXcRV9LpTm2RaJrYgaeOkToVWUSl0N0pKEybS6ELos0aQMwPIN75M5DDmhdjkvvdE
	 4OjER30zqcbeoQkzjnW+ooz03UfNbM9kllWRO7ueahbJQHtCsWKkToBGXnj6HIK/4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BtuJ+9TG;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04466606A32E
	for <linux-gpio@vger.kernel.org>; Sun,  1 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04466606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BtuJ+9TG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WEci
	nyzXvpzdrQbdmzGRVBkMmzuM3NlP9qlzk0r7u+M=; b=BtuJ+9TGthEvfHggV1K7
	8HCM7lmDmDVKnstgAkSutQeepbxM9f+LBjaFk5F7H0FOumehplkJKLqoJ4+ceSBh
	YK2ss/QChr71ijKyvjcVkjJLIy4l+mwVhX+S0+XWv8HGGxsgbS3TL9RxhUbSVG/E
	axv8+Pk12kFE5H2dIY84wmQcx62TwwtQW8iTi8kMfH2anW9M1GuJzYn0um/iNzoS
	MqQKrx44llXCiyQQ7aiR0H9+sB8qB7UaGm2wtCRRck41rxjhBhdU4H/PyL28+gfh
	1iQa6igkkswZenPR28OwGiM6B5IRigeuzt7kfw2me4EMvNskJM0zliJLQI9IogCF
	wA==
Received: (qmail 853660 invoked from network); 1 Nov 2026 21:34:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2026 21:34:07 +0100
X-UD-Smtp-Session: l3s3148p1@YnRo8zxfVKTB0HFD
Date: Sun, 1 Nov 2026 22:34:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r9a08g046: Add I3C support
Message-ID: <aueiPnMvmHQhFtM4@shikoro>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>

On Mon, Oct 26, 2026 at 11:35:50AM +0000, Diogo Ivo wrote:
> Add the I3C Bus Interface node to the RZ/G3L (R9A08G046) SoC DTSI and
> enable it on the RZ/G3L SMARC EVK, together with the required pin
> control.
> 
> The driver only consumes resources that are common to the RZ/G3L and
> the RZ/G3S (R9A08G045), so the node uses the SoC-specific
> renesas,r9a08g046-i3c compatible with a fallback to the
> renesas,r9a08g045-i3c compatible of the RZ/G3S, following the bindings.
> 
> The I3C pins are shared with RIIC3, so the controller is only enabled
> when the SW_I3C_EN switch is on.
> 
> The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
> the SYS.3 (I3C_IOVS) switch, so configure the pin controller for the
> selected voltage through the power-source property.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Didn't double check the pinmux values, but rest looks good to me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

