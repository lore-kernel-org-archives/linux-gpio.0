Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1B3F23DB;
	Tue, 25 Aug 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650640; cv=none; b=XmRDGMnQAtxjnSaoilLUJ87fSJ6WlvcDLAJsYq9oBdPcwhyLNcxtaKg/8oQOywXZqOM07P0d8lhkVSJL/L4V1BgbFYxrHey+F9vWi5BxJg+LoBiyb5og0G6YZJ9ai6lD1UWCia68OLniS5LUP31f6JQDDpPpZDGH0XZNs41YVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650640; c=relaxed/simple;
	bh=JP7xqbXEeyMQB+PoZed1yWpt7U2bgHyl5qIcJpMCbvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rADlk9nu7Af9r1oI+v3qL2iy3XxXVFECi8l62tJd/hMwnuxb/P+BXzpWSBSWqyR48LuTuIiEoqDglwGlrarw5riP3HUXOZG483PVLB0e3xmcGxFpy5liTpEwvPZAignpRsa4l5Vo4Fo/A3oOomKbWfPTkESWhSpMuJ3B5aPNal4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=kzZeAh8J; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="kzZeAh8J"
Received: from L23574.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id DD86A78035E;
	Tue, 25 Aug 2026 11:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787650630;
	bh=JP7xqbXEeyMQB+PoZed1yWpt7U2bgHyl5qIcJpMCbvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzZeAh8JH5pg0Ey726IDeTPD4UjG/uI5hhPLSKM1eLxVglAgQ5uuqCxQPfqDdYK9f
	 1mzLBs4SOPUCZCrhUAjJ7UX3znnc3ZeCX5sMepkF7t/L4KiwKAHmutfMlZ8wiQUYM9
	 LyVaPN82fW90FvkC1Xfg+7dHE12vW04MPF6O4lHcdnYj/zC//5enbhcPjnYKFEtO7Q
	 rXAqL9mNJ2wguA/HZjLNPu2sWt8Hkogxfs9kR1d9OItsIpqfdImqVdFZZyRpQPQ6B3
	 WiRFGfDTfmh8CMssrA6+iYNmsZraLL0daecNqM8k6Cls1RN9XrYzT0AnkbSLirHfBc
	 zfI04lPgNkgKg==
Date: Tue, 25 Aug 2026 11:36:58 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog
 child nodes
Message-ID: <ao1iOpmV1tWGM43i@L23574.iliad.fr>
References: <20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr>
 <13423320.O9o76ZdvQC@steina-w>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13423320.O9o76ZdvQC@steina-w>

Hi Alexander,

> Shouldn't you reference gpio-hog.yaml schema instead? This already has (among
> others) patter and required properties. But I'm no expert on bindings.

I just tried but I did not succeed: it seems it needs more rework or a different
clean up for all the users. I guess, that's why none of the in-tree bindings
does it.

Maybe it can be revisited for all the cases later on.

Best regards,
  Vincent
