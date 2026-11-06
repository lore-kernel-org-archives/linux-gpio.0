Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962230;
	b=GagFxeVQ+3RMIgGuWSUzcSe1W4nEG20TkfH3S4uUpTW3tVc6piCEEuUoHAVaTGDlZuLo
	 QW4QWV5SvyQ5Tm5fbcOOH64/PTOaaz4sISWA2VNGPqZcYVLcCTWfhTpUQYXI7RP6YSz5i
	 xxkj/vQvu6IucAlnHL4juCYHHs/m46n92xUUOe+F5xnYw6qvtn06WM2nbFbjTKO9pmOk1
	 c21DrPiQv7KFTERofcvZ+AvDJ9zLMmAgxNG21vNEnWCeONYIyM82i49WJJqrjCrnqXHdp
	 0mFag6HCh2q0HxQ2xXUmcNqvklQiKPabLP4jp26Ouh2X4akyZGi+MLZVFejWOvw5wSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=F3j0iHgsvVEM9g/FO+OCD0ojcpYSh6uoBVd9FxVq2l0=;
	b=m/iVlqOba0fbwLk9kvW3AjuK/wX+EZvbrmJdJu9MZ5J4zy/Am/yoA7nb0qGYXqCaGCea
	 CCuk7om7VkdFqgcYkgmzv3Wxqa9I5l5IuHrL67vN22Bk1Hem+MDerNOeWs83aUuk+9X6F
	 OY4qA2X/q/BeDxFDqc4/kCk7kHAGa7CP0ywTo8SpqFm6XWblqi5INSFuKtsovzhtwLnR1
	 oWcpqJKmZEGVUt0gmwbNOwFTC1Ife1wPSu88tFXmaxDD9QywUC7qqgXxrhFo6lwkFK/fs
	 RMvqwQcnKvez/20pLyCvL2NXL/xLhpSrIKVJcQcofZIkMhQS44h/UizjasgJq+qVD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VnsTGtAh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B9402606D81F;
	Fri,  6 Nov 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VnsTGtAh
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 718C71F0089F;
	Fri,  6 Nov 2026 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962229;
	bh=F3j0iHgsvVEM9g/FO+OCD0ojcpYSh6uoBVd9FxVq2l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VnsTGtAhSRzs7xTi91YjadjWR5t8/vPO/RM47Oqfj69hA43xVFGrxHne7Uy9DDKg6
	 qtGsT2GjJR7roX6U8KjSJpKgVErUqTAnFnqsSkbfUkMbBtZFIcIG4A0mymYfQ1gfju
	 3DKa7+wlxj9OEUx+2mBb+iZkR2W5hadY6weotTqKORoiSkBO61ZcaX74V5OpeprIuT
	 DOivm9wndqSF27jdZ64nPLdsRmDR9VaUkiOZBFFZ0TBf2x+0eCwn7h/npb/zU9pRfY
	 UXfjYZ0GjqEowYi03mRq2Iix4H7w3bqGAtSRM5UTC7kX3GFfoeNKOOxLfoK5jr4ck4
	 9GGNoufhzmynQ==
Date: Fri, 6 Nov 2026 11:50:24 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: drop the parent check for reset-gpio
 devices
Message-ID: <7n2raovkmf3obzq4d5fk3a4444oeyc4sen3vyqyt7r3xacgvrz@gr2kgob3kzod>
References: <20261106052851.2741296-1-tyler.baker@oss.qualcomm.com>
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
In-Reply-To: <20261106052851.2741296-1-tyler.baker@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 12:28:50AM -0500, Tyler Baker wrote:
> gpio_shared_dev_is_reset_gpio() requires the reset-gpio device's parent
> to carry the GPIO chip's fwnode. Once the reset core parents that device
> to the GPIO controller instead, this fails on controllers with a
> gpio_chip and fwnode per bank, so their shared reset lines are no longer
> matched.
>

Again: mixing up of the naming convention for devices. It should be:

"gpio_shared_dev_is_reset_gpio() requires the reset-gpio device's parent
to carry the GPIO controller's fwnode. Once the reset core parents that device
to the GPIO controller's parent instead, this fails on controllers with a
gpio_chip and separate fwnode per bank, so their shared reset lines are no
longer matched."

> The check is redundant: only devices compatible with "reset-gpio" get
> here, and their reset-gpios reference must already name the chip's
> fwnode. Drop it.
> 
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> On top of Abel's "reset: gpio: Parent the reset-gpio device to the GPIO
> controller":
> https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com

This passes my tests, though I have it in the back of my head that there
was a reason for this more strict check. I can't remember what it was
anymore so I'm fine with the change, if it introduces a regression, we
can revert it.

Abel's patch introduces a regression that this patch fixes so we should squash
the two, get an Acked-by from Philipp and sent them via the GPIO tree.

Bart
