Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397023B2D39;
	Thu, 16 Jul 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208115; cv=none; b=ZL/cPBov+KZnAvHmkc5XQLo6YNt5ySUOWoi508APApqOi5UVTcIq9r0z6D+5H5ykuH+TXQVqj+wAvFX0k1Dv5MeFeRpGEG/zHeRhz7agDey377tvNJiGrVe9/VjoMVevUBNpF93I+xAA8FCgvnB79IoJ4DMLCiyltY0KOthZUy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208115; c=relaxed/simple;
	bh=SL4pY/1hpVjydxLiVT7wjPjnmaQBwI1uzvzemPcSZgc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D6DzYC4oZ/EjhuLHZVCcft1WE7cL6lR6fRPI/6gBzd89Cfw09aMJnpt+FRjufDqQqmudKUCD4gPgCZ0azI5sJj9bRc+7TDhSQvWDny/inBfci7/kroS66UjLN7COWmuMm6itKLUeXkPWmHIzDZSZ2E+XA8Km9wReaEg1SYCZG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UyWeVBpU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HdL5r+xv; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UyWeVBpU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HdL5r+xv"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 197807A00FE;
	Thu, 16 Jul 2026 09:21:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 16 Jul 2026 09:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784208112;
	 x=1784294512; bh=EKb+YqsjzwVHOkXmtfECh0kI3dN6sHS/zWWw72sTgR0=; b=
	UyWeVBpUtmv4CB2vN2mTrqJfhgK1e5kBUbeYag3sn4kq6J0H/ep0IRCksm+u3Tmf
	qvN+0HTTp+pzhENMEFThOxHfASn3dXT6o6V+UnihxZgDDb265psIJA+gP0IxMyIj
	m6DZ9zXMNlmeBhYkK65ClZaFo9qWptKosRQ538FeLvgJxCV1Ds9YjutWNBrTxngR
	ye4ia/b596MlCBRAGeLQO58J5c6XNdR+zcnTepsty113CwV82eRjv8sXo6lrwB0z
	VdUNpLg3hkn9K1BbGWY8xHXCwxhoS9jVuQ7RdkKgqNcbDkqaroWpR9y9lng7qllL
	yXXEnS5t0R3W/lufrudEqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784208112; x=
	1784294512; bh=EKb+YqsjzwVHOkXmtfECh0kI3dN6sHS/zWWw72sTgR0=; b=H
	dL5r+xvE++any7hRk5B2/WWQZV7RrCkJtrBrMBMLGJUGmABgoJdmwLrRX7/LrhaE
	2YrvgfobOQLppBJKQepWTXX8vffjjNHEW1xBzKhi6X1Ux4j0ES5awspr0C/ivbSK
	PKPG9PUZTHffdYNlUdplYhRZIuTTx6pjcdIVMl+7DvtV0xbvRLvdO0l9+nHtSuo8
	5eKxVndJln4Hr7zAXb3yMX1No5vUIHf6VuBCMDiX7sNcm6n9irqVKP8Mm6STlkPc
	HC5mSwTwTIyv0HjBu2n3jqfXrS7nSZIOPUytllrUxaQR3lxWyryrImvkEOmgT3Up
	hzyj8A2PwBUHD3dPCol9A==
X-ME-Sender: <xms:8NpYak4xnmfAHAwiwkYl97kOEUFaJqqYkB8x99XSaS0_95hetNGoHw>
    <xme:8NpYagvmHTIJWokO2V98AEu2RWnhwSEOUSAQ5kqZl06WiPr-OrP3BsqGKtIdEShlc
    6cgGqcCE4D-Ggxjvmhsmbb7_tY6592aIQS_ZTZIEcPWqLFfftBRjwQ>
X-ME-Proxy-Cause: dmFkZTFi2a10SvmurOlV4SjaRdFdNQwzJ7zM4umP+t371P532feLW43sykKsSdFflv03nJ
    ihAJzJmpo3Zy96+BcPdLottpldIC+g3eKSyeRJFSOIOPQa5GORsmCBZzOh9vEyR08QLoF1
    HQHQJxDQrkePbOrAg2EvwC2o7heXZ9ptQh6CebLCKwqTWX7bb0GjGb+OKhRMflTsM3WS75
    9v549U+f825sTij6xoeSXPm9tiI0IBJSx83IpJmx6B9SIm6MF2m+lH1qPemxB2ZLsAaYl0
    uOtpMcyQhVZT1OigmJ7WJR/XdMSPdMc9ZvCTqnTT0LKtz2pFSOlPdaxNyfn9jyxmZVdXq6
    KCSjT1jMur4sOU58HeOjW7gUaXRs9FYmCGFksRjFZbnOf88ZuFqBS+dtfVEoi+k8hyKUIL
    +bsQ0bWo/F7U8e5eEEFnPQ7g+nR7SLoDeZFL6zBgyU3T6qE3tmTjjRzVAZNQrZ4LtWJePv
    FgW8wk9HnZidvKmHe8SRhR/YGLv6v/lAlbcvSdnHAvX6aVjILvPm2I7LVP7bKfGbX6PQOm
    ZM1Pwz5CKDhUoC7Gj2OWMtVQlD2tDMkEL6eO+h7HV0/gCrthlQXVyQwlhr44rE+WwLG0xJ
    VyrgRI/48kqjewBKj2qS2SXq+FeiI+F0+8fhS4XwdvIJ8Y8hOHVcYTciAfgg
X-ME-Proxy: <xmx:8NpYatLkxRAuGM_9mTmLey67fvXDQMEOWIFRuCsuLE1y7ggQhdR7OQ>
    <xmx:8NpYaliZTz7Uox9CZFd_krmfELtc98hn2H_2GlYXb3JV3QK-biVHRQ>
    <xmx:8NpYaqLrhPsbijcHOJecz3bQcSUP1bvXpRP6oV95o5omYKQlVc1LxA>
    <xmx:8NpYasj02L84aLClJtaSmziTm9c3CXAXh-vwBlks6JodgzHJVjVMwg>
    <xmx:8NpYauHpC7C_xfeKQzMGx28UuiWo63C0KQQD_BidUevINdQ24zXCQY30>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88918182007E; Thu, 16 Jul 2026 09:21:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AQRSor3DlODN
Date: Thu, 16 Jul 2026 15:21:32 +0200
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
Message-Id: <64117177-84e6-497a-9c3e-4361a11c4922@app.fastmail.com>
In-Reply-To: <20260716131626.103199-1-julianbraha@gmail.com>
References: <20260716131626.103199-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] pinctrl: fix unmet dependencies from missing GPIOLIB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 16, 2026, at 15:16, Julian Braha wrote:
> These 4 options, PINCTRL_PIC32, PINCTRL_STMFX, PINCTRL_IPROC_GPIO, and
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
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
