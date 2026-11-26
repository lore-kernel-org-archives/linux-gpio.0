Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707145;
	b=AknMzLaB2NA6wkRl6y4orfg4J5ZB9/juL2nOB8x5z0YIbPzvN7iZijAsWdLZBeR0EPDL
	 fLvXfuQk9+GKgb4ihsh333sT8nKlRdJWd7sG0pFihjMDc2RupyrIxnkpfsKrMCLVLg8yR
	 UUYb8r+deEADoY0mk9Z79cH0v6oD+E4EslbsSeLbRoetvrfauE6KVd4OCjHRWrpGd/i67
	 aKhYN6VFsRR4iEGCU/w1KS8rZ/zsZF6dFUS9IdVHbsKQwLUs1iYqB/9c/esnSU7vbcljv
	 Xhl7h5pGer4IJl/8cAeXf9tyE9NNrnIPr0EQmHz3G+JzcmK8sg/hPuT8DSbRE7wgNlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707145;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XYSDHZYOz2HcGfIl+aUARLgMG4MFI97vgguT4JgL9tM=;
	b=zutGr69RQiYxY/6Lei/QyM7UWomBJmT8ZJL19d7eHGG1sLuUMBBHGGoC+da6mYXKZN3G
	 V7IW84bEHP/Uf70L7qIg95RTFNqFmy1svHIbwoRk0nxUyiB8vl3dZts5808QvFn3+i140
	 L59CLZoCCvVDuNfF+1ribvYVOYjKnCxy3BpmTswZYAkMhh5Yt811xlyCkE3NtRPkQEWH5
	 6ipgLm+1BTll0Wl6Tnfrj2qaqgQ1Gc4VonxOg1N4h7hdIo+8rpuAtQLFY8edjviMRKuWF
	 CreYKK4HsVzT1+mJ444IZvOv9fqR9nqhcRE1yJlCuQejOj+ix4HPVbkA3MJhujyflag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Jb4yJYx3;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724B606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A724B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Jb4yJYx3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795707141; x=1795966341;
	bh=XYSDHZYOz2HcGfIl+aUARLgMG4MFI97vgguT4JgL9tM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Jb4yJYx39VMrBlih8bC71VbKLC01jlwmddrAjmQtCjvgbFgUkTyxEMteQIgBOMtEC
	 EVbThkMokOZs7YmDldetiV0+eluG8jHJ4STSY3eUQ00FiZ7+EX+tFXPOY1W9DApaHL
	 sPnribWdfS4aiqmrfilU9yf+8WbmRfskr5C91McrAJ6J7zOxSrPoR205BMC1UDk/1m
	 anBl+uTjZa19HH+AgglE9/NhCwLvnWLJaan2alA48EDSRc+qohBK/DHQCPwW/Xr8wF
	 zxyJ9GsfLn40GYqrVM3MElzBeHE/6uaY9OE1nJn2AyfOmT42CJftY7eXKwKdWSbqob
	 z77+trV6yXzcQ==
Date: Thu, 26 Nov 2026 15:32:16 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: linusw@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Andre Przywara <andre.przywara@arm.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Message-ID: <hLr27fLEbAhwAQMkO50HHXP_6CB0avqrmqECAA0v51G-wllHh5gH-430fmoZQ9-H_QG0yeuyKXGHK2rnzXiZPDFELQU-nWdwwpxJqYWT3tY=@proton.me>
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: f179a31c19f8418be2ca57072deb600c19315a8d
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Enzo,

Tested on a Radxa Cubie A7S (1.8 V banks: PC, PE, PK) with v7.3.6 plus
our A733 patches, with this patch and Pablo's IRQ-bank series
backported and our own voltage-mode patches removed.

The firmware leaves GPIO_POW_MOD_SEL at 0x01155550 and
SGPIO_POW_MOD_SEL at 0x000AAAAA. After the probe they read 0x05555555
and 0x00055555. GPIO_POW_VAL shows 1.8 V on PC, PE and PK and 3.3 V on
the other banks, matching the schematic. The SD card works at 3.3 V
High Speed, and GPIO interrupts on PK0, PB0 and PJ24 follow pull edges.
Without both patches GPIO_POW_MOD_SEL reads 0x01155514.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested: 1.8 V switching of the SD card, the A523, pad voltages.
Built and measured by AI agents (Claude) on my board.

Thanks,
Norman
