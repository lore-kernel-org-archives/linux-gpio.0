Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665768;
	b=a1gmAXxLW61VW+Xmyh+r19NRE512jwOe8cThNsQJQNekI8ywak43JdPAcaBcqPx562Gc
	 dPr748iKScz+rddXdBD2J2O0csr/BqLisnJ40T//nzxhw5mxYtUNxyGoMYy4rl8VcuvXh
	 HxguiBO7Kz78xWeLl6922Z2M3nWtHwRdqyUJjigcOQL3nj1slbIduPYzHZSo0Ryh9BHg5
	 RGAOk/oVAutmHbc0oovMfsqTepjWy73I8vQ3S4D3XIyhXIa43nE8ZCVyQEREO1CsrrgXo
	 TdAFm90EF+pvdFpuuelEipEdVRYyZqAPL5IMF0lxprcM6CGQa7zD7PXKifEI0hErTbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665768;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FdyFo9aP0aBOWLnx/K2osSKErmcqOp6vsfZYxARQvmM=;
	b=dZ3lOBaa7+SFkOMtHifTOhS6ulM5WXQAl20oj/GVCci2QhcjUyrtWhZwmXDrA99uFBmv
	 b8pm3U+WYekTP6nB8/BdRyh8FUHqdXcurhDxZkJwhc1ieCN9bRZTOUPO+WC3tBqhftNRG
	 qa3zvbF+Z75R3xQyGR1vP3FNwgvYotUkIm3Vf08PZ0cvq54X+K1wKrAW1ZQHisKYHGzPa
	 DDCGTHCRsG6IAud8Q/RlbRK+z7og8Dltzkdxn0UHt8VAsjyvj7qwwWry+OBUqOEavzTF8
	 0G7Fk1gbk29Ge1eogS7Df2oVAmQ32fooif3tmUGc3r4MHi5TdArYkZAPbEz3ZjFfXaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwqSlzfQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E31606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwqSlzfQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1631F000C0;
	Thu, 26 Nov 2026 04:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665767;
	bh=FdyFo9aP0aBOWLnx/K2osSKErmcqOp6vsfZYxARQvmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UwqSlzfQ9DC5WdP95seVl542pvWo7NlJmIi2s0p1M3oC5x0yMUIKtbIXZqTQWELWL
	 EnfYew9f50MZEPO+jfvbu5lWq9+4MIHey/Un8GcquHmzmZS4UGxHhTZh6SgNVqVeJ0
	 YukVZZ5o6QCjVPY8mY+uvI+ZgiyTrVICrEV44aZ+YexdktUeM3tYjZdT9RW7J/7C1J
	 6yYZQ1IxGHHSxSpRxQ2S8ZCsgOVdLz8H+VyCy04lp7USJJ8oGPdU/eL2PrsudYG4L9
	 NF/n/TKgZ/BZY9aQncy4ckySRjCNPTJHEVvpTy2S6iisX+rdfDY1zcRvSey1UotsAT
	 rH1XegaWfAZDA==
Message-ID: <sashiko-outbox-234717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: rp1: use pinctrl_utils_free_map() for map
 cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiaolei Wang" <wangxiaolei01@kaihong.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261126035420.1836760-3-wangxiaolei01@kaihong.com>
References: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
 <20261126035420.1836760-3-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 04:02:47 +0000
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
- [Low] pinctrl: rp1: missing Fixes trailer for CONFIGS_GROUP map config
  leak
--

commit 1a3cbb21b3f3fd0731c811def787e2db607e8aeb
Author: Xiaolei Wang <wangxiaolei01@kaihong.com>

> pinctrl: rp1: use pinctrl_utils_free_map() for map cleanup
>
> The rp1 driver open-codes a dt_free_map callback that frees the config
> arrays of pinctrl maps and the map array itself.  This duplicates
> pinctrl_utils_free_map(), which the pinctrl core already provides for
> exactly this purpose.
>
> The local copy only handles CONFIGS_PIN maps.  Because the driver can
> delegate map creation to the generic pinconf DT parser, CONFIGS_GROUP
> maps may also be produced, and their config arrays would be leaked by
> the open-coded version.  The core helper handles both types, so using
> it removes the duplicate code and closes that leak at the same time.
>
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

[Severity: Low]
Since this fixes a memory leak of PIN_MAP_TYPE_CONFIGS_GROUP config
arrays, should it include a Fixes tag?

  Fixes: e3ce7b897388 ("pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinc=
onf support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126035420.1836=
760-1-wangxiaolei01@kaihong.com?part=3D2
