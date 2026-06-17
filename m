Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7D4A33E2;
	Wed, 17 Jun 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712921; cv=none; b=iavKQw6D87P5p6zaJlGPskkvh2Iz37/E6/Z9BMXI3QltjIqO8+NwsrYM7gDtSs3fppu3fCfWNIqO/GBZd6ztou1+4XapxwuTSWo+BsdKFhxwtJwqz2TWIMFIZPY/WuszjBCXYLUDZTdlUnfrxRHKq2+TxOL9UDu/9LwwuzDJ344=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712921; c=relaxed/simple;
	bh=PJ8IxzpbhrapIoC9P+hRFPHsOQrg5Qc17j9A3yx5d2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0LgsXEMMiRxMIvtgVIzBDMjNosrc7UcV7RZw5RlhJTK+vixfI2pRBffgj3PPFl8AAQRpNvaZRfWO52aFuTv6ImXCOcc53zAI7Esf6DI9T3fu1ynfvDmPRRvsMONZWKrFNYnp9jNeOuw+FfDMd3eZK5NM2KLxu0A4c6iTlyZVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Diy+mwm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Diy+mwm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CA1F000E9;
	Wed, 17 Jun 2026 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712914;
	bh=zDk2NNmHbI3xWQa7eXy9sZ9mgo4GiwpiOqZdkAzZK4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Diy+mwm0SjUgtACjZD+V2BwuyrsmGtwF21b4GZhhoCHOgeOmqjv226x/nxUJKpKja
	 7SbOQ+Efvleil6LSQl8neoR8Kqv1J8Kk0VuWF0k98mNi2FkS/D3/F3B/uTz72gfPht
	 TkCtVYI3tHTjwFOThltiZ+6OeUq342xXPkzScN/PDatqSPd6UdV13VR389pXphDNLk
	 6Bwd1CvqqZasuYcvwWyxW2m7Oy1FiONBsMpv0YIznpt4akCUeMpuY7H28qmDrkaDf4
	 Z+BErb08oWufErwdY4MOZC6f4rG18SDEPGN4YZCpW0awmIx5BgN2uJxOsGqJIsv5Ft
	 aO0J4CeCyULxg==
From: Lee Jones <lee@kernel.org>
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
Subject: Re: (subset) [PATCH] mfd: si476x: Modernize GPIO handling
Message-Id: <178171291278.1675957.17499698111905767721.b4-ty@b4>
Date: Wed, 17 Jun 2026 17:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 27 Mar 2026 09:37:26 +0100, Linus Walleij wrote:
> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
> 
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
> 
> [...]

Applied, thanks!

[1/1] mfd: si476x: Modernize GPIO handling
      commit: f3f0acd3768dfe71aa6b2618dbeaff69f25923c4

--
Lee Jones [李琼斯]

