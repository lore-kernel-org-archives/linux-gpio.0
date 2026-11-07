Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794014942;
	b=3k529clRu0x5uzA0uPY3EtRGAumWDKg4lVWYDweHpQ325hw9HGesLsamdraSiZZ/Bgsx
	 jiWW8MLD7WMsPZP7V8r/XzavYR5eBdVvNd45J7M+YWBZrR4DBNpxVo2lrfh3QjQP6GEQy
	 H1bovpcnoymZGn60dffJJBMDIbxRVnHvHIh0bxSj6S8TaQ+tDRXYb7f2ZVjgcB0+JldTa
	 WRpL5Qj1kXF2o0VhS9IiuKM5ikYxvYxFyFsIANtxpBPS/KAna9Vc7+qwEdq1Fax8EtX+i
	 oLtTdLMks8PchL/3x6haMTSPUutkPi/OMRgPjS9hRnnvqcPfEuSwOuaH5zm1wxrKNMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014942;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LqzUxtWOrdzZxrUJYNetSToKibFknyQJufxyAd0/9L8=;
	b=G/XoSHep2RWZ563bIom06REotT/UZyyZcxNFBShupCkKhj6ZNtVEP4K6B3Xzx708wKHL
	 o1vuxK9i2t6rOg88q55xKmdRXwvNgBrSAG6EAZOwEzdm63CvFlekYY84vQuE0X2jpe4iz
	 uQPoarqNPhGQeUq1WvoAs1XS7RWQQRf2imxHQ8I7RsltFVrYHLWjD93G6smb/UgtX43oG
	 bH+bNui3eUeW/gixrhYs18xBncmEPoqTAQA0E6FFVW2oot5HOKfZuGp7Smuj07BjaT0vI
	 oRC0J08y4p77IoqjCkEOYw0BO6Sn8XWgucwKHlkMlmHQiFbC4qhMzzFvXABpITb268g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3wsXo5C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5A606A32D
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3wsXo5C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1DE1F008A1;
	Sat,  7 Nov 2026 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794014942;
	bh=LqzUxtWOrdzZxrUJYNetSToKibFknyQJufxyAd0/9L8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X3wsXo5CHbH99n0geuMjN8jWMWcYSXhnjiRdDCxm18GwGzBl3iIX14yp5EtyfoocR
	 YOR6oCYEhicZQhPQHW0FI5NxLuhOGy+dzVOAHIrfvQxCGLH7PIB7LddzwKCs+D9k3T
	 ALX3L1OSLLl735HU0WhZEWYjSZMSsqImLQ7lLaClVcNotmhV+c+Q2KZAf9ECk0bXM6
	 dnkKccIZhU8tf+IGkoQxxtXHope6WDrjaBtfl4Z7H1b1iVmdc/dETORY507VzJvqJL
	 iqzqu3xveCQ+AXStQFjwUcKpQJxQRi3Da0axSLirsD8bECaolPl78szJZjdz6crWxd
	 y0KboGc8csgtA==
Message-ID: <sashiko-outbox-202465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasanth Kumar Padarthi" <prasanth.padarthi10@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 01:29:01 +0000
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
- [Low] pinctrl: aspeed: missing Fixes trailer for unmanaged
  pinctrl_register() leak
--

commit 31a2821a3adb8fc70b45a6dcb2edc40ec8684675
Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

> pinctrl: aspeed: Use managed pinctrl registration
>
> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

[Severity: Low]
Should this include a Fixes tag for the commit that introduced the
unmanaged pinctrl_register() call in aspeed_pinctrl_probe()?

  Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107012236.2806=
9-1-prasanth.padarthi10@gmail.com?part=3D1
