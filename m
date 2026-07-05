Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898F1D130E;
	Sun,  5 Jul 2026 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244090; cv=none; b=RPpWfIEOMFwsMd/qZxDv4WJoCrpxHBEYfsRC7MVndfDJiOx3gxpd9g9/RkJpxd1uybe5wQTlPHd9toJmb7uOPNGZsfBK/U9U5u1RPAQg8GmXA61mJJ1yCq0oWxAFfILGlVO24y6bzdFHN1hICCos8MQyl4lI7mstjhWNthxnJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244090; c=relaxed/simple;
	bh=S7jTigPPvFJRKU0kx15uSmH8rCK1lAN/BXMZ4I+qnvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SowOFgm6o5UZLN2MJCqktnU+5Es2aVyFRwPttTvHGpX54u2mPe38r2i6Ewp5faIfLt1wy3jVwrKCQLhFc56mlTz3PNhuW3UfZ2D9jqb01JDUyFxW8kx/TD8BIWC4JxkazJ73cl2H5P171jHTjemogTfrH8rF1isYt1a8gyvRFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhjHqGtA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhjHqGtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091621F000E9;
	Sun,  5 Jul 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244088;
	bh=S7jTigPPvFJRKU0kx15uSmH8rCK1lAN/BXMZ4I+qnvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WhjHqGtANS1NzUFoOstSLpieTdPwUh25C5prUfV6qvgVRIHyiKgaJLg+JjyJv4mrG
	 pMUj0aIggqyKhf7mfD+qLgT/v/5I5Ct8cVaWy+1sXRHYcdDO0a3u4Bx+yyEN5+z1q7
	 EeTbAEWBSu+696HfHhSKYQ4UGscx6pISAwSMvy0zn9lW+fbvuolAJiE5rFFjDm0UEP
	 Ky3zhARzrWRcAPmqTULYjgHea/guUNSZMj+OWdOnNPrHviuc6UDgwU6rX5k3/4aVkN
	 6z9NY5tU2GuLSmrPFlYy6+yDDGGIzl9Wd6GWx4g+1PnjOyNRbNc3mw8cwn5AunpMxC
	 Wcra8sT91h5Ng==
From: Thomas Gleixner <tglx@kernel.org>
To: Liang Hao <haohlliang@gmail.com>
Cc: brgl@kernel.org, haohlliang@gmail.com, hoan@os.amperecomputing.com,
 linusw@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: dwapb: Mask interrupts at hardware initialization
In-Reply-To: <20260705074759.47863-1-haohlliang@gmail.com>
References: <875x2vlpjx.ffs@fw13> <20260705074759.47863-1-haohlliang@gmail.com>
Date: Sun, 05 Jul 2026 11:34:45 +0200
Message-ID: <8733xxlqyy.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jul 05 2026 at 15:47, Liang Hao wrote:

> GPIO interrupts may retain stale state across warm reboots when
> peripherals remain powered. If a GPIO line is not explicitly
> configured for interrupts, this can result in interrupt storms
> due to missing handlers.
>
> Fix this by ensuring all interrupts are masked and disabled at
> hardware initialization time via the init_hw() callback. Pending
> interrupts are also cleared to start from a known-safe state.
>
> Interrupts will be unmasked only when explicitly configured by
> userspace or kernel drivers.

That makes way more sense. :)
