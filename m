Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D18331EB2;
	Wed, 22 Jul 2026 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755503; cv=none; b=bRUDHwuQ05hTIauzF/DKNMVSx1T2q4tqJCHDlTfapwCKJkFh1+rnFQZ6B4/oVuWLwYwMLi7kj2m9CShzXFvBc2gbEnQAHj2Ez/Jc088zuFqT1JQqfp4LIqB6ijE40e6vn6PPiWf+rEOa7oGBSsDPERUcVYlfMCFF5FMBoJ/P2/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755503; c=relaxed/simple;
	bh=+lXhyzGKuSy0eK/8F4lDyf0y1rWD4DywFVxZ2jjJg5U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WJ3rPgiIbRQ2n2cHPTjpgMMlnQ8yo9m92a8evhAaY4xoTSJ9kfACHmhCgyxpn0CNFBP+431154DxevMoJNORJoJlQ3yOt7KdsP1YtxSOzdduu177B8m12uSKtbqJMa6S3mpBjLx3k+Ts5OXaOaTmzDktt1nZvCgWnZApYeR8JKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LFB3Hbae; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OIwpBdVQ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LFB3Hbae";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OIwpBdVQ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 19A081D000D7;
	Wed, 22 Jul 2026 17:25:00 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 17:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784755499;
	 x=1784841899; bh=/oXthBgWL2WsyuAw9FODkIMrZHNZHIEdWRRRjhViSb8=; b=
	LFB3Hbaey8wfBM4nEgYXtjmLBFIkk6ubkbye9yy+9erM/UcUC6yanHhCr7hxbDa7
	zQqi1u1PCXadnIEQszDalgibelIdMbCzazTOMp7bQ2L/nsPURX/4mlnphytPA2NT
	BlbBSuEi/cIByuiGVOdgzenSEsTfoYhP2cMHrOvJvmP07aFggEb6Eiy2LimOmodr
	CRowxoj9AxJdukQLchZCxE0aM7rNKKQk6xiy0Mf6QaU03hmt6RPQur9GwKv6BMQs
	bYg3NhwhX7vkbS6jnpIaXylroZSACGPQm9hRv9Q+DczPXRuX+QP1PQiZkanCahr8
	UGtHX1lVO1zt+UFp/280tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784755499; x=
	1784841899; bh=/oXthBgWL2WsyuAw9FODkIMrZHNZHIEdWRRRjhViSb8=; b=O
	IwpBdVQFsnAlZoDqWzvNP47zSL8Xx0wn63ZWP+W87T2Avrze9ph+9opnBNu1K4Qm
	WWSIU8s6KcFWFgZodbB1HN1QIHgl2jAuurIz4WX82TdwOt/vjuMplj9fpgVBK5jY
	tOGZDaQWiCHPda1wj3ztkGRITrKzvYThN2w0uedRV2QuZil5H/N3jf/Dm/r3hM8P
	flmHcpmu7je+wU1Q1tAFr5zJMO9rEcZNfr3G1JUAfzqAL5f4IX0nnYsMJI5vZ4tN
	L4IdiHbtpsSwoau8+2rh9hAZLsGOnLeyGCiy11CELAm7ZW2nvIFBbNENNeXeOms8
	E0ob1ICB/k/WN2pQlMXTQ==
X-ME-Sender: <xms:KzVhajLpMWVGPAfhER6bO7pcF-0ylf8rBUQfnkR0WMuiulUY3auOlA>
    <xme:KzVhah8Kah-H-o67cJatdYxpSh8vghQ4IC1TVNqLNUJtAxR8KqfoVGTih6xKb_Ink
    euiiarn83CvJ6hY7Ox965aXXGZEl8G3l2Xrkbl5cb29YwV4fmCImMc>
