Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF251FCC4;
	Wed, 30 Sep 2026 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790319; cv=pass; b=mLy0+MgW5eos8uACI9QrP1QQLXaKlRb4uPrLInSz7LxSBQ5RBbUccNCZI473I/iaJDPtxOaHQdXpSdoYb1z6njwuxCSigvvbmJCk/pppvCmKuO9g54LnCus+oRY/eVJ6I0GINL6c/sHLpvVCGf6ZdvpAF9Wo1+zV+x7Z+uHzQ7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790319; c=relaxed/simple;
	bh=xm/LrvrjmciUlteCYzpgBFYvLzYmDwzj0HN7woYJ+dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQ1DH6aBndoD1TaByfa9qLlMT1KSdltDCBThazfWrPbjaw68XsavC9nosbAt+iccJZTnM/wxF1vn8IqkMuh5NG4qUzfHBZH/LTuvczez30lGF2WsjPD9vE2q7b0FpAk7Zk4cw6RlxWN5hdifW2wOBXfnJwk2+GV1oK5T/BpMMXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=V1o/L9zb; arc=pass smtp.client-ip=136.143.169.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="V1o/L9zb"
ARC-Seal: i=1; a=rsa-sha256; t=1790790292; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=I0MKIM6EvaiZRvMxtmQFQk0YduexBbXEyUzA03GW/Le+IBvm0rFxzLqbicVssACxRilZ4th5rKCDOUxQznAQt5xWefZa3qpCz44gQ6Zv8CVRLI7H/3no3lGrLgCnnVvSEoM0KIYVS1/v5JouOPtCVHW747ItYvCHzArSfcTDX6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790790292; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CEYXFpgbUjEbIXpwwSLSc4RV4p6kNb/V3g390SX5p7E=; 
	b=DLNyluR5HUz5h2dwqhKzIFub2V4rveuTWnUjs74b0TL3WwLAvJIfzIpqRdi4QvoJA3AQnV4bzj0rTazeDFjUPIQ+JixV4U9sAsdzLTXA6VFQ/uhs8GK2JW8KdxGiFEkFiQCbRjH5vnZUI4q7F/L8UltdQWB7DSUXgOZD4koBmps=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790790292;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CEYXFpgbUjEbIXpwwSLSc4RV4p6kNb/V3g390SX5p7E=;
	b=V1o/L9zb0SsO7a9LOVglptaRbmurcNb4Qr27H/C4y8GfpPdciicbxzsMEBaeJu0t
	AGUAsU9FSGEXSLuph2ct/P84f54r6RzqaaVaXAxb9w8HDhGjiCkXPv4qSkgoTUyuJcf
	dLHe9tUsBoDT7IqgwHMUA9iEEDlzL/Ey4GvfSjQI=
Received: by smtp.zoho.eu with SMTPS id 179079029050634.44403786309431;
	Wed, 30 Sep 2026 19:44:50 +0200 (CEST)
Message-ID: <4c2e9db5-4dcc-4219-931a-51c9d06e9ad5@redaril.me>
Date: Wed, 30 Sep 2026 19:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] mux: Avoid use-after-free of args.fwnode in
 mux_get()
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 development@redaril.me
Cc: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, xu.yang_2@nxp.com
References: <20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me>
 <20260929-mux_fwnode-v3-3-9b3b9ae1334e@redaril.me>
 <arzY2haHccIweQah@analog.com>
Content-Language: en-US
From: Fabio <development@redaril.me>
In-Reply-To: <arzY2haHccIweQah@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alvin,

On 30/09/26 11:45, Alvin Šipraga wrote:
> I meant to suggest that you apply this fix before your fwnode patch, so
> that it can be applied to the stable trees. Since you put the fix
> afterwards, it either needs backporting, or the fwnode patch needs to be
> carried too.
> 
> You might also want a Fixes: tag for it to actually get picked up for
> stable.
> 
> Up to Peter though - it's a minor bug and the kernel has tons of such
> refcounting bloopers. As far as the code is concerned it looks fine
> (minor nit below). Thanks!

thank you so much for your patience, and mentoring. This is my first serious
contribution, so it's easy to slip on such bureaucratic considerations, and to neglect
forward thinking. Another tag I could use is Suggested-by, since you were the one spotting
the bug.

For now, I'm inclined to wait for Peter's response as I don't want to flood the mailing
list with another revision for a minor improvement. Should anybody explicitly request the
fix you suggested, or should nobody reply within a week or so, I'll go ahead and submit v4.

Cheers,
Fabio.
