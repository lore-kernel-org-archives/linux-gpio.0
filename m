Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4B1CAA78
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987460; cv=none; b=ncf3OGTiN5UqHM5Q73V/lrr36iVUpuNCh6NPhY2Zc5sxyJlbhr61LiF0SG5svF11XD8qBTvYXX4MXVz3boPZGKWqIhnYXt5WLpsx8YyJ5wSRD0wh40u/DduAs7KFkbMOxTsw0JsBVQWOmzozkkQpt2ye2M074/cBeVtjXkPEPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987460; c=relaxed/simple;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdxJznMgsegOt3jdk+irOC6ANPL+j9MPhtyvNAn9xURaAaVLaKY2p03u89T3nsDHfRJ+nBAWecpyMv7oEuFb3QbjgBxpznKoiKODmENg6KMFjbNCEl9ZAWSpFrYjdH7/Jgn5+kBOqzbrC30DJcES7HOTW45FnSE14CiNkTS3wtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORLG+fWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORLG+fWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360A41F00AC4
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987459;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ORLG+fWhZosGalSGWmyV3Kh++97/MDHrKaLPYfDJtWfoak36JOSML9k8SudIKrrp7
	 wubLUe56gXM8COgYywev6qjsm9UZDTBYS277roo1SLeT6iNgjdN2Z+QKLcpkgZtkNW
	 uHE0C8c3XpcS/RRzONKUC3CTxBZQm2g0V67rfNBAIjcsTEAdylfX/qIAaGoTV0TGtL
	 Mdu0hdJm5RTpFNtErkG3HBY3G0u83xcEnbZEOdlXMMm8TFrmZh/7simaAEcqrmif9X
	 kXaXnn0aBKcs2+twQpN7vZkPNcpI3zWOxZ+p8QRwnGqp80lqCRQqEeyq0rCDkLnzA9
	 Am7RbQGbgE/XQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1103214e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 06:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq5R6mjldy9glK+ndidNIWDJlyDSGzC4LV8SHDuB02BeNUwJYBB87dwOv+1IvYHVvX8aGqaZy+/4l6f@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd1+R/6YUSL8Gas0eos02xlBM3VW9MsSlw6vE72F+QidnwW0BV
	nA8EsrmhHauvgNmBaiVUPEcaiQpTx/TP9j4uz+RsjXFZYM1vmqc/WBfdTjgvl+yqIK2Ycfv/TrP
	RDyre6kC2nT3U30PQR3r6BQpFD2OGBHE=
X-Received: by 2002:a05:6512:3c8e:b0:5ae:c239:f052 with SMTP id
 2adb3069b0e04-5b2c1b569bfmr442527e87.62.1784987457975; Sat, 25 Jul 2026
 06:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <20260723184538.3888637-25-ekffu200098@gmail.com>
In-Reply-To: <20260723184538.3888637-25-ekffu200098@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:50:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
X-Gm-Features: AUfX_mxl0SbySY5a9lGPh5hdtT44cpsgYcs6gRZ2aF1kuTPcG7UsdR_1xQAGZMQ
Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
Subject: Re: [PATCH 24/36] pinctrl: mediatek: remove conditional return with
 no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, cocci@inria.fr, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 8:47=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:

> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Patch applied!

Yours,
Linus Walleij
