Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447529;
	b=G7muJ/P7jK3WfGPVn3YmCa8BsvF/lBjdo1r9HxryAtJoVL7k41Tc0XPpa47YzNmVRYaO
	 MxCWYACSqU0gNg4VlPGFEmOnwH0mWsf9j9xXyl3BzqAdPnfP9QcMryW2Lnu09L2ocJ19L
	 1DkGnFpPh3fQ2ScFhQHLUef5d1W8jOBUvJ3hqrU1mCrQh6btIbKER2gkTVs6RsMzC0ovr
	 VrAWS4C+4MpYSByy+QLWSv09ZRVtPKaFmMZZR8oPQM+Tbv6aOx9A1CVtETd9A+1WUlFTp
	 moxsnLdgxQ7y1Gb1KQTCF5KoU+/5SG0syskVxuLW/PBOdYFItpaEcAAHwyJ8IsmZaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xsa2imRTAwjiiuFFr4G2Bf27ghVWzRx+UTBOGXJ76YU=;
	b=W9CcRrv8NTaIcpmES/QLcrAoWdZ2vjhHts+ZuLSiVia0nU5USG1gqfoszxmbQPSUbfp9
	 EYbb01yiDA4FZxANe4XAx+D5TafxGkWOubfOdKqqUbVowFHdqWlR2eFdf0IJg+e16rHxL
	 7HOKXeriyFVv1ksEhKw7jiRNjCPyV29cUYtkO1SNJtPbrb0THoAZ19wtuJ984AX78MA9u
	 R14n5e/AsdygYPw9DQyypsB5n9RS/0HGQdppON9KVB5ebESr/pUcHqxtXw6jh1fgJtVGw
	 GnmvKuYHxBzq+/EKGn2aFxqxWVPx4RXmkXHw+t2LCsXaQ1nPy9ErQcLMpzqSu5IfamQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O74hKPxB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A9606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O74hKPxB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD9D1F000D3;
	Mon, 23 Nov 2026 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447528;
	bh=Xsa2imRTAwjiiuFFr4G2Bf27ghVWzRx+UTBOGXJ76YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O74hKPxBF3eB6Wol+7Wy0A8fxWaQgaQwD/jiSMXh03NY2khCwyhZdXlIfbTSMXG2Z
	 3rSlpvE6rfUB66v3tDfTycmbarLIOmYByZdD1OfK4ODd1/WdyeaB6k30VlIRc7R7H5
	 PPWpjQbVYOkQ9Ll/PZAPdseyT8XhxyTyK6rnFPc1w0TF0tsxqAOAke9FXdDdobPQZG
	 Oxc2pelK1Rr2PcgfxpdIldWAlYAmM63L2cMxMY+D24ZDktLlQZQiKD58KZuK9W7swp
	 ZYpFHWaaXv+tdl8oRDF07cKej+QCaXsJhPN26o7fnTsoZgApb0khDrKsCzWEAjq9I3
	 ssaMECcFixSTg==
Message-ID: <sashiko-outbox-229551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] pinctrl: tigerlake: add ish_uart groups and
 functions for INTC1055
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-1-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-1-f2322a91686d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:25:27 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] pinctrl: tigerlake: missing Signed-off-by trailer in commit
  message
--

commit ed0cca78f5e8b9598f102ed205c19828395c0586
Author: Gary Wang <is0124@gmail.com>

> pinctrl: tigerlake: add ish_uart groups and functions for INTC1055
>
> Add ish_uart pin groups & functions in tgllp_soc_data for device id
> INTC1055.
> The pinctrl-upboard driver set the correct pin function corresponding
> to these data.

[Severity: High]
The commit message is missing a Signed-off-by: trailer from the patch
author.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-upboard-pi=
nctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com?part=3D1
