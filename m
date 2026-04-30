Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1227739B4A0;
	Thu, 30 Apr 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542497; cv=none; b=YAViMG8aPugwAwBSaLCQ7+AZe71BC+6bOQ6LLR8RKbtaae3qixANBFk3TSpuf4k/gqmBTKFn29xKyR91ssCBWoS8mFAp/O85AnjBHNpyRZMufnFs6OhdPWqIzs2E5kRrF679s8O+YGyIod3i2sQvUtXbnHCjsRIdK6N/cfSCgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542497; c=relaxed/simple;
	bh=0OWPCl/mutsM3LHCH7mXg/ZrccUH1p9fIDogS5mY2AM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tt2JXpimCXTmDWBjq3FpDz6L6bxAc55ZWbYHT69WzBYloweGlO72KzYNyKWFPqzXoAEqe3w8KmCeDFcOlrnd6maVQAmEgOX/mveDVP1SD/Z+fPKmVTgcxq3ppQ/IXtZrs5LwZ/6+Q+YAwc2TKMiFTJOs/jV/x1tm6k6Wq8tkkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk7fPRhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk7fPRhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5691FC2BCB3;
	Thu, 30 Apr 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777542496;
	bh=0OWPCl/mutsM3LHCH7mXg/ZrccUH1p9fIDogS5mY2AM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dk7fPRhFuviC3mTaZerHrd60s4y6o9lY360AYao3pIKiYIkGTqI5i+2cIfnS6lalE
	 4978X4DOA6Saaco9sPFXTMlxZ5J4jSw8KtONyLirlB6+i7B8BKjFgsSYuGX3u2dou7
	 TtoPUkSQRUyiiuqwIrBz3BjpMGddT2gQHTzhH13LIExHkFuP+A0rtpF+DjLEq+5Kv/
	 GlDDSB0lT84s6IXQVpgO46acQgJM6R7QzNHcPeAsauAu+9oHZrG1WT6cndtVGA3CyX
	 OYSXVdTK+HcaA60mAomBWo9EugqB/XBsjXNm4LqipPFbvwM8r8UVzXBg8+0XVI1v92
	 L2NpCj0Hn7+eg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-2-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-2-9a1bc1b2b124@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 2/4] mfd: timberdale: set up a software
 node for the GPIO cell
Message-Id: <177754249505.2432539.2686885340680056271.b4-ty@b4>
Date: Thu, 30 Apr 2026 10:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 27 Mar 2026 11:49:08 +0100, Bartosz Golaszewski wrote:
> Using generic device properties instead of custom platform data
> structures is preferred due to the resulting unification of the way
> properties are accessed in consumer drivers. There's no DT node for the
> GPIO cell in this driver but we can create a software node with device
> properties and attach it to all the GPIO cells.
> 
> 
> [...]

Applied, thanks!

[2/4] mfd: timberdale: set up a software node for the GPIO cell
      commit: 2012c0d1b91767b68dedac127c3575cf816313e1

--
Lee Jones [李琼斯]

