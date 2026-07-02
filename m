Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40A935F164
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981252; cv=none; b=UNN1i5k53pdCu4UPI33u/PmXhaNOmfZP5JBzocs2GZ2vneCdZB6F5xYKoJjvtowsiVizUa9X7v/JqLde7NBEH7NAou4G5vAfDIK7E6sGxdWSWcb10S3TPwrL+Lm6Ju5Fhe6Xfv0Vvtnkz4tskAuzdBcOGGhvWsSSLoyO46RCEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981252; c=relaxed/simple;
	bh=WDfEEzSWJgWFfXeNIdpxPGAQ9BpwsK2ZXWq6vw2pT4g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nlzkCfjxDsezKaszZMWIct3OTHsPj4xRbpVgAfWGH3i7RIY3L3GRVf1rvCC+hB77Zk6jdHeWZY99v+0dxolnFeApbTHLK55XeF7gnfauOmVMtOUEauvSuTqOKiAeRHhbtAoQiFrkTf0EO/d3cVM0agl2h2IjgdlF4jlrSEruyVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OxUMApa5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OxUMApa5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77793C4FED4;
	Thu,  2 Jul 2026 08:34:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ACF35FF03;
	Thu,  2 Jul 2026 08:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7B0104C960E;
	Thu,  2 Jul 2026 10:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782981246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WDfEEzSWJgWFfXeNIdpxPGAQ9BpwsK2ZXWq6vw2pT4g=;
	b=OxUMApa58Q5UX9hYLVcjPJ6e2e+iHrh8huayYvoEZQKLdPjprWeh/PEbPcaOAt//xCfpYt
	b6eZTaZBWGVoB0hdCFWubkvwhIyj+Vib+w/dsrIENF5bRQe5ARQ7MjDhF8w3A6Or+a/jTH
	0+dii1umHVwRhMcgzoMgoif7GWCZJLh2CXmT4MQki//kMWdI3rFQBSWL3UoTurVIfvrarx
	9UOsFthX+ipW32PyPVzc2W5Grzx7jQ9BDqnCOAX2li3fIBGLTu0c21tu5xlwZalmP7F6wC
	0ykF0l0Z/vIUi17rmyKC2+NkSR1KZR77jK59xxYBdwFpT9V8YrQKKsLYLET+8g==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 10:34:02 +0200
Message-Id: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe
 success
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
In-Reply-To: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Linus,

On Thu Jul 2, 2026 at 10:00 AM CEST, Linus Walleij wrote:
> On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:
>
>> Successful driver probing should be silent. Drop unconditional
>> dev_info() call that is done at nmk_gpio_probe() exit.
>>
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> I actually don't generally agree, but you are using this driver more than
> me now so let's go with your minimalist dmesg style for this driver.

I get from where you stand, but the info level is somewhat strong.
Documentation/process/coding-style.rst agrees ("When drivers are
working properly they are quiet").

If you like this log line we can turn it into a lower debug level?

> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for the reviews Linus!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

