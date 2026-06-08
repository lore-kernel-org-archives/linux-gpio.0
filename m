Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F53CCFD8
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930223; cv=none; b=QaCgPpHAQe6395CtB58mQHu/a1PxzPTwY7z1lI1474fvSgbVykII9PpqBCx/YNRA3pOWNCB2aho/437r3XHdStDTVPcVvlYofrIjKUB/axK3N6/AewiQAfw7GOw4seEDGOWmhElwS/WnUgSAUUYnrrRW+pUKPGc2F640JFB5MEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930223; c=relaxed/simple;
	bh=4C7eQEqBOO791XCceqw8Z0xQegoGOJJDuZXVi6UvHbM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5agO/MnGPjsDD0W5X/Kw8sILbYR8auuoG+qS2YNVSXU7V+a6EO32YgekhyfnlDo1fuzs/UtbKVcdcBpHd4kMbuvZBXcRyYArvKMChiinYsyQl9ckxz3CKbKEYqLs7ZpEml00zOI1vdZDJZJQ9c9pqrM9hi6YJfwUvEeRT2B/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Apv/a6Cz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Apv/a6Cz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D821F0089C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930221;
	bh=4C7eQEqBOO791XCceqw8Z0xQegoGOJJDuZXVi6UvHbM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Apv/a6CzrFxEHOE/yiae0WfnO7IfzkWtlYLu1TKe8iraFSwDFFLItddhAfC5E0vj0
	 rzo93rpq7as5A+YzSqdocWiCY/zJDmVIvID5uh7xKn+sk0HfFCpxjSTWo9xoRx4c9x
	 EHe6nqSyaiazcOFYQsroQabuw7lT5D+gE34xI/qoSj2qou39mLLdr3AOYWrY1w+iGk
	 XwYNbX/FsZYcPbo+J5RGRaeKtbcL7BOa6lxJI+68Bxt/K2/c+cPAreI0/mbMjB0DHm
	 RYiwJmMnr8kMDqt7NuFqMB2RRhpxhBunTj9u9mdALQl+/HJ7sbQkkXCRGJgq9LHqbl
	 d1rPQHAhgdQkQ==
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd523634so6871422c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MLsd8LxLeJkcFYipHwbJdiFO6vmrqr3SSGPPPl+ZGT+c3uzkhMpJk3cdIMcEwC9aPgMjlRRVPzdxV@vger.kernel.org
X-Gm-Message-State: AOJu0YzPjDANJWMTKW7ktli3qjbyB0qswgn3aerG8wt0mZ7GC/WfxjTp
	45nG6oQbN1Io07vMp9BTosR7uc8RcHkvF4TS8qe5pbxLwhmR9+kzx7zyWn7/Pk89HiVwDIslGvb
	la2CioX75v0C9yYCyI1kWtgNHD+d3QL+GjuMspCMl7Q==
X-Received: by 2002:a05:7022:6882:b0:138:62a:ddac with SMTP id
 a92af1059eb24-1380671fc24mr7463853c88.20.1780930220886; Mon, 08 Jun 2026
 07:50:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:17 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:17 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:17 -0500
X-Gmail-Original-Message-ID: <CAMRc=McXWg5sitpO-Z7KUbQOAcmnyyisOpYhXq7GuLRVZH6rFw@mail.gmail.com>
X-Gm-Features: AVVi8CdYOVZheZlncuRFK8_OMQQp0mb0en76LtMMGY55th0ffQ5nIRalk61TbDk
Message-ID: <CAMRc=McXWg5sitpO-Z7KUbQOAcmnyyisOpYhXq7GuLRVZH6rFw@mail.gmail.com>
Subject: Re: [PATCH 04/18] pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 02:16:40 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 21 (gpio19) duplicate pinconf settings of pin 20. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
