Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436468;
	b=mR5kKxJVSBORXdSFX/lrrBJOyGYBXs1heXhKyeFG7FLJ6HkCn2OPKLqCEATiav7srWVv
	 vbIIRwYYKVr1pRKz3AcCpTjm2GwJJlG1/vdb7iYOjUFaqPhG6wxucBfFlxeFV/V+FOygN
	 fWXem2fBBHFQfMLGmb/3AIbLuFmG/SZVy1+IUrD771Z7jLJ39gtWjwmpR2bjsTLEnduJY
	 eXzqD+HgNWTc91bD92rDxkS4Kpn+UP0iTMerB5V+0UK8P+icIDpnQwrdneu0eqcAoLD+p
	 Qzob9ObUHmvjyI20Egj+XCnLasXcaulr5L4wbRbOlWc1nik+gSY9aXjr2PlLvrgM/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vlaXImFDXj5bJ4Msf1PE8s4iYGlowfmI9OFBIOa8rpE=;
	b=gG5N8EAf+oAcR3XGsjrEAN8U8FWDSOFlejtrdrMHHK29Vt3+Pr3hm1arjZeWLzJcFXxt
	 8WApeQiiVZ3j8powNQ6SWoyYrkUgEel5lsIf6PbLqSh/Viw7jU67U5LWGo8WQZlbj6vkB
	 DIfGk4SfQ2eK0O2v6T9PybvQkmWCBPpELJ39mrfaHWHovpT+Nl+jmS65ISx1B6tCq045H
	 pKTqG8yvubg18+4rZSNwHm/3ZrEyfUGqoIAhw+GD7D2Dqk5m90U2klg+NzOZTUYK0rGoZ
	 nAr6IC3Ger0JpwSFw5m3sCFPUAKBX8+CqOGt4ER3xR4N5cxn0v+Ru8KcqzoQ2Uajcxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WXho/SZ8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE5606A330
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXho/SZ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255DD1F00A08;
	Wed, 11 Nov 2026 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436468;
	bh=vlaXImFDXj5bJ4Msf1PE8s4iYGlowfmI9OFBIOa8rpE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WXho/SZ86QQjT9UE6Wvaw9kiQFVrwsArqgZ/ZITm/MGEfFUmx9wX1otnENPgG3YlE
	 mXzi+YY+FFmmL3jDuvFE3p1mwL1WiFLpuCJIAtPQMI6x+zJFDxGNyWvPZIeoY2Uic8
	 rHXhcuLr4kSAtWz9NkJac6oBEag5/6qGIwI7D9+TpDhIvTkgkB0xlSsOYpQe4m1VCU
	 YnX8LIF06E3udKpsY9ORVm61h+LuxJ/G+gF+KysDTA5VCG7wCTnVoDOV6CzwNURQfi
	 Py6p14QkcAsDoz6LBMCm+4PHKzRWFlYIwDFhLvv7l842QNQfgyoQb2ZFjYIMKMcTXx
	 Ebgc04SEeR4tw==
Message-ID: <sashiko-outbox-209808@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] pinctrl: nuvoton: ma35: Avoid leaking map when
 parent node is missing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-gpio@vger.kernel.org
In-Reply-To: <20261111215256.1982044-5-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
 <20261111215256.1982044-5-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:34:27 +0000
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
- [Low] pinctrl: nuvoton: ma35: inaccurate commit description of
  3fd976afe974
--

commit 16d0fceb87809d6ff503501ddb36d785b4f12a75
Author: Lee Jones <lee@kernel.org>

pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing

This commit moves the parent device node lookup before allocating new_map in
ma35_pinctrl_dt_node_to_map_func() so that new_map is not leaked if
of_get_parent() returns NULL.

> Commit 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
> ma35_pinctrl_dt_node_to_map_func()") removed the kfree(new_map) call on
> the !parent error path to avoid a double free, but left *map =3D new_map
> assigned before of_get_parent(np).

[Severity: Low]
Is this description of 3fd976afe974 ("pinctrl: nuvoton: fix a double free
in ma35_pinctrl_dt_node_to_map_func()") accurate?

There was never a kfree(new_map) call on the !parent error path.
3fd976afe974 ("pinctrl: nuvoton: fix a double free in
ma35_pinctrl_dt_node_to_map_func()") switched the allocation from
devm_kcalloc() to unmanaged kcalloc() without freeing new_map when
of_get_parent() fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215256.1982=
044-1-lee@kernel.org?part=3D4
