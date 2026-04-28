Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AEA3D47A6
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368721; cv=none; b=SRrD1Kv8h6ykadbsVM4SZXt2oiOs3eBf45Bq+WQ6m+a2C3YmoLcvAuf20Kx/IHB1eHyzBa+uISnz8LKZBK4Zrg93ai45A/4MPTmi7hjGLH+Y2DTV1LD0fCPKUZxxRzjDuN9eAoHWGlKshoT+S/j5BIa5WlFpfv4MbekuybmnfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368721; c=relaxed/simple;
	bh=qseaOoxgE30N9aoiBtgI2SdD0BLW/ZwaYr29OrB4Gmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSxjP1DU2s5PAwZjufB+/8Q8eJzMfHM+Bhsrex2dkGWXWPtHc1IN8a71B/U5jDOw8z3LVUahYF7XIbzwIMVwppVUAUNeH6VW1ktmXq+NGAXY7J8s47n79UnVLYD7NKiTRa8I1Z3eH3yt54qA05O3eLhYJ1VljZ9YnRNKwoolmII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+1LBpPe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+1LBpPe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15F5C2BCC9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368720;
	bh=qseaOoxgE30N9aoiBtgI2SdD0BLW/ZwaYr29OrB4Gmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S+1LBpPec0Gebhbb8PFljz8bFrGBCVs/hiiuhSMNHdjOVgKaWZxQIgNTIIs3yHI7y
	 xLf/OGOyyUfZpiUgVgyWdhefzIpF/C1rSstsIDtGBtlatwfyKWYOPm6ER0vK4fWHJN
	 KLzWR0zAqPsVSOxROxFXSP1xMrnJaXDokRWUn0bjtXEjmsPLmMwO0oD+DxJed/8hcU
	 ArK5ad+NM2c2ABGebSQgsPH3sHjLoGhmSs93cNOlUJ2kFsR8J6K4JNNn/PJZb6x7fn
	 1b34TuydZbrVpbIwaoiSwWbuEWxyYZ/w0TPLpAomDvxqZb8TGBYIV8AioEVLNS7X7h
	 vhCiQzQ5M7tsw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7d984096so123502121fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:32:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YwjrZ0QTTZgEYj+yTEXp4watUEldF+YMtMzTRu3B5mHVZB1gZP9
	Q71GVntQoOGp4ufS0RsrmlS2zw4kixcnNzl1HeyI1IOXPZkBinxP9zeW5e44yPn0a5KKHUxt+lO
	304jh+eaX3dkSu1oCYyigN/TE7k4+IGA=
X-Received: by 2002:a05:651c:4355:10b0:38e:9ece:61e9 with SMTP id
 38308e7fff4ca-39240fbfda2mr5696631fa.25.1777368719515; Tue, 28 Apr 2026
 02:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418191125.26925-1-yashsuthar983@gmail.com>
In-Reply-To: <20260418191125.26925-1-yashsuthar983@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:31:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvObGOyHxhXUoDCT=Y-_vwh+aTgKBcSitcyi3OFcGchA@mail.gmail.com>
X-Gm-Features: AVHnY4JUdzrEru4XnqwErNsjOsCEK0FAbjeu9kPrx-t3z5GWgyv90MtRVCqWCdo
Message-ID: <CAD++jLnvObGOyHxhXUoDCT=Y-_vwh+aTgKBcSitcyi3OFcGchA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Use kmemdup_array() over kmemdup()
To: Yash Suthar <yashsuthar983@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 9:11=E2=80=AFPM Yash Suthar <yashsuthar983@gmail.co=
m> wrote:

> using kmemdup_array instead of kmemdup ,as it is more
> readable and matches the intent of the api.
> tested with w=3D1, no new warnings introduced.
>
> Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>

Patch applied!

Yours,
Linus Walleij
