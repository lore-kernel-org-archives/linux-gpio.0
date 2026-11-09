Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214978;
	b=m162zC05Kvq3BhmzobldfdKbf24s/bFYNFtx5BNYmuKtWXPzRleUzW7PW413hul/279p
	 4auHvCUGmX3oorPbexckVDrnWfa982uyJy7R0ZQLRBIyfDUkK8P+o5Qs3zh/u/PGbJrOk
	 4P+mXY2EvhRPSSuFsnhAaHire+43BaOHM7oD0k4v6Usqrer09hX+BL0e7CZ3BwErRnF5d
	 NKO1ZgSSLzlHmDk3jAs60G0nTvAnk4xTay0QAIrsLaoF/9LOyGwEVw1j0mowSwbpBgUrf
	 WpOdqfTdnGE5oUpBH/HOKlazlgjaYlT2fgEq0BNdM0bdFlxkwvihMUjw8kFj5nvmPww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214978;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gNlmh2llWKKTeAhOYoHNW44GCe+l7QWipVqzfZvANdU=;
	b=d37Ky7AyaGp2jYYS1ZAjGTKNKrrPUY/uv8fxVZpsxQ0Ac3wjv+M49i4KoEKaN6D8Eu7A
	 G44XcLLTcyd6F3w0NsfA3Cm0+F4XgjxN+jmbhNAw+fRRXX0VH2R1MLD5ujTQaeqeBETEJ
	 y55WOug2HB6ev/4JSZTtOdIH2dkf4B7InQkjy3nQBP1PS7YdLDY1UbWatJB54t3gC9CrE
	 X0iSogmOLbPSnZN5aXENX93odW21GY0GwaSkxcda9SDg26ipQFjbRggI0u9gOr3d5TleL
	 9GrvaljHz5g3lvR4ibRQ86jS6bKQfoSdMUxfxNieexpEP7D7BZ/Ev/au7ohKekS5I0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnJbBNPg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0F6ED606A321;
	Mon,  9 Nov 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnJbBNPg
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D713C1F0089F;
	Mon,  9 Nov 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794214977;
	bh=gNlmh2llWKKTeAhOYoHNW44GCe+l7QWipVqzfZvANdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EnJbBNPgckCmdVYlFS9j0n3W9X7nvgm6E6pslPU0TzY3K36zuLdo+IaNXbRxBJy9W
	 hptOzTVHl2gIQTzhZ+0a+ddQvy+R6ppWreRZbIEs5om6d8azhtv9xBxkr0NxtEDV+6
	 y/OXD5twlPJLjlzwoaYMmy0VUrQM6NU34pNooJ1gjtd0QHq63c4Ca5ntIXpdn2i/uL
	 xFNyIoi+TPhwUiCYvof+IooJqyzmgMh8XS57eO7ga8Zkxln8ge+G7zT42rDw0gSQvf
	 9SQk5PlqeceTv3haDg/hC086dvTOLZMtQoU5R8aky+JM1n6oJe6S4tHf+iTYNjOOCt
	 hEy9hdBV/VuyA==
Date: Mon, 9 Nov 2026 10:02:54 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] gpio: ppc44x: fold __ppc44x_gpio_set() into
 ppc44x_gpio_dir_out()
Message-ID: <23fl3cv7mwgimgxttbpkwrzhxvckbkjaj7aojxdn3fhe67u7w4@2h7n5pot5ho3>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-4-rosenp@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104215959.24035-4-rosenp@gmail.com>

On Wed, Nov 04, 2026 at 01:59:57PM -0800, Rosen Penev wrote:
> __ppc44x_gpio_set() has a single caller, and it looks up the driver
> data that the caller already has. Open-code it in the direction_output
> callback, with a comment explaining why gpio_generic_chip_set() can't
> be used there: the generic setter takes the chip lock, which is already
> held at that point.
> 
> While at it, drop the pr_debug(); gpiolib's tracepoints already report
> direction and value changes.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
 
Sigh... This is really just churn...

I'll take it with the rest of the series as sashiko doesn't seem to
complain but this time would be better spent elsewhere. If you like
fixing bugs, I can assign you a number of GPIO bugs sashiko found.

Bart
