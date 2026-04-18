Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A042FF65B;
	Sat, 18 Apr 2026 22:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776550338; cv=none; b=eYObqIfvIXpMsIdxKwdC/lauJGoYlPwJnkPLUPmJVfjBRQDn9jlxaAs35eH765yZY1tll4JQbSft9haQgim6pwy9Xs3TkYqQ+z78VUWtSjl3auDV/Fri6JC8+I9sP1g5bQCYS462/FTGDgTsaTEJHqST+XD1hj9RKZOk3fCqnFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776550338; c=relaxed/simple;
	bh=8eAiXu9mG1AaknRyOHlewiz53dRZNMymtfwRlIOR3qo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rl24JNU69M6YPPBPGmMN3bTiOgyRcUMiSG7x5tY7Kl6UPkbhsr99bfaQ//dzTTkC2JjLhztz2SLMk6/TMUkDvnt2NmQRn3gjHr21pYhwquuVeDgd2gqPAY7ASqrSsHEuJ7fNT0ep1sAAxOwRTI0JCn6z8z+4mpAOq3+pKmzItPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=n3XZJccq; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="n3XZJccq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776550334; x=1776809534;
	bh=lacb7lQvxfrh2afRtZXltlvQIe1GUKzZCXjLWJNBxvc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n3XZJccqWK4dt0Nz0xD45YuhmNPyfmgWEVvQuSnLt7s0FH478ug4VzZZeBWtpwxuB
	 CTLC1ziFVKQMuYN4RXuSapW49OiCPpfSn5n9y5xEfmVyfQWXAkUeD27aGFWS1sAzqN
	 75XoLozJgOtksuEpBWmt/S3loUnoS6FpYcNzLZENQ12wuT/v39dNGH5LCvzZ/2isAX
	 MTk263gcOOD9J0ozoa2TXGVGaSbSoaoyDDDwfSQIjuN6nYU3uuJAUdUO75sSZ9pS2j
	 Ag35bz8DHu8PqosCuDEYGMKMRb299uaxL8sOeiCxpduoYXFewbT5NfJ/bFHLvYgl9L
	 b8zOzQTSCbg4g==
Date: Sat, 18 Apr 2026 22:12:10 +0000
To: Alexander Koskovich <akoskovich@pm.me>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <gbte5DNdcRclvJHllwkBAYWZ0fTKvH1K7kYAFmhkZr08Ez4rO50KvpFGN2wIpD0NjdU6vf7KzvPGbGexqhiXOO_f5Z0uRi2ArOfBE6E2B1Y=@pm.me>
In-Reply-To: <20260418-fix-eliza-pinctrl-v1-1-864bf95ac83b@pm.me>
References: <20260418-fix-eliza-pinctrl-v1-1-864bf95ac83b@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5b465401dd9249992e34072bf0a71140d8539099
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, April 18th, 2026 at 6:42 AM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> Multiple QUPs have lanes that can be routed to one of two GPIOs and
> collapsing them prevents devicetrees from requesting specific routing.
>=20
> For example, a board that wires an I2C SCL line to one of two GPIOs
> cannot request that specific pin with the groups collapsed.
>=20
> This change splits them up so devicetrees can request the configuration
> they need.
>=20
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Sorry, forgot the binding change, will upload it in v2 (I think I can break=
 ABI
since it's not in a stable release yet?).=20

Thanks,
Alex

>=20
> 
