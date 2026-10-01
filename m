Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337149DBB2
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843707; cv=none; b=D7Pq002Ar7cqFzAF+IIHtouJZK955UncpRWrM5wrDyt3j93XBDfstnDHmQ3caVGBB7zsLnfYfNZ8MpGT5VzukCfvDpy5uAxV7SfZ5SmfR8kje7goNXOvkaQ8qHU2SjY8U+fEXVaPLhDxY1+F3PFiR/R+avFo1HB0cWkjMz5b65s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843707; c=relaxed/simple;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIY4EaB7QTFMYoBfJinhRWqrwTB0cgJcIWf6IDWJzxkC7+AjR6fGNPYRXun208z/eOeJMTiQssEBRPQWn68cT7AIToKxB6obdZ+RZ3Baley+OvGe3ai8J1pg3+2RzJG2jCw3DpsfGJNb3OF4pwPR24PAeON1iRFwbhWwjyc38lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3Slhvcu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3Slhvcu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E7C1F00898
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843705;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3SlhvcuQrJSyZoW9VcteJICxeUldHXylfc0gTU6cl9V9f74rwDXanedOzcCzlsIM
	 vswt64LHLMRnb8NHBIWe8gc2vmrkKOWVKRS50WGHUdmcOWc4zp53V+H+C4nVaKGVDl
	 w+Bt0IS+IF87pVzi8Xvf8rZEHU+gahzeTbYeUA66BZ+fVKM/OfEKVbuGt4tL8AqSkn
	 rMf9Laexa3+O37DxX/FCz++g8+RYLyck4j5xVNQmOJxFvjKFGzfCCtDzbLkSrFglKm
	 EvcOg29Wr+wBRsMF/lvqePmxLAiUdDkLgkH6xS6+gkFUOR9saE6Izx186mwo7itaga
	 4H1QiGn/AsfMQ==
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49499f845edso1759000fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByavifk7uy2S31ZkuK6jQrn+ilQAVc88Gj/sT6u5oOSYFlO/+wTcWJHTzBGNGWoaV3rZLt6VxiMw0w4@vger.kernel.org
X-Gm-Message-State: AFq9FYLwxfsZQTuZ2x3KKLdCKZEvGaiS++SKoRT0uBczYW5ZnezG6rpo
	3cWcIxgpXAdzEUzyioWvuZlFi2DRsl/eyJygJ0jbj2YBwSkcF3Bu1kMA1Um4Z+9qe+3aBvnrDbA
	hM0BdaN0Yzl8L4UypQx7s4op6ml2sJY0=
X-Received: by 2002:a05:687c:20d1:b0:491:88f1:f3aa with SMTP id
 586e51a60fabf-49dddd46654mr4533364fac.26.1790843704807; Thu, 01 Oct 2026
 01:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
In-Reply-To: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:34:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
X-Gm-Features: AclHuK8ING7eVXmVQv5H-ajPOg6LfXVJcEvYhwqQVDz3x1__fBSswtm27gPTJNQ
Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode array
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:04=E2=80=AFPM Chuanhong Guo <gch981213@gmail.com=
> wrote:

> The wf0_2g group contains nine pins but only eight mux values.
> mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
> past its end when configuring pin 78 (WF0_2G_HB6). This can select an
> unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
> from probing.
>
> Add the missing mode 1 entry for WF0_2G_HB6.
>
> Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 S=
oC")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
