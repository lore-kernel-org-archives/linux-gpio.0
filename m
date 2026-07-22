Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33ED31AA8F;
	Wed, 22 Jul 2026 20:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752786; cv=none; b=OmxG4EebPrmIzYaN2I52TVTwkPVsjgWxEZHCBLQUFCvdhoo5/umM2NIjkBkTdZYxHUO8MAeLcEsboJ1QyJw+3OyiFZPDxvSAtgOdYlpX5DlmojzayceBDWpui1hM64rLjBWDQX7csN8FJtmi/fhierm2lUSxD4zlfy8VXo3neyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752786; c=relaxed/simple;
	bh=x1PS7Fo9NTXv58DvUFzHrRKqJFAjkWlNjYN52aL/OBg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EM3mFaSZ2RRmLBR+P7jvnOvXe+zcFGRgrfEmsCy75W9fWpPXYk0syAOyGXYmnAWbe8FedHfA2D2dIPZeSTiF7TZCrQGFIiYfb1u15UhtgxdbcwKdnZIVGwlnewSPd6Xn0BpOCnqabiQNE+Vsfhw7T6rXVi2aC/z1OGAHqlHcH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PG3xCcFX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GZntU8Uu; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PG3xCcFX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GZntU8Uu"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 714581D000FA;
	Wed, 22 Jul 2026 16:39:43 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 16:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784752783;
	 x=1784839183; bh=AgV3CfQUwCOxKpQCcZeddgank8+lUGwPj10cL5YRgn8=; b=
	PG3xCcFXHJQpgThFFaE/ZZQONEdI23t1R+9LPtodbMydg3Tynges1uH6KswJhLSf
	XbbK7/Qu9+KkVAlm2FUgHX5G10xMTO2ko6JzxeL5jGZIyrxihltyfuJfJK+VNVFW
	2ozox8N5x8WCN68bsqebNlrGpPnx+D/aaxY53BbO2o++RD8p9H7fnCX86pBtBmey
	BV1K+XXK1Lnko+7l52VKUkhhLwugVwd5RzOQsuWC4d3bhdQqeqEkPM6vRCPYylc2
	aMkoqioDdFjqkH4okICAjI8u5tX8Wpzzlra4TkKv3ihWVEqm2sYGggLJlFP7UfZD
	xU3LXoKWX/DATwWSW5oRsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784752783; x=
	1784839183; bh=AgV3CfQUwCOxKpQCcZeddgank8+lUGwPj10cL5YRgn8=; b=G
	ZntU8UuZe/gOWBKUr6Q8GltNzwN1EHOH8UyN1e2Lg/ZaD5ihKrpTcM4mo6cpJiC9
	4Pz9SndFN9PART1bKjHcCyoicG+RGYNbwpLLUgcEjxlNRKRc4nhw6z+E8mJDA2vw
	COMLAFkcXejsS1S2Yw14gSX+jaKpkwvoqtzL4Cvm0oR6uUzxYGmc3PvYVQr33koO
	tM0pgCXJkWRQZT6Vm4TMgt/byKJx4nno3v57NkcvtfZSG0F76IYR1szBaotmKGRq
	wxMplHzv2enOzjUvRTSuTwRSdXmakq5dXywK17FPAanD6NQC+tSuRpRSvYQ/o2gO
	SKOxhoxuRkagzEkCyDIug==
X-ME-Sender: <xms:jiphal-KIIvCiIQffsya-AcKwckBuJH2uIrSnEh0kCzW-iFi5Z8-rg>
    <xme:jiphakgYT0YedyasEwwOldfz4EcS-DY2Z_Jz2Nl0ATO5bTEz4yYMRjVTGxdzyE3VP
    jCfNtp5nZo7zik9Cw8L9ddusy7mRLvhzp2kYwiajIp_c5nnhrUH3k0>
X-ME-Proxy-Cause: dmFkZTEFxCd0Ea8kWsgVnw2Dbt/3aQul2rC2oAV6UkFHegQJsFFS0R4+O+23+sWjXW74qd
    ePkg3xRl7tl77bd/rGjW954UW3Vcaseypa3jbIyxKpf0fmw5I5NKFEVzrjB47TVttFHAL8
    C4SM7VR6hqDjL7fpVJOmuHWDbaJYE0apCr0EGxLLw3+dWsNVvUD7YW9L39WCGoMrVZDNJm
    iAO9A4exeTTC8kh6ScvNsHTYlr87owabfxsuHZs4wKPxQ5JxSH1QXkUtoBkaZpsVCauzwL
    /YTEEdNfogzTkPhu77LGWBE10pL9t+0AFBJ8VtCdE0eABkqx/4sgJYlv0136aUcpn91rVn
    gI8gNyaNKpeqZu7GiGU5GRCGPG0rG3322Lwa4EA43BL4OnElaDK/c4ZeSLz8udGc+liGJn
    C2y5CI4R64DsC6E90z5Zbdwr0omvP8qZ+Z4xVyNzzIgLu+smgt5LZmS4MC0ayZRyoVpAi3
    STCCfeNIbcOi6IsRfiSoel/LlxaVPTk8YFk5XtgvFP/oGcO2r+UZzrVeNuQO1iROylpLcT
    XhsuGppc6GulX5EZjy0H91z/jL3iRJHVSK6z0hazQP/w+dayfOy3uvvv/a7GrUbhTZ4G6d
    3cHsQ4t2fWJNnHmsw9a0DSiNBVjJ6yHB4mYoJ1kFqHwBRiI5ZSl9DmDWwAGg
X-ME-Proxy: <xmx:jiphahyoO8icTS5nw-v-LVNH0718-Wa9hihwtBFUi34YhTUIP1fHqQ>
    <xmx:jiphaipTWn7oIZdNQLIQzCIpdftpAA2eczpYYeCRVZ4FiWLSOtlEHg>
    <xmx:jiphaknkm6UIwhS404H9W7esUgfF3vopRZEtG-fr6mzpDYvK_wQ6ag>
    <xmx:jipharx_vFe6PeYZs3AhMsWAng6SGYKGjQGttMaX0lHCBG-kLNLM5w>
    <xmx:jyphahwiTPgnuolJuli_AvFbDS2cSxw605l3qtwe9neRrXz4AHj6DA8S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A119D1820082; Wed, 22 Jul 2026 16:39:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AURDlYaRfEWV
Date: Wed, 22 Jul 2026 22:39:22 +0200
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
Message-Id: <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
In-Reply-To: <20260722202638.135277-1-julianbraha@gmail.com>
References: <20260722202638.135277-1-julianbraha@gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 22, 2026, at 22:26, Julian Braha wrote:
> Currently, PINCTRL_S32CC selects PINCTRL_S32CC which needs GPIOLIB, without
> selecting or depending on GPIOLIB.
>
> However, other similar options in this subsystem actually select GPIOLIB
> instead of depending, so I think we can do the same here.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

The patch looks fine, but I'm curious about what type of rule found
the mistake. Is this a heuristic that found that drivers/pinctrl/*
overwhelmingly uses select instead of depends, or did kconfirm
find a circular dependency that was caused by inconsistent
rules?

    Arnd
