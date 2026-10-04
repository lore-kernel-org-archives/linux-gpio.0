Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D7481226;
	Sun,  4 Oct 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141451; cv=none; b=JmQBUI337FuGGL9x21mC5mNVUWb6BqfeXD+PDvMSEJ1v2PueAgEDpwHlSQgpTHtA4TQVkGVJc23Pet6irOanuK2hm1vv6jIGYNJlSumTu0TARQn8Yfcze5UjhXQs2myV1spXg/u07j4gKP70IasiB8yE7BjtCgoMiSyRpUoW9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141451; c=relaxed/simple;
	bh=CL8X/Uiej6DMIFxhQJFfWrFAZaVnvMonwLYPyeZunnk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VE7JziXQ8OFae5KySEgVeMh2zm2V3dvBYdgd6YfJpDu3ZRdZf1RiE6xQbZPaBn6IJ6/3haBF/8pNIAEjnUSX3060K4tMET+nfIL9kK5WmhhEy1jooS4SldXl4/ORvGqk1rETL/OrD9NxwQyMzrb/IlthgDLI5VT/roSQ5R0Vs4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8DEeyhW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8DEeyhW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247471F000FF;
	Sun,  4 Oct 2026 19:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791141450;
	bh=iVlLqWnRV0zh23vKIu81Jyc04sMGS7kUp6OXTgOw4+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8DEeyhW01DXxPt+7W1ROtptBUZSc61eUpJqQqU1R7q4ad0yeuu7KLg3EhmTFf5Yl
	 17fX6Iv0Hbv2+HzuVMWuXw3i+Ca6slaL+Jk4mJQzNN2WgFTyAELofM4znUuMGyGg2S
	 3iwyXSsKzGrZCL69zFija17oUSS/CpYwB/KX15uLwTs0yAPRJvoWV2LXKorLLXuonj
	 MrgtI7Lp9kHp5QRVuKOlxcPzgvRKbhkI9MFY6/xAyfSmqZAvOabkuiT455p2cUW8mN
	 z/EEHIV0k7baVZKkC/ZjoCUxGVxwpoEOD2+1H6aTKRz1gHk6XgezdVZmrRG2miXaCN
	 ewHKOMvdjZvKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20261004191042.143713-1-rosenp@gmail.com>
References: <20261004191042.143713-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 19:17:29 +0000
Message-Id: <20261004191730.247471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: commit message falsely claims in-tree DTS usage
--

commit 7b4c1f570780f70afdcc949de9998c051c2323e5
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible

This commit documents the onnn,pca9655 compatible string for the On Semi=20
variant of the pca9555 16-bit I2C GPIO expander. It adds the string alongsi=
de=20
other standalone entries without a fallback.

Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@int=
el.com/

> The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> expander. "onnn,pca9655" is already used standalone by in-tree DTS
> (armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
> the pca953x driver's OF match table, but was never documented, causing
> dtbs_check failures.

[Severity: Medium]
Is this claim about in-tree DTS usage accurate?=20

Looking at the armada-388-clearfog.dtsi file, the compatible string appears
to be only used within a comment:

        /*
         * This is how it should be:
         * compatible =3D "onnn,pca9655", "nxp,pca9555";
         * but you can't do this because of the way I2C works.
         */
        compatible =3D "nxp,pca9555";

Because the string is only present in a comment and the active property is
nxp,pca9555, it would not trigger dtbs_check failures. Could the commit
message be updated to reflect why the binding actually needs to be added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004191042.1437=
13-1-rosenp@gmail.com?part=3D1
