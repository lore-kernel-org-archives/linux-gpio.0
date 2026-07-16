Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81333993;
	Thu, 16 Jul 2026 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182911; cv=none; b=IYv+9J6uK+xo2emA19jVbuX8/1N2LWBeEL2yI18pi6S/0kf6yxhchTtyl9b9TaUGXUZEFkhDuKDamfL95d1Z5Xo70lcXDMOsKKCxR61vEhOOkXcksyJTjykvnpJdvL1CxTPgDvGD2VYiUHTpPKS2/OEk7YJusLqrCt+wXZ7ftcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182911; c=relaxed/simple;
	bh=WGRtPEpSpHdE74KsyQ3dmbVgsigIjh0s07EQTKm2ZyQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bPzge6OWTFtlmSLq/FK8eW3h2Uu4yHlmqB3mpvlc1f2ikm/VKA5HYS1pd0CJUWM4mtOJBFSM/i1wZOzTD0MqEr84uF1EA/3gzFKD8QQ6U/UK/N6h13GgI5My/2RwyiyZteHnrpewKRAI1HLRfGFqZsbe9yMXt5efWnmxskBsfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Yksgfjbn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LlUkF4P9; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Yksgfjbn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LlUkF4P9"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 37FDD7A0068;
	Thu, 16 Jul 2026 02:21:48 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 16 Jul 2026 02:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784182908;
	 x=1784269308; bh=wWI3YxiRU+uaE++wycQRiuzJC6gHMOO3HII++cYrWHI=; b=
	YksgfjbnCjQbwlmKJeJHWhG65yf3aB6Q/VgcUUpzoU9hSZ0Dotoh6s6/cf2KGdyo
	BOo/46acDn996AhlX1TS6OPzp/+gw1dd6FW/n8hkVZjEUE4fKdWnQpBlzT+YQqBX
	rKq2dAFeSXcYlkoCcsiWxapsXi82wSKMVd98/onUnQ437EIGCHbZvnUoTueQxFp5
	kE/SIYeiZEO8LrvXC65+b6xEn4UGIQ8OPhW86DDTxfs/PgekQOemOf/jIOSECXuQ
	dCFVtFqwHHi3l6vGrXWIsjOvu/HEq59RslG9zfWI961w3fG0IDdFRMYsPhKqtKDT
	DjfyX5P3fCnARfZ6RcgcpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784182908; x=
	1784269308; bh=wWI3YxiRU+uaE++wycQRiuzJC6gHMOO3HII++cYrWHI=; b=L
	lUkF4P9j5A2h2jp4IAMvIbulapB6QJMgXi/iIhj9gRcvHrOlIKlbOuDWGguqaMpn
	wtjDXj8kjiWAW6+6NOisItCKbHB/X1f2hRdL79FbjKi56s1USgciUO6C0bgqC8Oq
	WiOuPgmVI5GuWZmR6ytoldPR7El9yo9DrmCMqb6BIonywscLixvBGmqb4E6eUcsg
	AozxmVZpq3lAf2tF/RRCaZBb4zvLdcOAMxsN4G0nmGhK1o4+pjBdrrEI2WA4lthU
	rqPEBqc5j2TixPyubZpFTYyROGUR75Yl8QkwE8GhmmaR3MbForDdZlZ/fbLf/bW8
	24xzkgRE1cNWj6WWjILVg==
X-ME-Sender: <xms:e3hYanE11XkiDwXGWBP2c50gWokc-s4UTQxf51wL2uybUDPL34IXjQ>
    <xme:e3hYavIahosvAncL7UFGApjXnfqx-qoS_P9N0uq_RCZr-6qN8OWZxHoWaumSTwteg
    ADyvlFK71J3lSXYOh_sGMslBq8a0lU9SBfg8DLVwfRuJ0nQt7Kiim0b>
