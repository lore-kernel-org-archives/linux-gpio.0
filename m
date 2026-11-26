Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710306;
	b=qqOggsGZEMRWHedlqWnFPScC3Wxf94R4OFlqYlRj2RKFyfoxzIpUVyT7/ipJ4OWr8K42
	 XIz1cLZdC7DFbQB9mQB1kKs0aBU3QwkGGL1sZ/DaOORav5H32u3AAyAO4M7CQmTKgCYGm
	 g0Itwx/p4FQjjTkEaLMpTIvBpmUnMZ1Mq0Vu2fTUVo40Ch9BGXezoA2nWBsV8BBNF9XQN
	 wq13lgPwfPl3sa9GgtfjPScXnlmMbCce8AThW5HK2ggUkmUVZryGSxm6qUeaJb4DFV+VO
	 GjLzxGxvabkhhJaHkLQL5Nqq9WuHQlNzjgMuMyCuLDpcv7RFQ6t919Q5lJxLe3EQdhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710306;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=DXKJcxGChXQiUrdpxHtH8E3kYOstiLhQvbObQ9yIL8U=;
	b=Fyc5B07l6OilDgr2z6MjCUzOHkOL0Gk/tjwdXn1+rZ0q9Gh73RBHYT2c+BmhPMH2PEkk
	 9TednJIoVe+v623QDlbDb13EumsLeS81TcyC4dZgDmVzcNRWPsfcPjSW8Tq3XX4nj5oEm
	 TH3cPoMqxDcKlvJULi9y4xY2XnMhdSrL0S69FqMeK8EaSL9jtfWYGfu+TXM+B6wGEMtNP
	 ctKp6GxWGYo7cfKiLM3yoEVxBiamd0Wm2QpgCv/ZzWOO0/R6btezV4QWck9F48nZlYrw+
	 zWGYqGPF/EfeOvOEidqNxaGYCmE5gaW+JuC36VA/0fy/LWEWOtKJHyV59Xd1+u1/4sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=Hfcsa6Nx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YGnZOuga;
	arc=none smtp.remote-ip=103.168.172.136
Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B118606A333
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 16:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B118606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=Hfcsa6Nx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YGnZOuga
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 728241380656
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 11:25:04 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 11:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795710299;
	 x=1795713899; bh=DXKJcxGChXQiUrdpxHtH8E3kYOstiLhQvbObQ9yIL8U=; b=
	Hfcsa6NxZgPO2oooy1zABDj+ZKWv9vbkk6CosmJQG1Wr5gc24eRHexTYqhg/Bmk0
	WUztAJPAYly2S67xQbfzKQUu7O08LCNIS5FoyChYQYJBISttLTj+18T3D4mWokVQ
	C69iLJ0aJDadwn6qEaqxBqdWhpZkyI9zyKIWu3Q+pj4TtkP1pTjePZL0L2JMjuCg
	JB0/o7THcUtbrUE0fgZNe2Prpvi639Is76+9Uu5XzvJ1HyFg4FAHWmR5qTAjkjhL
	5Hc72j+SqpSCrQNzKhbnpDgXmXPUeIC4w4Aj8bobaXyqxpXGUVyJluv7mT5vV0gE
	PVBj7kS0uIQHtb5w6tODqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795710299; x=
	1795713899; bh=DXKJcxGChXQiUrdpxHtH8E3kYOstiLhQvbObQ9yIL8U=; b=Y
	GnZOugaev9KPjjtYyJX9FzgNQhhFAZnycXL3qmzU6mn+9K+J1D8YlJOpgHLul60R
	0+npOoxr0klltVV4Vp9AP9A5ySV39rXHY5rItfa3+RfT33DqfrqrWjz/ph+P4rW3
	H9TWu9bv5J1RIcHnSwxxSpLoTSlcb/kBdzoET6PbCCm6fbZSu6umKQPvg53eQpjv
	oOSsbXeVmWWy5CU/Y20ESqAxOW93LmzsGO+D1m/MVZbEut3joZXn0N+cCeSoLDcY
	/g4YV1AjD5H5x9KMvMKyAbftHFfZrBxl9s+RIM7Yob2qE6fVxVtn6L2muqlpJL5g
	srJwb0BrC4K47fgE6r4+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795710299; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:JzHwoE23w1otRztdJ+tyJtx4WTSIky3UWXMmbQIQ3sa5UIT
	KncKfNb02oZzOfDRt0sCS9ppVjChe8jZK2KqlK8FxIGcfTx254TrsTtGA/mYljgE
	pU14ozS3HY9ee6i/7InxYk7+cRGV6YYfGd+zgk4kdMG5bmzHZlyegWYdfl6yP9F5
	6tI+sSKlCjufUgBaU81A4p+JV0yl0Uz2dDWiMPX/2Kpogj9wsehq5SIXgLJBlPAS
	Jla70TIu1Hhb8UYZFWN2+aKWbO4zSDQ5Du4bH4ZkFW0AA5ExZiGGASVCK0p/sbjq
	Wl4KhyJjEeqU6siyszhif9h6SOppcRWgjOeJRdA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qQmxHQMPHnQCDKMum53alWNecHWe+s/lRISCTxwfOlU=:GavFexzO7MLi+LG2UwFc5A1XfxPf5DjnFR3tbQ8qYJo=;
