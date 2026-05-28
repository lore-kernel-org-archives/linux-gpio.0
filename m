Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37A26158C;
	Thu, 28 May 2026 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934840; cv=none; b=QiMCKAQuItNfWfkCcmC2+o9/AQypf+qBzAaJwH64+V20EQR/mqJOifbdbHVG9YuhQO/LiM4GAtdtwutu65KXKU5ni5v6VNozHOD7T/Z6AUrhfM+dtTh8pxz/NYxZWEQH/plqo0mz7OsqYd5IoNjfCkbNaktj6WW5OWnXGWYShuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934840; c=relaxed/simple;
	bh=7Fp6b6bUG3ZGebC3cdlW3AC0LXqycyUvc1huDyPIzFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl54BkJFLMComayX3w2pJpTgRoJD8l8jBLL/wzNHnVxikD82qTsiFEKs5lrkY7udDbT8tqW1607JlQrqKDgobKDenhn450nduXpUO94/gr/lgrLOmayCi5qgd7JcBYlvx+szbddQGWXfcBvI0WQ+a+cJ/Y9ua2fRXoGaBRCpUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbxeuozG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbxeuozG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFCA1F000E9;
	Thu, 28 May 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779934839;
	bh=SkQAGEJ+0mJpsenxrEv8nn0/fOuvPHd8IGHv5d05r/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbxeuozG0DsUWC0gOw8X4Xxb1msIFUmGuN78TPNQaQlQehZVOiLXFEBipQTt/sXJS
	 uYH/uZrTcb/FR3666C9WDQAqoj3+w1pDoEWVTtiDFx701Oen8ZLfql1tNli5vZrR97
	 vFQ3xxeMU2Yrrtkndz0uc5peN5OvX99CrZ2ZMtghPzrnJdMwz0xNALVfEa6+KgFpWm
	 dBEWbtXExz4CMVicTKCfLpda4FbkTn7PqPFTEsNGvu1MK3xmhhSCQWkxA3s+Z26O2Y
	 lCfZ5SKrDSaKrIhal4eQD0+JS3ewbwwb/kHe1f1h76827R/ExyxzhN1tVpGRuqi8ty
	 atch8uDjo89ag==
Date: Thu, 28 May 2026 02:20:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] gpio: cros-ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <ahemdIn2aOc1y7G5@google.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06dfc8d1df46467269ee6113f161edac234e51cf.1779893336.git.u.kleine-koenig@baylibre.com>

On Wed, May 27, 2026 at 04:57:27PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and use named initializers for
> .name.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