X-ME-Proxy-Cause: dmFkZTGVUvJslv/2z1unVGw2itcfhczROYP7RHaHr4fKHABoHFi+NNcO+qu8bY8eWR/Wyw
    ERHQTicoiZmx9bpfgrStktDp4wP2TtyEEFPch43p0TbOAUsX7su174INiPD9OG4H1kZeEL
    thDx5/gwn0Z6A9nsa2TmXTFtZwi2f3h8x/deMiEkhDBwGH0HIxXkbayvY7GKmdc0NITy1Z
    tFmvqR6Z3tQjyJVpvLNldt4rmJN/K+HNaJkPuORYsat3cRhOELh2LncJfR9PUmHgkkV61Y
    3Z3+TFFTaPrBPz2SXY6v6bApNJVhYZ/0FOGP0c/U98n0hV1hc1SgzpVjxaVmHh6Jbf5CGD
    kLJEPFD3mfnwBFoB2X80W8jItdJlqCv1fScEDXg6h1StK49Swp7huFCmAW8YBHkMUboNnZ
    h1pRIPDUaQrMvWZahMaBtQuQ/CtLVApZcx6UJ+zcjPNGg2WP7hgE/0c4gxSmPpCed2Zg0p
    Zmc+eg/uM4GXa+OBJGwqeRo/HWSn1XxXVsTVW1IRC3rZ0kEJ2El3ZpTf4/IkiD2DqD1sZe
    EUZb3qpkcrMtH4EJyQ3UqP2JOFrX4/8/vykGDE2xfws1anPg7YlDN2EbAH9IG/jM3aVCsH
    BZxce2QjiLYA6Dx9RAroAh2GhhTpwUgiVr3dr91g4YI08T8dSNUUhDewiyDg
X-ME-Proxy: <xmx:e3hYakVdULOFoF3fs2AnJmZBHDT_nWB3RoBxUw-9LxP8UoM_arYu1A>
    <xmx:e3hYak80gJ-56-SFr-rM5yjJLeLa2-GfjpHHAYu6ss5I2qNYGPxS4w>
    <xmx:e3hYas3QJBbnI0lxn3Gw1iUPCvGhH-0ahXIwiD4FrQGLTxbc7GmTAg>
    <xmx:e3hYahcqdkvwpFaVatuRP-i-S1hlLsnzNNzhrq63vvZ3fh7CaPlsqA>
    <xmx:fHhYarCnSuWTgstiuwj02UVdVoLIgeb0oQYjmEg3mwexq38Ta6yKQ0eU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 361B4182007A; Thu, 16 Jul 2026 02:21:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Awyws1f77GNR
Date: Thu, 16 Jul 2026 08:21:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Andrea della Porta" <andrea.porta@suse.com>
Cc: "Phil Elwell" <phil@raspberrypi.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 iivanov@suse.de, joshua.henderson@microchip.com,
 "Lee Jones" <lee@kernel.org>, amelie.delaunay@st.com,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 yrdreddy@broadcom.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9f001f8b-74af-4a68-9377-6566a846f043@app.fastmail.com>
In-Reply-To: <20260716033441.21330-1-julianbraha@gmail.com>
References: <20260716033441.21330-1-julianbraha@gmail.com>
Subject: Re: [PATCH] drm: fix unmet dependencies from missing GPIOLIB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 16, 2026, at 05:34, Julian Braha wrote:
> These 4 options, PINCTRL_PIC32, PINCTRL_PIC32, PINCTRL_IPROC_GPIO, and
> PINCTRL_NSP_GPIO all select GPIOLIB_IRQCHIP without ensuring GPIOLIB is
> enabled, causing unmet dependencies, such as:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_PIC32 [=y] && PINCTRL [=y] && OF [=y] && (MACH_PIC32 || 
> COMPILE_TEST [=y])
>
> Similar options in this subsystem select GPIOLIB, so let's do the same here.
>
> These unmet dependency bugs were found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 2ba384e6c381 ("pinctrl: pinctrl-pic32: Add PIC32 pin control 
> driver")
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO 
> driver")
> Fixes: b64333ce769c ("pinctrl: cygnus: add gpio/pinconf driver")
> Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for 
> Broadcom NSP SoC")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

The changes look fine, but the subject line is incorrectly
copied. With s/drm/pinctrl/, 

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
