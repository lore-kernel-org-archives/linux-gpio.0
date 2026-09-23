Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2344C4E3
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149857; cv=none; b=eH7517B4925Z2uDBYP71pUk1xbsnIYVQ9z6RTYZx2CCMEyRRWQxykXWVq3CoFjVc5HdyDNe6j/8BD6lSaHy/rgy+FdLfGKLCFI6Wx/PDfyBMIWFtnTZv8ldxcBwl2FPja045yIZEmZ4iUyJjjddM0zhopqOuWic1t5u+IDDmlxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149857; c=relaxed/simple;
	bh=kbt7APN66sOZaq6zRRM4c0YwoQfRKpH1vnKB8xYMma0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEJuamlUsxuIF7khBAtjuBEvv/Fo/nUVPN+Rtddhg5Wzpc8Gio8ZgQBodWpsP4B3qiLXnkbe2MCefNSmWuinwMc9HjiAGbK8CmFZjA/em7U5CP+rQ5ipo/84r7aN4sAaHXdVdk/gci58me5YKvn8um5/H8FRKy2wlrKL5f6ftwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=jxRuuqXd; arc=none smtp.client-ip=62.149.155.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="jxRuuqXd"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 9HkYxgVg0Bm789HkZxkKtp; Wed, 23 Sep 2026 09:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790149845; bh=kbt7APN66sOZaq6zRRM4c0YwoQfRKpH1vnKB8xYMma0=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=jxRuuqXdiVqPY7q0i1fFsGhWAld/L/5PgqH7NQtoSXDR4/BUuJzfayNVReF12vowM
	 iwbiypRN5hArBJ+/sEcOFx1nyNWQyyN6Yl4noLcYsyCLLgNSusDTj/gltFFe4h9Nsq
	 h0s+OvTgGf1P8rUbZfjRl7Pa4UpGR0OA+oB5NJMx59FliMBSDv5awFw1/eAg7ChaFD
	 bpVzI1f04zVnHUvu0kQCjsvQMCdlA4+WttcXrGWAJTSm8d4iHZyy2qg9YoTQgBdfug
	 +VzcUW6sNVi0ISLw36rTno0u4YaPo1cyHfjBHknlgS9NbMQwWw7/tWaDARFMdyUTHT
	 1IsO/f5MxDr3w==
Message-ID: <5d3fd16f-e2d7-4d5e-98c7-807dd0aa3eeb@enneenne.com>
Date: Wed, 23 Sep 2026 09:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
To: "Farber, Eliav" <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-5-farbere@amazon.com>
 <d9a9ecdf-8e29-4595-aedd-e62afa7ebb4c@enneenne.com>
 <BY3PR18MB4722D28B37D2DBCF3DC38ACDC6832@BY3PR18MB4722.namprd18.prod.outlook.com>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <BY3PR18MB4722D28B37D2DBCF3DC38ACDC6832@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPMyqbJdaZuuzWa/r/ZYTMVQ8HSe4tRqnLDwTqBD4xHboHpwqvmUGCSFEb9EmcH+SH95vud82axTmxqwPwmDhqdwejIhsAmNGMwC5t9ABD83JOOuwt0o
 Mu1omzjzQATka8CFsW2QDR5yoloWCPheS7lS+FXlCvAE+XC1vS4srYJP5etyi43YS/Vivu1PFd9rfFxYBld+GGlinBRGbE+ckJN1pUWssc8zxmIXKoshD04c
 reQLFgf/gaI3EQFw/55HzIhGUfWPpIwVwCTU6Q4WpuhtkFF/CFkJirXjHiusTh4lz4s3u3o5w9N9o9OF33bdM6EYZQpMPBvMMEjxoypcuL56VbTPgAwNdKAp
 nSlXhxyq+xlrnzmhUBYJtF5geTs0j+ZPPhcepzT2kNHTpazpkXAle7LqShV4tOOvQE9cDicRvqM7nuM8nL7JI7UGuKkwc3XZVSW8vN/HRgQDe/pZ8s48msAB
 TWvJYUToT4YfyltI2c8iJaYW5FCyknXbNmQs1XhzpbQGeoCkmBtqH3UoC5kICGhPgmkyuTWkOHwEslzTA3CVTKJ3OEXyWMsZbXDc4A==

On Tue, Sep 22, 2026 at 02:55:05PM +0000, Eliav Farber wrote:
> Which do you prefer?

I think option 2 is the best, since patch 4 has to modify that block
anyway, and it's simply an extra line within a section of code that is
being changed regardless.

You just need to mention it in the commit message for patch 4 so it
doesn't look like a superfluous or random change.

In any case, this doesn't block anything.

Ciao,

Rodolfo
