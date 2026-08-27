Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0A43B6CF;
	Thu, 27 Aug 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824496; cv=none; b=QKYW5BsV0Txq5KuRrK5ar2JlYaXMmCi+lK6dLZ/U39qfN7wQKjo9PnqT18pcaeQKG6xKxULAJTRz+7r6Rc98Yw7jhkOoonwTJxZ/6HoqnEEOLGDkD1hNkBHieXz0pNMka2tpR2nB3ee92L1Md5khDHDQ0UNoitAGJ05TilvfVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824496; c=relaxed/simple;
	bh=w1bkikBf+IKJSPW6/ZujPpK37TNZBzptDmVExH6SynU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMzf+WBtGQsCYD0DEUVuL1EuPhTg1Lf4UCWtE3QFY5CBRBVY3oUUf0kyKFQnVTSmX03Rfn70T5hIWEvNAN9KPzxvTVdgkMTh6+i8Kzg6+m92NUXkS32+9S5GAbZD4oWgB0zQEWaevR3zkT+bzaxtNXPmEYBtgSOdXcnWMvo2exo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2uRW+EM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2uRW+EM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32371F000E9;
	Thu, 27 Aug 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824484;
	bh=yusfDokiZvMdrjThk06tvWRNNA3EDLeCCPdtJ28SO0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2uRW+EMl1P35+KxwuVWTeHVq6Yuauuk8sB3t6OsxcQ5eGlJqq4v+yVhQG98EoILa
	 npDznAd9arH2iF4OYObygou6/gLo4Co7um+vKslCcGnOftHpxfKO43xKOmJvzZej6Z
	 rN+/mj1bEeNhWeBWlSzGfEeJ1DPN4B5lQc5nj0wZr5dORMo/kTO8Ykj92VKWmv+cf3
	 U4gf32mICS30SdbZ8hq6OXwX1nlw/Xm+CCpt4fT0wNLnjpmkMW8XpSbwthBZ30Sfcf
	 LJangxA+6piOkrKftomrlJC3uXyMjL1ZTUeNfrpaztI37ovC2bbbiF24ccO1KBowry
	 Fw1YYnSPpwEfg==
Date: Thu, 27 Aug 2026 11:54:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: misha.zavertkin@mail.ru
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Message-ID: <20260827-bulky-popular-jacamar-198b6f@quoll>
References: <cover.1787209558.git.misha.zavertkin@mail.ru>
 <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787209558.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787209558.git.misha.zavertkin@mail.ru>

On Thu, Aug 20, 2026 at 02:14:09PM +0700, misha.zavertkin@mail.ru wrote:
> Add 'gpio-ranges' optional property to reflect driver changes.
> 
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>

SoB mismatch and checkpatch warnings.

Best regards,
Krzysztof

