Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621910;
	b=MvozOl9Bsx/Oceg1A6ejz5zbFuwW/Q+bmW1WsqF6C9U9nufq4IOse8KYSQaKawg+APGE
	 MujGuRKFDoWUyEeSjcFkei2p+n//VqVDZZrnAaZ3CXNSJW7VgRiINy3vYxPHgrs+6DKmV
	 nCXQeEClCpHIhBsArxZKyaqGMpYk/oJTlP80y+MoHQT7osF2eJte37mu/tn/5r1UJe0rv
	 v/WGDW321f2IcyRU9RxjuhwPATowFAAYCqRUCb+LrOAgGMlNOCfKxt8kzFXcfqbxEVsOD
	 +bd2B0pme2/+16Pic7h67myK0ze9PfkcsPy7gjK0MaO7yoMpVU744pweqPvvzJTH7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621910;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IGhLo1z4ZBqT3+OJqBHPLwoPaDjJ6QOHTiALHLT6qmk=;
	b=o7SQnq2ldjgTQWOhdFRKR2Eda/1F1akGrEdF/SQ/pGGspgHSYUND05rIA0ia3OLmYBcu
	 00xdTuMq961mQ6YfJ0iNjRbk4fDJi5kqKiNkApi2NdqoCrRt3/eDirTrRPbczoZlfSPAy
	 C+3AT8sxG7JDyEYfKEjsKJwJA8ifxicVUjkcPaYr5EuyzONiu9A4VRsJ9pNqWdBBUKxom
	 LY0I110DxF2CakGyLjn+LFv6/R9FhLJ2B9HIHS7iViQV4Vbob6dzYCPj5rG2A0xqU7Ias
	 /L3qtbPks987H7D/3ZWfB0IQL0n6NmP84AEX2zSxNTRQT0j7Z1CO02lmroTyRFyMnLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jtOMx1nb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 013A9606A326;
	Wed, 25 Nov 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jtOMx1nb
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CDE281F000D4;
	Wed, 25 Nov 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621909;
	bh=IGhLo1z4ZBqT3+OJqBHPLwoPaDjJ6QOHTiALHLT6qmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtOMx1nbkA5TAhMyZ8AK4ua9SaISxLjviZWaYtjkpO4hu03BfmO7MI/HA+en1bQ1s
	 KqelSFiKbNXmH3AipcoNnRY2+Pxr5gqmJFrBgXOvldUr7YprAxuzwZ9uWhZTma++Zz
	 ePSsGTPlST9aDlDVcJ038exGSGzmheVWl+B4ej3A7HIQ78ZVjPuRnIRYQ/LVbSre+c
	 drIpyvgK/BhuoyR+wspugwz1G+OPHLlWeifzcvHeK8AsHQIPsiZfkaIt4Artiutc/h
	 +RsOL3JZoQSQGrJXqcqWTqTRxlRP306nlrI2fB2pO0YmgXv012I2OR8aaQyhXBXstC
	 XsUAn3X9OmQuQ==
Date: Wed, 25 Nov 2026 16:51:45 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
Message-ID: <l664regaj23mxmsghrut2dissfiuih3lzusb3p4d54f5ignxas@l5s3wv3y6lny>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>

On Mon, Nov 23, 2026 at 04:21:28PM +0100, Clément Le Goffic wrote:
> MILLI has the right value but not the meaning of microamperes per
> milliampere, and <linux/units.h> has no current conversion constant.
> Use MICRO / MILLI instead.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