X-ME-Sender: <xms:VF0IaymM8aZkVfJnVqDkT0sbMQQv91e4f3WuzhhIo_jaeDQqqfkdfw>
    <xme:VF0Ia0pXILhvAExHt2GutKUHLbFWQNy3Xwy1-D7Y9-2IntLnR_Qu38uzG7n1w8z4H
    Q5mwoh3wN_ZNPF3dMxA2hLeuI5hsxVcgbk0TkQlfwsnD1rMsELilLg>
X-ME-Proxy-Cause: dmFkZTEzIYBhsi6k5llXTMz4GXc+EbdpoaswLc95h6NFOzvpV8/KUTbBEazoXgShRjdNab
    jToHlegpkP9DfKohUEAKpEHqRJBeuEOlftX2vwaJqYGj+8rwl5lmj0+0AiKl6dNraXUjr2
    jskLUbgPnBk6tX1LPv9xkNHsXny/sYTE/4WgcDxF2zYEDbtC+jHtrj6hcQIJd9sdb5eVxC
    E8o+DtF/RWJZ6pzRQs9f5X0iEGn0lT+FV5gNui++5GYjdsv4Hv+KFfQS24cVxTVEOYNhq/
    2ItEBylLx7vSEvxvc3PdrH7eciXnZ1C93T4f8vpbSXObWlLHmA8zHeFT5NDmwletNWUwiA
    UmdcpBon0rYEBzDsPudxtJKad7f8vXQCXitRdOnNqoe1lJzkNYNTrOoa3SdWZ7QAPzEy+w
    afoa7SpG4SPGicCQ+LZ2lZsdvAdxRCX/2WdtxN740is2T62WHfLH9C98KTGJ8+bqAvO7x2
    5gjfXtbG7J5Va3256WYwY8cXBsSt5xJuqBwMtCvZzhPsuMnLgszvDYWjXRlRNHvGqYbq7h
    ZHS6aHZW/GGtfTpXeAwD4Hr4zuqBrvLF3zS1Zv0/SwLtzpOTQjuD0iOwwfemRYHyPJoLZU
    v28B/O+f9LW2mAb0ElvqVRCi2u6AOcilH10orEkg1MbP8beVGDgT8+pJmXHw
X-ME-Proxy: <xmx:V10Ia2jAvtXnSokeiJEZysrrHTZCbwTb--4o-irTEqNZpIpV2CCIug>
    <xmx:V10Ia2eAXA4lPegcEJfNgBZkwKHAvTHTQf7pohp3a1NW2LoGLraCmA>
    <xmx:V10Ia_I63n1ll2YNSl2xoJjwZmb9wNgStyreoRUJu8inY2WRxpZnww>
    <xmx:V10Iazn4VqfhlrMkDqDVq1tNzeIP3MKJslQeIK6kzlPKaGRQGP3DkA>
    <xmx:Wl0Ia-QSII4wvdMJmIEpLcjVu3uLIKmz02FQHpJmAHEKPtn-FsAwVV5k>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DAD3DF800A1; Thu, 26 Nov 2026 11:24:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AQpAu8X3laJJ
Date: Thu, 26 Nov 2026 17:24:32 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Markus Elfring" <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Christophe Jaillet" <christophe.jaillet@wanadoo.fr>,
 "Florian Fainelli" <f.fainelli@gmail.com>, "Frank Li" <Frank.Li@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, "Jacopo Mondi" <jacopo+renesas@jmondi.org>,
 "Linus Walleij" <linusw@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Phil Edworthy" <phil.edworthy@renesas.com>
Message-Id: <c3281c86-0326-4d9a-908b-ca461d038052@app.fastmail.com>
In-Reply-To: <02632c0d-110f-4d42-82f8-30091468aa91@web.de>
References: <02632c0d-110f-4d42-82f8-30091468aa91@web.de>
Subject: Re: [PATCH v2] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026, at 15:21, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 23 Nov 2026 15:00:10 +0100
>
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>
> * Delete a clk_disable_unprepare() call on an error handling path
>   and the implementation of the function =E2=80=9Crzn1_pinctrl_remove=E2=
=80=9D.
>
> * Convert the data structure member =E2=80=9Cclk=E2=80=9D to a local v=
ariable.
>
> * Omit the label =E2=80=9Cerr_clk=E2=80=9D.

And platform_set_drvdata()...


>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>
> V2:
> Wolfram Sang requested further adjustments according to the proposed c=
hanges.
> https://lore.kernel.org/linux-gpio/awQ7qa5FGG9RETtS@ninjato/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org

In personal conversations with technical people, I call myself a hacker.=
 But
when I'm talking to journalists I just say "programmer" or something lik=
e that.
                                                            -- Linus Tor=
valds
