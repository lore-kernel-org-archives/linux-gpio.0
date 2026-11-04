Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800835;
	b=A6COuQxSuhsvCsm/U2vu52+X7XKIaefEexFtjast1trGEi9qLXxSwigrUxaEg5d2tib5
	 MaEwFpu7NMe1Cpvre3ie3HZIi6LncYMtr/CRubnYaJPi5SN0pjjBupncN07Q87j56TA4G
	 Gmu8NQTMr9n1CjEilZWHfHeEEwgWMizC/YgXuIEz6EhiTPWjy996gjsuYOQugoaXroI1z
	 IzO/JBINzdx/1cl2ZtERuA2saAq5n6VvBJEyV1coOiJBlNjQ0U7giXYgxm5Otkl/9Sd7N
	 ydcLejyMw1JA8B1oIyK1X5yM0p+5r88PIwsZ7edUgPerhwRaEgD9gZWYQfdQie8TNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800835;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iPigMUabbHSIXFqVjqXH7ROjsbJTDridE8z4I5YTRFo=;
	b=jyBjSgpsbxELe+T8yv+hJ1jI74klLPU6n8T3MuI/fOfF5tvvxqasJ56I5uK/1U5LS1Tv
	 UfhywYxF+j0MUegVXWRQoofH4ioO8wd/dA4tr3HDLSEWdF+AQWSl9d+gZsdEWA2d35yRl
	 LHUL/QKWnCJ+LZLYPlzRNIjEtY5jJ3jRbd2q3ixiJcCY0fqSm2ltybN8U62mRzkaO8ZAA
	 4oy4bVTyWdlknoM7ba3kSXEgs6pXm5LH3U434BV6vYgGcAhhR+CunNZicKb+WSIbsNrln
	 p7h4tGh9AlG6i0iSJ0uYmZ2JLzIu1co0T0NsxpK8iyQnw1g7mYWvaD2DDD0nUWOGY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0ITpOoB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id D7DB3606A330;
	Wed,  4 Nov 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0ITpOoB
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C98FE1F00919;
	Wed,  4 Nov 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800834;
	bh=iPigMUabbHSIXFqVjqXH7ROjsbJTDridE8z4I5YTRFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a0ITpOoBNpVhRfI8Zlb3slBKPPZAU3+taADATt1ctlULNxzFp6yg2CbRkzpG1Sau1
	 /peJbWuTaKs/lP5Hfcgsq7M79PvauS7X/dcM4+AA4DzxaJOdy84twILJvZSKvCAvZJ
	 9Cxbxhv0H6ipDZKK4tZ3Oo6QeX9H71f3X/CqVB0ZHLftH7j2GQ7frAQwy1u3pENOJ+
	 bdNnK0gREuZDP4MSQAK/7KA+/4iRLXkONbjjeu+CPg+P/kVFPp1715h7WZNlksgH1c
	 1w71Gutit58CLRBi02V3wzdnN0cxVEcpAnG6kC7plHUz20ahhYZV21hz7PC3U2RBTO
	 Sz2FwlvY9UzuQ==
Date: Wed, 4 Nov 2026 15:00:31 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <qabqccchlj6rz5tki6z3h7py36btm6nepdvlcz6vgbq37enfnl@ez2jmldpo5mz>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com>
 <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com>
 <sashiko-outbox-195211@kernel.org>
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
In-Reply-To: <sashiko-outbox-195211@kernel.org>

On Tue, Nov 03, 2026 at 12:03:28PM +0000, sashiko-bot@kernel.org wrote:
> 
> Should gpio_device_teardown_shared(gdev) be called before
> gpiochip_free_remaining_irqs(gc) so that proxy character devices also release
> their IRQs via their notifier before the remaining IRQs are force-freed?
>

Hi Adrian!

Will you address this in v6? I think it's good to go otherwise.

Thanks,
Bart
