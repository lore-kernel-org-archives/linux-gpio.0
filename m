Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4D48032C
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254756; cv=none; b=EDoSy+amAWfXiA60w4NMOnePV6/Lk7Qvx2fLagvBXZu0T/mlt2FpR5W2syzDK7d79RESKCpdQWzQEfFhj7MceZXugjPWFhk9lq0jcearUt5mlz9x0RntgViwR/oZoiaQz9bb8SX3u7lF9rq9dLTL3wlySYUfkYyF+EWXTFPBm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254756; c=relaxed/simple;
	bh=saaJAsHl1r1u7VWi/mwJDLeoO4wgnHrHNat/fSaqdRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDn1jmDMA9BHYVsijb50BRbb7vapQyI27UBG45v5x+krteiN6pctOYr+bAG+eYx/YMzPfJhy2Cw62he0oHpSk7boI1kWSqigTsU1Ewhx9uDYcotosItPEB+GyzON+/kjUy2fMF59r1YKgo+la4YCTmF2EbIC6R15kCeNbDma8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=LEcw1TG8; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="LEcw1TG8"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 9j2exBOsldVTC9j2fxSpwD; Thu, 24 Sep 2026 14:59:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790254753; bh=saaJAsHl1r1u7VWi/mwJDLeoO4wgnHrHNat/fSaqdRs=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=LEcw1TG8ZiVudimjNmveOmvS/l0T3xfXyQmP5/Tv5u2ctzvPxoyhrN7sJ1lsXw3cE
	 +154sf/YTr/v92YGoucWpC0rZ4m1U59xsw2QwSJkaF2V7MNbMERh7ZIhjgCPcWZTY1
	 va5eLcSxbdHt5PwZAOjoxUMnHHwFtQdheNvSJV1E60u+mrS4Vu0SRCciAFMZwqrND8
	 B0Fmf6pv3DzqjaNkv+wTWUIpCE30bUB7I/DVFRcf1vypnA+0Eih7UH9hXiI81XRTS+
	 RLxv1JSG0vS2gLKzFThrMjXaOUpVcKgzn7yMa3h/DF0UZOE8IO/ACt7JnZZkVzRUlu
	 r9ku1OUOgg8tQ==
Message-ID: <85e1e7ba-1b1a-4f27-9931-48966cde7de3@enneenne.com>
Date: Thu, 24 Sep 2026 14:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-5-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260923182243.41060-5-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGKjO74BqyaYtiPPREZI9wg/8H+XkcPHZgLGrTkQ8swRk6uoTWQ77W1O+rNcw3H/Kc2WVsSWgkwnCkeiktu5Lv8fEWyNszc0zJ6iXST/VK0YeSBG6IkI
 JDvhlwt6MbkGfvxA8pizDkaKojo/MrfksrU4yyguQLhL/iqM8BbwNBo/MoFMpKZFIDMp4+Ni4We87Glmr/TOZ1SpzXI9ke9Vt8meJCjokLrhOmBvNnjRPNui
 FmnzYWrQ08Dp0RqQxS0qURIeZZY9WoAWFX1UsfrI/+PmVkWag8DM1lcwqJZ/nSBs/VgVrXTuA3hn3xObYyzYZ6CEdbeS3/ozIyv6FLRhUWIAyrrqHO7Z4XUV
 b18JM1b7yeGjFZZvkyUGlV+FsYhqeAtC5Gn9wJL75GrlcLX9N2a/r4J7zYzuhK2A0FU6zZaEvKKEHHehHqx3zGF6jXwpKxKIWDmjE9CjNDItgnCWs9mZAiBV
 HXWwFafkTkVGEtGXpnB/ej+yss34Vcv2oK5sCAAh8tYkbRcnBro5uA1ltjeBdFzs4mNzFCiUzIDU0pbIimPPdgTOvhNfbgyNTf1GhA==

On Wed, Sep 23, 2026 at 06:22:43PM +0000, Eliav Farber wrote:
> Convert the pps_register_source() failure path to dev_err_probe() too,
> so all three probe error paths that share err_release_pins log the same
> way. This path already returned PTR_ERR(data->pps), so this is a logging
> change, not a fix.

That reads right, thanks.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Ciao,

Rodolfo
