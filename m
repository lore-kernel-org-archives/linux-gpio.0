Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632233E0C67;
	Fri,  9 Oct 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578862; cv=pass; b=iBr7o59FSj0cdrzsOYkYCcDw878f+kwwf3ou9xo4pMzc47R1mIYKHhTLgYwdGVtOmqRZ5vxNiMGFw+GtEFuZXN62YxQVChccnvnhi7CmzlAJYw5JbUou6AXOSSrw3CiHH+yAUedRC/MN9pR54q1L8oFsKGBFbe9mqYxfVP3d0pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578862; c=relaxed/simple;
	bh=sE3ImJEOPRkc/HYpC85TSicTuBVRnOfyTpenOBvBOHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M8aiK4JKiBwZZHEsBVjT57Qe999ACZk2uwGu/la40pTpygZKrmS+4KdG8pocxLUxV96MhagPv+pexQkwBjWIHWmiNEhUqsIG9xfm8CVFl6f6/lCsjjkn6ZKOmwRaLC1+Bf0Ir+sSqYylagqYnXMpjZAmJkqlPGsYlse5fcaH4Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=LYnngFrw; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="LYnngFrw"
ARC-Seal: i=1; a=rsa-sha256; t=1791578852; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VRPTCb08ttkP3E899oSjyckOFaZi2+7uzFC4w73q65C+9Ve9vOgzAlihPzyCmjWxI31VN+y+Gvi50ZV/dujq1osF6AjsSN8YEmDePL4EPVdfRsNMd9yzojDCfmhkfxCOY95WRttSimyULFKe0BSK3AVrDN+Hmc2Vy+1u56M9DFc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791578852; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sE3ImJEOPRkc/HYpC85TSicTuBVRnOfyTpenOBvBOHg=; 
	b=fAKGNR106UAVn9WmW3sP8GLpSHsA/RQ+pUg+uDvg9WIeINfEHT3ag4tX8vDhUNYuTKGoZ5FXZWq/wUwaCarl/85qfynH7cOA6eMg8FGMqXEXRy2+XLv6rZ6hq1S82IpyWnTOhCxS3v2SyHMeURmmtByVxxeXp4I7aTtem9WU//k=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791578852;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=sE3ImJEOPRkc/HYpC85TSicTuBVRnOfyTpenOBvBOHg=;
	b=LYnngFrwWVPkKCP103PsnwZVUn6Z3+A4HkS+AiqSCO+pMF54C0ziNFMAlwmxMCT1
	rACCKLILovhXopQNXxWuVxAmyi6b/UmGFRkT2OfLUFC6IzHIb6qQprsP10OJ1uABNK2
	eEUgqGlF0uGWmduYJah7ay5zLUoRntEn9ykmd5FE=
Received: by smtp.zoho.eu with SMTPS id 1791578850588908.036980551438;
	Fri, 9 Oct 2026 22:47:30 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject:
 Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Fri, 09 Oct 2026 23:47:12 +0300
Message-ID: <179157883283.1984767.197370830818786811@iav.lv>
In-Reply-To: <20261009-venomous-carmine-locust-f788ca@quoll>
References: <20261004191042.143713-1-rosenp@gmail.com>
 <20261009-venomous-carmine-locust-f788ca@quoll>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I sent the fallback form with Helios64 as its first user:
https://lore.kernel.org/r/20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv

Igor
