Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABC47F3C2
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254746; cv=none; b=TSEWZj4iOOjr2RCd0rsCqlk2PP8G3pxZZF7MPQ5wKbITYV8YGBlY34/hKvPs1+97ZUhN7Q8H5ehtC3T6wLVBiU2NCDeOw11zs3r2FkN444WFbZU5RBncOCXNO7U+ql2mFbihkS+KtXL+ynG2ROE/pYO9YtW0GTD/jPCI/VYm89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254746; c=relaxed/simple;
	bh=sPlY08+1MydHk5R27TkH5/HB2uG8Nzs5h0xgJDoi9NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLfB9dsqWAIyfdhm+5tXvpEEAUvYBEVV2VGTBSQnw0JAPnmitPNT027se3Ih5ThRFTefOY96sjSHZVtbp8cklsVk1KRCUHb+ql3Z3ibBzWMzkMYjbbkmMZsLV7kK6wM/4oRXE1/3hzzpVcw/Z4SWm5FUY61Uw4UJx+dn0MzdIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=ARPfU4ai; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="ARPfU4ai"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 9j2RxBObRdVTC9j2VxSpp3; Thu, 24 Sep 2026 14:59:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790254743; bh=sPlY08+1MydHk5R27TkH5/HB2uG8Nzs5h0xgJDoi9NA=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=ARPfU4aiSPIdovvPmHgUiAOL/9YvN9ts1xlwUfnI6rJZ5VH3YWxovCLaegMNBQasX
	 yI67m1PwG/u3p+srN2ooQ6S2kQTdyhSahCrMIVLEqBqzPbsg7Rj1gHxs7YwGudSXT7
	 iLSQnQbcl2jpSyfisIFjrcJnBgCGSFUMKcZ8fAkWiRy4WGdWkiMJTtJHxuJ6oUWOyy
	 S2uViC1pr/f8cmlerWzxkICDKBLuoWx5iXrNSOPUipA6JnF5mJo3G34B7luT34tfxL
	 HvKXHMHu8roVyYrs+4ikkr4YEZOTl9CqUqegTIRxyF5Fh/HcuPYR5V/kMGKPkixLis
	 owR+66sgXjPqw==
Message-ID: <23379767-d7f6-4c7d-9740-93febe42efe4@enneenne.com>
Date: Thu, 24 Sep 2026 14:59:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] pps: clients: gpio: only tear down the echo timer
 when it exists
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
 <20260923182243.41060-3-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260923182243.41060-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEnKXyPnZEr5ACl2iwKnFUQu692yFwfJ5Jw44FXvQMRf0pxjw4ut/bYrPENZ+FniWl7yBL5UQpQ2NdkBkrrU+DIijPGyFKfquQAb8K3CTI9y/jFa2OEV
 rhNhBXfZ9S6A0IwW3Z3fQZe+jifolHzPaseORRmDyPvZChvQKCqO5yDymDcYC58uJfg5kmAYoO7RFSehzhKGC0X4Vu5P8fPA+9/xQ8dm+h4e9Za51gPS9LEi
 KovaDRXudrNaCwKglwRlgtJXX9ocp8bgJfi3rpsHBGXkPAv11a5rRL0S8ZGwUb1M0d28lK+zbbOZxNNkrUjPVaHoziVC9dbqu80vdBqqm9Y7vFwSZYzYCG6C
 F0aBCQ9hjDXoDBYiwwZ+38Q2u72uM1vbOos3avx5F7NkAqCI2Iy7TQZYSauMnZBIWxm1tqXdbX/FyFWfvQI1bxz9u/pXzCCq1iYTDH7mWW6Y5FxjaqFzNzcD
 z8UA3t5XMRzKFLqCcwOUVR42ijXxijAf4z6qcKVEacPdk5ePWYzh6cV1MUO6VSdtYWgUkMsB89TLD4V7nTu4ZSnqbvdzOmJvniiRuA==

On Wed, Sep 23, 2026 at 06:22:41PM +0000, Eliav Farber wrote:
> remove() calls timer_delete_sync() on data->echo_timer unconditionally,
> but the timer is only initialised by timer_setup() in probe() when the
> board describes an "echo" GPIO. On a board without echo-gpios the timer is
> never set up, so remove() operates on a timer_list that was never
> initialised.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