X-ME-Proxy-Cause: dmFkZTEjr22xFxlfckGcwF7Su7O+DsLlQ5Omj7gXCdykkIBKLgg28rpAqcXQxb688gYgT0
    z03ettfMzUuLoc6jSk88XwUpqZndfbz6c7Yam9whwvnvx9NzbC1oVGsyefS/3CoFkkbxFw
    /LCjgUHpV2NQ5TO6TOCgscTo3xegFADEYU3ChCN4Bh/8cK4HpiKLuGgOlUrsTNJH6dM96X
    XiSI9u7iQYKUuhe8LZL3+gjMR3xha1J1++t8YgsDG1GIW/+ZZ43cTBX2tXFzCFgbiJzp4c
    vd7lB/5dsHhJFxWVfIwmbe/aw8M93n1wdPJf/7ogEtJXXizM+X/m1eb+F6J3rCSXksRvFM
    vIU5pNjUwSH/tBm1e/Y96K4NSu/z81eXUJJsRUHOv37WBDxnd7j2GejRFUWz3GcTBwhd2O
    FIJX1wgQkiRdfbPrfme97FpWdEdpDsDXRrgESLLJwhrRbhRRzaByC7p7TzpBODeMLtn4zx
    mJ5RZzucGKz2mgD1/bipNphOE8BEpn/bSlJJBx+C/H+MADw5l9u/HKNpRi8VHgh4QWS5Ig
    K8j/kj+Gk9xc5V07AyVobl87smo5fJjmDG2YUDloipU7ZHzO1R4r/TC1P+NHUdVDl5EY/Z
    NnH06qDReDIxPxootHWmql9n2DGBuwwDEvc3bha1ossde1QbdXIk/Kdcyytg
X-ME-Proxy: <xmx:KzVhapeZezwZoba39T-jbZAqgG2FRtacA5u8fgbjlHA-2B3bBp9E2Q>
    <xmx:KzVhaomm7LfK9hOnS_fewr2DdEDyzQkRKe2I2D_Jw66yXPma2SN0Jw>
    <xmx:KzVhary9ZN22I9rBpB33P2NCa30SQlSb3dOm_opNFPeCW0zqLTpk0Q>
    <xmx:KzVharNnortpdlyjnrXs2nnZC_bFlKVRkAuiXyIgmZKDiBsy8bVSfw>
    <xmx:KzVhap9keECPjgSAJVUNOHW8W9w4aBadPAz-mZoU7yyhXfVKP6HM0qjd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 54B9B1820082; Wed, 22 Jul 2026 17:24:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AURDlYaRfEWV
Date: Wed, 22 Jul 2026 23:24:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Andrei Stefanescu" <andrei.stefanescu@oss.nxp.com>,
 "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <6d67c0f8-3e2a-436d-afe4-89a856ffd0f0@app.fastmail.com>
In-Reply-To: <9b2d40b1-a21e-4ccb-a80b-27f1a24afc82@gmail.com>
References: <20260722202638.135277-1-julianbraha@gmail.com>
 <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
 <9b2d40b1-a21e-4ccb-a80b-27f1a24afc82@gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 22, 2026, at 23:14, Julian Braha wrote:
> On 7/22/26 21:39, Arnd Bergmann wrote:
>> The patch looks fine, but I'm curious about what type of rule found
>> the mistake. Is this a heuristic that found that drivers/pinctrl/*
>> overwhelmingly uses select instead of depends, or did kconfirm
>> find a circular dependency that was caused by inconsistent
>> rules?
>
> Not a heuristic, kconfirm-smt is the first complete SMT solver for
> Kconfig (as in, all semantics of the Kconfig language are used to
> automatically encode all Kconfig files as SMT constraints).

Ok, thanks for your detailed explanation. It turns out that there
is a typo in your patch description, and I further misread it:

| Currently, PINCTRL_S32CC selects PINCTRL_S32CC which needs GPIOLIB,
| without selecting or depending on GPIOLIB.

Clearly, this should have said

| ... PINCTRL_S32G2 selects PINCTRL_S32CC ...

to explain the actual bug. ;-)

      Arnd
