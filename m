Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447355;
	b=kg/SkMkrhnwWKtIX69UF2B66G2CBaxYr5QZpfPfVe/F6lCbuK1wQ4rnwYMJqjlTkYlzc
	 ZZYxL3oiOmt28YAnPYFM17RQR8+MC3M2haQ3lwboVzqI2xXFE0KZxPYbSP2pf/OYGBYRa
	 DYPBXkI5xMasIy3nRyOZvjHC+khKFOvxmQBa3W65DrtX6OSaYr0Yba8+QnNcH/pxpi6q9
	 AaUo3KsB1NdR6+K3x+L7cEQ4aLqPfRbJS1ob2mrPuEnbhfH2xLBAREG8l5Q9lQUi7Cdnb
	 gkB6/A4dgJ3vGWkEuM6EGJVXZBHIVKrTFQ3xJuK0kI7svRX1H9aNbugEPr7KXxZWjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447355;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WO80J/4lVUWi9Bwgbdq8mq+txJ/SAb7SNNtOLfhZ0TM=;
	b=FnjQszDlJnU9jAesa0TEqxkH3kThVdPxlnSnNhrtFaok12ArPKTmCDUjJukatY8ay4Dh
	 rUrJ8Ay4GeFPL/xFVbnI3fObJIpZMUyRbudsTRbvAnDqK9YqXoHhnNlM91JW7lsuOVXo4
	 77NEUZozOtbdZ6qcz5LokjodhsJlgm7l5koiZbpImUtfmdUVEOoANEug2ZCY3AkGyr2L6
	 jcBrsgl6Jhd2EAHCAcemSKwX9LJK/gy1wxKCp7YAZSxK5aNfQXhPDpp4lYEeGhkVh0ddz
	 lxYKQNb1MuL7ObEi/hfecgvjoKnn2YmavqZnQ4mr+qmh9j/uGX66wrCCNbXfhxAYs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8CSQQxv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D90606A338
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8CSQQxv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D436C1F000C6;
	Mon, 23 Nov 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447354;
	bh=WO80J/4lVUWi9Bwgbdq8mq+txJ/SAb7SNNtOLfhZ0TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8CSQQxv98wBPSky9Ik1bQJFCFVO9I+oacKD6gx+42wduHAuUVjtcCtt46oC06tsj
	 ZQgo0A9Jc7wmoY53zf9a8m2Aghysetgx6PwmFjuTHTm0Cm1A/1JVciUAO9NwGlOBA3
	 P4i6Sct/jt2bpkaDceGBqvFWR5hmRZ6WInm/BFK2t/de2nQt48VvC75XxIQ8IXS0Pp
	 ssmIVKMhgXm/n2c5lEm1gTSaWSx05ifUrmtTxz1g+y8XM7OUupWwPYq7oRmAVbTz9I
	 Ozl5usj5IfOEQh604Dbz8paI32GNApMuTyewulj3GGR6BdRLSDGZYd1ChbJrT8vkxZ
	 ALo2JBmceE1Ag==
Message-ID: <sashiko-outbox-229541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] pinctrl: alderlake: add some groups and functions
 for INTC1057
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Wang" <is0124@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
 <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:22:34 +0000
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
- [High] pinctrl: alderlake: missing Signed-off-by trailer in commit
  message
--

commit 7a7309617b0f7019b8d63712f11627aac88f1e5c
Author: Gary Wang <is0124@gmail.com>

> pinctrl: alderlake: add some groups and functions for INTC1057
>
> Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
> in adln_soc_data for device id INTC1057.
> The pinctrl-upboard driver set the correct pin function corresponding to
> these data.

[Severity: High]
The commit message is missing a Signed-off-by: trailer, which is required
under the Developer's Certificate of Origin for patches merged into the
kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-upboard-pi=
nctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com?part=3D2
