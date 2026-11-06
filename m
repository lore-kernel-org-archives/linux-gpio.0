Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942705;
	b=w7LDPkaF17PN8ThXhLyr6/9VoAhZpCP1RdjvY9pvIRNyOIpi3n0p2YaEVfHy1OjV5bRi
	 wtH3et3/yUjZJ32Rndbmuaw3VuSSm9oGoC6g0RrA/KqeN21TlxiAerTqJbFC1dLsdY1TD
	 8fofSnMkkwuFMwsHDEKRznK2EMNfuOyt/joeD6PuxVcIwy8QDS2x9fg0A6MaXxbJDjhVp
	 QkZ5vjfObgdzzN+akNBAcz2D2DDWhJ7P2WQYX8Lf5D+baGGGeyvdJACij8TRx7Vq+T6UG
	 ROjJfoRMjna11bCQvYkI65uWsI2RSmyi5pd56Pww7KaFJ6DskseVrw58j+Z89gHPqAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942705;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=rc1B5L9x4KU9XV5a9KjL0IyzS9SFrFYxX5fwdEU8zEU=;
	b=10Vh5kbTfKpgZxu4F+V77hfDGllO4C2N4XbuBUEXBaq5NCC8CoYdoRcyrTb6zeoFLsAK
	 bW/ijci7lmIrgXwdmI0aGHGKPQ4+4dHyXrWrEUH6bNQ71TcZZqoz5sCTAnhRfPOOQzqph
	 DfPiDYem7gZ3SkAat8P/a9u7D5RkUYIIRS4h0xgonw6offJNXU/UYSpH0TIbCD7uaP/Y3
	 AlhE8MGp7qrfyov2XXx6OEJp2mueq7q+E+ZhfscV0f43O40pv2h8qOktJt4NMioUwdWDy
	 I7JFAGbiPWRLSLF39L8nUVq7siuluEFe5nvsez5cKI3mrmi1OhIb1fMSKcWadV+nDMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b="KbVDF/ZZ";
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AAF606A31B;
	Fri,  6 Nov 2026 05:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KbVDF/ZZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793942702;
	bh=rc1B5L9x4KU9XV5a9KjL0IyzS9SFrFYxX5fwdEU8zEU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KbVDF/ZZlKW+8X1Vp2xhdZH2JdZ3LdHuFkg7F0ExZz3B9V4shzzGT9MBmcdhE15A0
	 rwHSBsy2yR3p+qiDcq2LPyXE2wvePRvsmBh6ty6wjvi5jNHIiQ4umHU8eOjB/k7TWe
	 6JZhmgwkXkl+4HNSvAuqhn/fK3Q6cqxx6ti/kb1TsfBBj4SnWQr5h8jjPv+axoLuKr
	 UtSvFIikSTMKKGzLeOQFjUkG8UBZhABXcMrtcWTsYTijokWRofu2bP5aeKZR79XU2p
	 TgfhhjDipdr5JOrq2deYgHexwEDM8p9PyYj4dVOzUvx380bjRberr47UdzK6+kOeU3
	 /RfaOavucwNag==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0978A64952;
	Fri,  6 Nov 2026 13:25:02 +0800 (AWST)
Message-ID: <69a28877e3ed57f9f248d31d1972b62446a4d230.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller
 lifetime
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	brgl@kernel.org, tan.siewert@9elements.com, linux-aspeed@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 15:55:01 +1030
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> This series continues the AST2600 global-to-local GPIOP passthrough
> handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
> fix before the G6 handover change.
>=20
> The registration lifetime issue was identified by automated review:
> the G6 callback data is devm-allocated, while the shared helper used
> unmanaged pinctrl registration. Patch 1 switches registration to
> devm_pinctrl_register(), ensuring unregister runs before earlier
> devres allocations are freed. Patch 2 retains the v3 handover logic.
>=20
> Changes since v3:
> - Add managed registration as a separate prerequisite patch.
> - Keep the handover implementation unchanged.
> - Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
> - Update validation statements to distinguish lifecycle and power tests.

Can you please re-send v4 so it's not threaded under v3?

Also, I received the v4 cover letter twice. Something seems wrong with
your mail setup.

Andrew
